################################################################################
##                            ROM UPLOADING SCRIPT                            ##
################################################################################
# (C) 2018-2020 Henry Franks

################################################################################
# IMPORTS

# TODO: ADD SYN/SYNACK/ACK

import argparse
from arduino import Arduino
from sys import exit
from time import sleep

################################################################################
# ARGUMENT PARSING

parser = argparse.ArgumentParser()

parser.add_argument("-p", "--path", type=str,
                    help="path to ROM file")

parser.add_argument("-s", "--serial", type=str,
                    help="path to serial port")

args = parser.parse_args()

################################################################################

arduino = Arduino(args.serial, baud=9600, timeout=0.5)
arduino.flush()

rom = open(args.path, "rb").read()

print("CONNECTING TO ARDUINO...")
arduino.wait_for(b'SYN')
print("  ...syn")
arduino.write(b'SYNACK')
print("  ...synack")
arduino.wait_for(b'ACK')
print("  ...ack")
print("CONNECTED")

for i, byte in enumerate(rom):
    arduino.wait_for(b'SEND')

    print("{:04x}: 0x{:02x}".format(i, byte))
    arduino.send_byte(byte)

    data = b''
    while b'LOAD' not in data:
        data = arduino.read_data()
        
    data_str = "{}".format(data)
    check_data = data_str[data_str.index("<") + 1:data_str.index(">")]
    
    if int(check_data[:check_data.index(":")], 16) != i:
        print("\nERROR: Addresses do not match")
        print("Send: 0x{:04x}, Recv: 0x{:04x}".format(
            i, int(check_data[:check_data.index(":")], 16)))
        print(":: TRACEBACK ::")

        arduino.print_traceback()
        exit(1)

    if int(check_data[check_data.index(":")+1:], 16) != byte:
        print("\nERROR: Data does not match")
        print("Send: 0x{:02x}, Recv: 0x{:02x}".format(
            byte, int(check_data[check_data.index(":")+1:], 16)))
        print(":: TRACEBACK ::")

        arduino.print_traceback()
        exit(1)
        
    arduino.flush()
