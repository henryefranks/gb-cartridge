struct shift_reg {
  byte strobe, data;

  shift_reg(byte s, byte d)
  {
    /* automatically set pins to outputs when assigning */
    strobe = s;
    pinMode(s, OUTPUT);
    
    data = d;
    pinMode(d, OUTPUT);
  };
} __attribute__((__packed__));

typedef struct shift_reg shift_reg_t;
