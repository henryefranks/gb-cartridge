struct eeprom {
  byte we, oe;

  eeprom(byte w, byte o)
  {
    /* automatically set pins to outputs when assigning */
    we = w;
    pinMode(w, OUTPUT);
    
    oe = o;
    pinMode(o, OUTPUT);
  };
} __attribute__((__packed__));

typedef struct eeprom eeprom_t;

typedef struct {
  uint8_t addr_u, addr_l, data;
} rom_byte_t;
