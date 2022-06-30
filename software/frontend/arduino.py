###############################################################################
##                          ARDUINO SERIAL SUBCLASS                          ##
###############################################################################
# (C) 2018-2020 Henry Franks

from serial import Serial
from struct import pack

class Arduino(Serial):
    def __init__(self, serial_path, baud=9600, timeout=0.5):
        self.send_history = [] # History of sent serial data
        self.recv_history = [] # History of received serial data
        super().__init__(serial_path, baud, timeout=timeout)

    def flush(self):
        self.flushInput()
        self.flushOutput()

    def send_byte(self, byte):
        self.write(pack('>B', byte))
        self.send_history.append("0x{:02x} : {}\n".format(byte, chr(byte)))

    def read_data(self):
        data = self.readline().strip(b'\n').strip(b'\r')
        self.recv_history.append(data)
        return data

    def wait_for(self, wait_string):
        # Wait for string from serial
        while self.read_data() != wait_string:
            self.flush()

    def print_traceback(self, traceback_length=20):
        # Print up to traceback_length items from history
        num_items = min(traceback_length, len(self.recv_history))

        print("=== SERIAL RECV HISTORY ===")
        for item in self.recv_history[-num_items:]:
            print(item)

        print() # Add newline spacing between tracebacks

        print("=== SERIAL SEND HISTORY ===")
        for item in self.send_history[-num_items:]:
            print(item)
