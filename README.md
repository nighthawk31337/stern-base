# stern-base  

Stern Spike Recovery Image  
  
Interesting devices:  
  
/dev/dmd  
/dev/spi0 - DMD data channel  
/dev/spi1 - Local switches  
/dev/i2c-0 - I2C Bus
/dev/i2s   - Audio DAC
/dev/gpio
/dev/amp  
/dev/backlight - Backlight brightness control
/dev/ttyS4 - Spike NODEBUS  
  
Local Switches (/dev/sp1)  
  Read with 8 byte reads or IOCTL SPC_IOC_MESSAGE(1) to reset and read N bytes (usually 3)
  
I2C Bus, slave addresses:
  0x50 EEPROM with 2 byte addressing
  0x51 EEPROM with 1 byte addressing
  0x28, 0x29, 0x2A - mcp4631 digital potentiometers used for volume control
  
Backlight (/dev/backlight)  
  IOCTL 0x4001 - Set brightness
  
 GPIO (/dev/gpio)
  IOCTL 0x3C02 - Return pin status
  IOCTL 0x3C03 - Set pin
  IOCTL 0x3C04 - Clear pin
  
Spike Menu  
Sends 2048 Byte Packets on /dev/spi0, (4x 512byte frames, 128x32 @ 1bpp).  
  
Spike Menu Command Line Interface  
commands:  
        adj: perform operations on adjustments.  
        aud: perform operations on audits.  
        coil: fire a coil.  
        credit: manipulate credits.  
        debug: get debug information.  
        display: display system interface.  
        dsp: DSP interface.  
        knocker: perform operations on the knocker.  
        lamp: lamp system interface.  
        proc: get information about processes.  
        red: redemption interface.  
        score: manipulate player scores.  
        sound: sound system interface.  

