#define ADDR1 3
#define ADDR2 2
#define DATA1 5
#define DATA2 4
#define OE A0
#define WE A1
#define CLK A2
#define MODE 1 // 1 for write, 0 for read
#define READADDR 0x0000 // Address to read (read mode only)

void readAddr(uint16_t address) {
  for (int i = 0; i < 7; i++) {
    digitalWrite(12-i, address & (1 << i));
  }

  uint8_t addr = address >> 7;

  digitalWrite(DATA1, LOW);
  digitalWrite(DATA2, LOW);

  for (int i = 3; i >= 0; i--) {
    int shift1 = 1 << i;
    int shift2 = 1 << i+4;

    digitalWrite(ADDR1, addr & shift1);
    digitalWrite(ADDR2, addr & shift2);

    digitalWrite(A2, HIGH);
    digitalWrite(A2, LOW);
  }

  digitalWrite(ADDR1, LOW);
  digitalWrite(ADDR2, LOW);
}

void loadData(uint16_t address, uint8_t data) {
  for (int i = 0; i < 7; i++) {
    digitalWrite(12-i, address & (1 << i));
  }

  char buf[8];
  sprintf(buf, "%04x:%02x", address, data);

  uint8_t addr = address >> 7;

  for (int i = 3; i >= 0; i--) { // Read from msb to lsb (to 2 shift registers)
    int shift1 = 1 << i;
    int shift2 = 1 << i+4;

    digitalWrite(ADDR1, addr & shift1);
    digitalWrite(ADDR2, addr & shift2);

    digitalWrite(DATA1, data & shift1);
    digitalWrite(DATA2, data & shift2);

    digitalWrite(A2, HIGH); // Flash clock
    digitalWrite(A2, LOW);
  }

  // Set OE high then low pulse on WE
  digitalWrite(OE, HIGH);
  digitalWrite(WE, LOW);
  digitalWrite(WE, HIGH);
  digitalWrite(OE, LOW);

  // Reset all data pins
  // Is this needed?
  digitalWrite(DATA1, LOW);
  digitalWrite(DATA2, LOW);
  digitalWrite(ADDR1, LOW);
  digitalWrite(ADDR2, LOW);
}

uint8_t readbyte(uint16_t address) {
  // Read byte from serial
  delay(100); // Delay to make sure data is able to be processed in time
  Serial.println("SEND");
  uint8_t c, byteIn;

  while (!Serial.available());
  c = uint8_t(Serial.read());

  char buf[8];
  sprintf(buf, "%04x:%02x", address, c);

  Serial.print("LOAD <");
  Serial.print(buf);
  Serial.println(">");
  return c;
}

void setup() {
  Serial.begin(9600);

  // Setup pins
  for (int pin = 2; pin < 13; pin++)
    pinMode(pin, OUTPUT);

  pinMode(OE, OUTPUT);
  pinMode(WE, OUTPUT);
  pinMode(CLK, OUTPUT);

  // Set EEPROM to output
  digitalWrite(OE, LOW);
  digitalWrite(WE, HIGH);

  // Clear shift registers
  readAddr(0);

  Serial.flush();
  Serial.println("SYN");

  String line;
  do {
    while (!Serial.available());
    line = Serial.readString();
  } while (line != "SYNACK");

  Serial.println("ACK");

  if (MODE) {
    // Load data
    Serial.flush();
    for (uint16_t i = 0; i < 0x7FFF; i++) { // Load ROM data for each address
      loadData(i, readbyte(i));
    }
  } else {
    // Read data back from address to check (with LED)
    readAddr(READADDR);
  }

  Serial.println("COMPLETE");
}

void loop() {}
