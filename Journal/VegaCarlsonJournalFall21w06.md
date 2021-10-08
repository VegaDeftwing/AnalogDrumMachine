# Vega Carlson - Group 165 - Fall '21, Week 6

## Saturday, Sep 25th -- W:0.00 T:39.00

**0.00 hr** -- No Progress today

## Sunday, Sep 26th -- W:0.00 T:39.00

**0.00hrs** -- No Progress today

## Monday, Sep 27th -- W:0.50 T:39.5

**0.5hr** -- Worked with Ried in the lab briefly to progress on the sna 

## Tuesday, Sep 28th -- W:5.50 T:44.5

**5.0hr** -- Worked on getting the pico setup and working with CircuitPython. Some time was lost to a bad strip of WS2812b's and more to some basic mistakes when setting up the circuit. Regardless, basic input via buttons, display of those button states on an LED, and MIDI output over USB in response to button presses is working. Unfortunately, as expected, timers, interupts, etc. do not work and I'm already running into cases where that may be a problem. Largely it depends on if the pico will *literally* only be handling I/O - that is sending triggers, reading buttons, and changing LED colors but not sequencing. If this is the case, it should still be able to be real time *enough* that it won't be an issue, even if the triggers aren't on real interupts. Still, I think it's wise to at least try out MicroPython and see if using it is still practical or if it comes at to heavy of a cost in the lack of libraries for 'real' MIDI over USB (as opposed to sending the data over serial and turning that into MIDI on the full pi)

The buttons as hooked up today were also all direct inputs, and I'm unsure how well things would work with multiplexing with diodes or adding extra I/O via the planned MCP23017- there is both CircuitPython and MicroPython libraries for the MCP23017 fortunately. As an added bonus, the code for that MicroPython library looks like a good base if we need to impliment custom i2c devices.

As an aside, looking at the mcp4725, it appears that it only has one address pin so is limited to 2 per i2c lane. We may need to fix this by adding i2c address translator ics, like the LTC4316, which is frustratingly expensive if we need multiple or just using a single [MAX7357EUG+](https://www.mouser.com/ProductDetail/Maxim-Integrated/MAX7357EUG%2b?qs=LHmEVA8xxfbTaHOdNcyCJg%3D%3D) which should let us multiplex the i2c lanes outright. I'll need to look into this more. I also dug up the MCP45XX/46XX digipots which three i2c address select pins to avoid this issue if we use digipots instead of DACs and they're still under $1/ic **and** they have a fair amount of eeprom bits- more than the mcp4725- for us to use for whatever we might need. Obviously, a DAC and digipots aren't directly interchangable in a circuit though. Also, while 3 bits = 8 ics. The current plan calls for up to 5 active drum modules, so either a few modules would be limited or we'd still have to use the previously mentioned solutions.

One way to reduce the complexity may be to make the pico handle only less strict deadline I/O- that is buttons, LEDs, encoder, etc. Where the UI lag can be [~100ms](https://ux.stackexchange.com/questions/42684/what-as-a-rule-of-thumb-is-the-maximum-tolerable-time-the-ui-thread-is-blocked) and that is still acceptable compared to the much stricter deadline of the audio triggers, as failing there could cause weird phasing issues- so we may want to make the full pi (non pico) send the triggers directly. This of course could also bring its own problems, particularly when it comes to keeping the pottentially noisy power of the pi isolated from the audio path, and there's the concern that getting to the pi's GPIO may be awkward if there's already a small TFT screen hat attached, blocking all the pins. Another option would be to shift-register the trigger output pins to keep their timings consistant. It's a bit of a hack, but if it works that's what counts.

## Wednesday, Sep 29th -- W:6.2 T:45.2

**0.0hr** - Meeting w/ Bauer, was significantly late

**0.7hr** - Worked with group in lab, tried to get ried's snare hooked up to Kaleb's envelope generator, with comical results. Talked with group about issues with pico and plans with i2c

## Thursday, Sep 30th -- W:7.2 T:46.2

**1.0hr** - Did more research on i2c parts, digipots, DACs, the [Pi's audio output](https://wiki.linuxaudio.org/wiki/raspberrypi) systems, and what screens/hats we might want to use. I sort of just have a lot of options floating around in my head and need time to sit down and consider what is the best option to move forward. The [pHAT stack](https://shop.pimoroni.com/products/phat-stack?variant=658973392906) and [HiFiBerry DAC+ Zero](https://thepihut.com/collections/raspberry-pi-audio-hats/products/hifiberry-dac-zero) both look like interesting options. I do like the idea of having a more multi-output UI instead of a basic screen, the [Unicorn pHat](https://shop.pimoroni.com/products/unicorn-hat-mini), [Micro Dot pHAT](https://shop.pimoroni.com/products/microdot-phat?variant=25454635591), [GFX HAT (128x64 LCD)](https://shop.pimoroni.com/products/gfx-hat), and [HyperPixel 4.0 HAT](https://shop.pimoroni.com/products/hyperpixel-4?variant=12569539706963) (800x480) all look like interesting options, on top of the e-ink hat I already have on hand. Of course, with the pHAT stack, there's no reason we couldn't use multiple. I think the Micro Dot display and Unicorn pHAT could be cool if we're going for a neo-retro vibe and want to prevent the user from thinking "If I'm looking at a screen, why not just use a computer?", albeit they're not very practical. That said, neither is an analog drum machine in 2021, so I think novelty is worth something here. If we wanted to be really weird, the pHAT hat does support up to four hats, we could go all out, with the Unicorn, MicoDot, DAC, and the [Piano HAT](https://shop.pimoroni.com/products/piano-hat) maybe for changing sample pitch, since that's pretty easy to do. None of that is particularly expensive, and frankly I'd be okay buying it outright if I get to take the parts back when all is said and done.

We do still need to consider what Pi we'd like to use. I've been running on the assumption of a 3b+ as I have some kicking around, but both the 0(/w) and 4 are options, espically if we decided more RAM would be of use, not that we should be doing anything that needs more than 1GB of ram anyway. 640k ought to be enough for anybody.

While perusing pimoroni's options I also saw they have an [i2c multiplexer HAT](https://shop.pimoroni.com/products/i2c-multiplexer-phat-for-raspberry-pi)  which uses the [TCA4954A](https://www.ti.com/lit/ds/symlink/tca9548a.pdf?ts=1633061703467&ref_url=https%253A%252F%252Fwww.google.com%252F) , which might be a good option to consider againts the MAX chip mentioned above for i2c multiplexing.

I also got a HDMI→USB capture card in the mail today, which should be handy for not neading to drag out another monitor when ssh to the pi doesn't cut it.

Finally, I thought more about what the roles of the pico and pi are in the full system. I'm leaning twords the pico, ironically, only handling the non-audio path i/o - buttions, encoder, LEDs. This keeps timing easy, as the pi would directly trigger the drums *and* control the i2c lanes that change parameters. I don't know how much I trust the Pi's i/o to not get damaged though, and grounding could be an issue, so this might imply optoisolating pretty much everything. Optoisolators are cheap though, so it shouldn't matter. We'd already considered the potential need to transformer isolate the pi's audio out, so this is not a new development in that regard.

## Friday, Oct 1st -- W:8.00 T:47.0

**0.8hr** - Talked with group about much of what I looked into yesterday, met up for meeting (see Minutes) and worked with the group on some circuits.

---

**Week ending 10/1 total = **8.0 hours

