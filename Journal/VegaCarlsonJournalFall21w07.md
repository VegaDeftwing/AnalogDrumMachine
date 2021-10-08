# Vega Carlson - Group 165 - Fall '21, Week 7

## Saturday, Oct 2nd -- W:0.00 T:47.00

**0.0 hr** -- No Progress today

## Sunday, Oct 3rd -- W:0.00 T:47.00

**0.0hrs** -- No Progress today

## Monday, Oct 4th -- W:0.60 T:47.6

**0.6hr** -- Worked with Ried in the lab briefly to get the Atari Punk Console (dual 555) circuit started

## Tuesday, Oct 5th -- W:0.60 T:47.6

**0.0hrs** -- Very quickly did a sanity check regarding the dual APC (so 4x 555) circuit using VCV rack

## Wednesday, Oct 6th -- W:2.60 T:49.6

**0.5hr** -- Meeting with Bauer

**1.5hr** -- Working in lab with the rest of the group, trying to get drum circuits working, talking about project direction

## Thursday, Oct 7th -- W:6.1 T:53.1

**2.7hr** -- worked on finding off-the-shelf PCBs for button and encoder input that will simplify the project, so made the project spec rev. 4 document. This is still a work in progress. A decision was made to use the the [Unicorn pHat](https://shop.pimoroni.com/products/unicorn-hat-mini) and [Micro Dot pHAT](https://shop.pimoroni.com/products/microdot-phat?variant=25454635591) instead of a traditional screen, as it will work well with our UI goals (and, because I'm probably going to buy them out of pocket to save them from eating into our budget).  Those aforementioned off-the-shelf PCBs will be the [PyrooL/Alpha](https://github.com/PyrooL/Alpha) and [keeb.io BDN9](https://keeb.io/collections/bdn9-collection/products/bdn9-rev-2-3x3-9-key-macropad-rotary-encoder-and-rgb):

<img src="https://camo.githubusercontent.com/4abe6b0ffd284eb6b6bfaa53a3f885e6f54750074ca1a41a66490a2324138a96/68747470733a2f2f692e696d6775722e636f6d2f4c6e4e4f4b62582e6a7067" style="zoom:5%;" /><img src="https://cdn.shopify.com/s/files/1/1851/5125/products/image_5bcc8288-dd9d-4520-92d8-669a33f75b2e_1100x.jpg?v=1602108110" style="zoom:20%;" />

![DrumMachineConcept4](../Images/DrumMachineConcept4.png)



I actually already have a BDN9, albeit a 1st revision, that I have built myself. I also am quite familiar with QMK, the open source firmware which is used on both keyboards. It requires working in C, but does have some MIDI support. It may still be a tad awkward to hack in all the functionality that we want, but I'm confident it can be done.

---

**0.8hr** -- I really don't like the idea of using 2.54mm headers for the module bus so I asked in a big engineering group chat what others would recommend. A Pcie x4 slot was suggested, but I'd rather not use that fine pitch of pins. The group largely agreed on the old, standard 2.54mm card edge connector (which I didn't realize was a thing) would be good, and that 2x8 and 2x6 are both normal sizes, and meet our 11 pin requirement. I found the part both on [AliExpress](https://www.aliexpress.com/item/4000490392119.html) and [Ebay](https://www.ebay.com/itm/333). There was also some general discussion about the project as a whole, some advice given, but nothing all that relevant.

## Friday, Oct 8th-- W:8.00 T:55.0

**1.9hr** -- [TODO]

---

**Week ending 10/8 total = **8.0 hours

