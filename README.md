# Game Boy Cartridge and Programmer

This repo contains schematics and code for a programmable Game Boy cartridge and
associated programmer. The Cartridge utilises an AT28C256-15PU 32k EEPROM, so
ROM size is limited to 32kB. I have designed the programmer around an Arduino
Nano, although it may be possible to use other models.

---

### Uploading the ROM to the Cartridge

To upload the ROM, use
`python3 programmer/send_rom.py -p path/to/rom.gb -s /path/to/serial/port`

This sends the ROM to the Arduino to load onto the EEPROM, using the *Janky
Communications Protocol* (JCP), a highly custom, highly nonstandard handshake
system I created. This is far from best practice, but it gets the job done...

### How JCP Works

NB: In all serial 'exchanges' shown below, *[programmer]* denotes the Arduino,
and *[controller]* denotes the host computing sending the ROM.

JCP first establishes a connection between the two devices using Syn/Ack. The
exchange is as follows:

```
[programmer]: SYN
[controller]: SYNACK
[programmer]: ACK
```

Connection is now established, and ROM data can be sent to the programmer. Each
byte of ROM data sent follows a similar handshake process to avoid problems with
serial buffer overflow and timing. The exchange is as follows:

```
[programmer]: SEND
[controller]: XX
[programmer]: LOAD <XXXX: XX>
```

The data shown in the exchange above is denoted by (X) placeholders, and in
reality is any combination of hexadecimal data. The data denoted *XX* represents
a single byte of data, which is the data sent by the controller in the first
case, and the data received by the programmer in the second. This data should be
checked for parity in order to ensure data received by the programmer (and hence
sent to the EEPROM) matches what was intended. The data denoted *XXXX* is the
address the data is written to, and again should be checked against the intended
value. send_rom.py handles this validation and will show a serial traceback if
there is a mismatch.

For example, if the controller wanted to send the data `0B F3 54 2C`, that
would look like:

```
[programmer]: SYN
[controller]: SYNACK
[programmer]: ACK
[programmer]: SEND
[controller]: 0B
[programmer]: LOAD <0000: 0B>
[programmer]: SEND
[controller]: F3
[programmer]: LOAD <0001: F3>
[programmer]: SEND
[controller]: 54
[programmer]: LOAD <0001: 54>
[programmer]: SEND
[controller]: 2C
[programmer]: LOAD <0003: 2C>
```
There are currently known bugs with this process, some of which are covered in
the 'future developments' section of this document.

---

### Reading the schematics
Schematics are drawn in KiCAD 5, and all additional footprints are included in
the `lib` folder.

---

### Future Developments
- send_rom.py currently does not stop at 7FFF
- add connection termination feature from controller -> programmer
- speed up JCP
- Use custom ATMega or other MCU setup instead of Arduino in programmer
