from microdotphat import write_string, scroll, set_pixel, clear, show, WIDTH, HEIGHT # Microdot phat (text mostly)
# See https://learn.pimoroni.com/article/getting-started-with-micro-dot-phat
from gpiozero import Button #Unicorn Hat Buttons
from unicornhatmini import UnicornHATMini #Unicorn Hat LEDs
# The unicorn hat library has a built in font - see https://github.com/pimoroni/unicornhatmini-python/blob/master/examples/text.py
# This shouldn't be necessary since the microdot phat does text much better, but it's nice to have the option

from rich import pretty, print
pretty.install()


#from pyo import * #DSP stuff


# First things first, we need to ensure connection to all the peripherals, if they're not there, complain loudly.
