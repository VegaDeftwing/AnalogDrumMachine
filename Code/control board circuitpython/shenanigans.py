# SPDX-FileCopyrightText: 2017 Limor Fried for Adafruit Industries
#
# SPDX-License-Identifier: MIT

"""CircuitPython I2C Device Address Scan"""
# If you run this and it seems to hang, try manually unlocking
# your I2C bus from the REPL with
#  >>> import board
#  >>> board.I2C().unlock()

import time
import board
import digitalio

# To use default I2C bus (most boards)
#i2c = board.I2C()

# To create I2C bus on specific pins
import busio
# i2c = busio.I2C(board.SCL1, board.SDA1)  # QT Py RP2040 STEMMA connector
i2c = busio.I2C(board.GP15, board.GP14)   # Pi Pico RP2040

# pin14 = digitalio.DigitalInOut(board.GP14)
# pin14.direction = digitalio.Direction.OUTPUT

# pin15 = digitalio.DigitalInOut(board.GP15)
# pin15.direction = digitalio.Direction.OUTPUT

while not i2c.try_lock():
    pass

try:
    #i2c.writeto(0x00, bytes(byteList))
    while True:
        print(
            "I2C addresses found:",
            [hex(device_address) for device_address in i2c.scan()],
        )
        time.sleep(2)

finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
    i2c.unlock()

# while True:
#     pin15.value = True
#     pin14.value = True
#     time.sleep(1)
#     pin15.value = False
#     pin14.value = False
#     time.sleep(1)
