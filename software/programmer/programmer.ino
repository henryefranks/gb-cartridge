#include "eeprom.h"
#include "shift_reg.h"

/* shift register config */
const byte shift_reg_clk = 3;

const shift_reg_t sr_addr(
  4, /* strobe */
  2  /* data   */
);

const shift_reg_t sr_data(
  A6, /* strobe */
  A7  /* data   */
);

/* EEPROM config */
const eeprom_t rom(
  5, /* ~WE */
  6  /* ~OE */
);

void CTS()
{
  Serial.flush();
  Serial.write(0xFF);
}

void setup()
{
  Serial.begin(9600);

  /* set pin modes */
  pinMode(shift_reg_clk, OUTPUT);

  /* set default pin states */
  digitalWrite(shift_reg_clk, LOW);
  
  digitalWrite(sr_addr.strobe, LOW);
  digitalWrite(sr_addr.data, LOW);
  digitalWrite(sr_data.strobe, LOW);
  digitalWrite(sr_data.data, LOW);
  
  digitalWrite(rom.we, HIGH);
  digitalWrite(rom.oe, HIGH);

  CTS();
}

bool checkParity(uint16_t addr, uint8_t data);
void clkout(bool addr_b, bool data_b);
void copySRToROM();

void serialEvent()
{}

bool checkParity(uint16_t addr, uint8_t data)
{
  uint32_t v = ((uint32_t)addr << 8) + data;

  /* bit hack credit to:
   *  https://graphics.stanford.edu/~seander/bithacks.html#ParityParallel
   */
  v ^= v >> 16;
  v ^= v >> 8;
  v ^= v >> 4;
  v &= 0xF;
  return (0x6996 >> v) & 1;
}

void clkout(bool addr_b, bool data_b)
{
  digitalWrite(sr_addr.data, addr_b);
  digitalWrite(sr_data.data, data_b);
  digitalWrite(shift_reg_clk, HIGH);
  delay(1);
  digitalWrite(shift_reg_clk, LOW);
}

void copySRToROM()
{
  digitalWrite(sr_addr.strobe, HIGH);
  digitalWrite(sr_data.strobe, HIGH);
  digitalWrite(rom.we, LOW);
  delay(1);
  digitalWrite(rom.we, HIGH);
  digitalWrite(sr_addr.strobe, LOW);
  digitalWrite(sr_data.strobe, LOW);
}

void loop()
{
  if (Serial.available() < 3) {
    return;
  }
    
  uint16_t addr = ((uint16_t)Serial.read() << 8) | Serial.read();
  uint8_t data = Serial.read();

  /* extract parity from msb and check against parity of everything else*/
  if (checkParity(addr, data)) {
    Serial.write(addr >> 8);
    Serial.write(addr & 0xFF);
    Serial.write(data);
    Serial.write(0xFE);
    return; // TODO: add proper error condition
  }

  /* zero parity bit */
  addr |= 0x7FFF;

  for (size_t i = 15; i > 0; i--)
    clkout(
      addr & (1 << i),
      data & ((i < 8) << i)
    );

  copySRToROM();

  if (Serial.available() == 0) CTS();
}
