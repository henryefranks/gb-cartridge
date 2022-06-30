##
## v2.0 of the GB ROM programmer
## (C) 2022 H Franks
##

import argparse
from xmlrpc.client import Boolean
from serial import Serial
from struct import pack

###############################################################################
# ARGUMENT PARSING

parser = argparse.ArgumentParser(description="Send ROM to Arduino")

parser.add_argument("-p", "--path", type=str,
                    help="path to ROM file")

parser.add_argument("-s", "--serial", type=str,
                    help="path to serial port")

args = parser.parse_args()

###############################################################################

def parity2(addr, data):
    v = addr << 8 + data
    v ^= v >> 16
    v ^= v >> 8
    v ^= v >> 4
    v &= 0xF
    return bool((0x6996 >> v) & 1)

def parity(addr, data):
    x = (addr << 8) | data
    y = x ^ (x >> 1)
    y = y ^ (y >> 2)
    y = y ^ (y >> 4)
    y = y ^ (y >> 8)
    y = y ^ (y >> 16)
    return (y & 1)

def send_byte(addr, data):
    addr |= (parity(addr, data) << 15)
    arduino.write(pack('>HB', addr, data))

def send_block(start_addr, data):
    while True:
        if arduino.in_waiting:
            b = arduino.read(1)
            print(b)
            if b == b'\xFF':
                break

    #arduino.flush()
                
    #while not (arduino.in_waiting and arduino.read(1) == ):
    #    pass
    
    print(f"Sending block from {start_addr:04x} to {start_addr + len(data):04x}")

    addr = start_addr
    end_addr = addr + len(data)
    while addr < end_addr:
        send_byte(addr, data[addr - start_addr])
        addr += 1



###############################################################################
# MAIN CODE

arduino = Serial(args.serial, baudrate=9600, timeout=0.5)

rom = open(args.path, "rb").read()

BLOCK_SIZE = 20
addr = 0x0000

arduino.flush()

while addr < 0x7FFF:
    start_addr = addr
    addr += BLOCK_SIZE
    if addr > 0x7FFF:
        addr = 0x7FFF

    send_block(start_addr, rom[start_addr:addr])
    
