# stern-base

Stern Spike Recovery Image

Interesting devices:

/dev/dmd
/dev/spi0 - DMD data channel
/dev/spi1
/dev/i2c-0 - Possible EEPROM at slave address 0x50?, some games use this, (Ghostbusters, GOT), some don't (Whoa Nellie)
/dev/i2s
/dev/gpio
/dev/amp
/dev/backlight

Spike Menu
Sends 2048 Byte Packets on /dev/spi0, (4x 512byte frames, 128x32 @ 1bpp).
