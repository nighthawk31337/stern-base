# stern-base  

Stern Spike Recovery Image  
  
Devices:  
-------------------------------------------------------------------------------------  

/dev/dmd   - DMD Control
/dev/spi0  - DMD Data Channel  
/dev/spi1  - Local Switches  
/dev/i2c-0 - I2C Bus  
/dev/i2s   - Audio DAC  
/dev/gpio  - GPIO Pins  
/dev/amp   - Amplifier control  
/dev/adc   - Line Voltage Monitor  
/dev/backlight - Backlight brightness control  
/dev/ttyS4 - Spike NODEBUS
/dev/ttyS3 - lcd display?
  
Local Switches (/dev/sp1)  
-------------------------------------------------------------------------------------  
  
  Read with 8 byte reads or IOCTL SPC_IOC_MESSAGE(1) to reset and read N bytes (usually 3)  
  
I2C Bus (/dev/i2c-0)  
-------------------------------------------------------------------------------------  
  
slave addresses::  
  0x50 EEPROM with 2 byte addressing  
  0x51 EEPROM with 1 byte addressing  
  0x59 2 byte registers  
  0x28, 0x29, 0x2A - mcp4631 digital potentiometers used for volume control (accessed using read/write)  
  
ioctls::  
  0x703 (I2C_SLAVE) - select slave  
  [eeproms] (I2C_RDWR) - read/write to eeprom  
  [registers] (I2C_SMBUS) - read/write to register  

Backlight (/dev/backlight)  
-------------------------------------------------------------------------------------  
  
ioctls::  
  0x4001 - Set brightness  
  
GPIO (/dev/gpio)
-------------------------------------------------------------------------------------  
  
ioctls::  
  0x3C02 - Return pin status  
  0x3C03 - Set pin  
  0x3C04 - Clear pin  

NODEBUS - Message Format  
-------------------------------------------------------------------------------------  
  
msg[0] - 0x80 (nodebus message) | (node id)  
msg[1] - payload length in bytes (including checksum, but excluding response length)  
msg[2] - message id  
msg[3...n] - message data  
msg[n+1] - checksum byte  
msg[n+2] - expected response length  
  
NODEBUS - Checksum algorithm  
-------------------------------------------------------------------------------------  
  
unsigned char checksum(unsigned char* buffer, unsigned int length)  
{  
  unsigned int value = 0;  
  
  for (unsigned int i = 0; i < length; ++i)  
    value += buffer[i];  
    
  return (unsigned char)((256 - (checksum % 256)) % 256);  
}
  
NODEBUS - Initialization  
-------------------------------------------------------------------------------------  

CPU (node 0) sends::  
Reset (8002F18D00)  
UnblockTraffic (8003F0226B00)  
SetTraffic (8003F0117C00)  
Poll (00, special message, expects 1 byte response)  
  
Next unregistered node now sends its 1 byte node id (0x01, 0x08, etc - game specific)  
  
CPU (node 0) sends::  
ClearTraffic (XX03F010YY00)  
BlockTraffic (XX03F020YY00)  
  where XX = 0x80 | nodeId  
  and YY = message checksum  
  
CPU (node 0) sends::  
.. Poll (00, repeats until 0 bytes available to read)  

If no nodes respond then CPU responds::
00

CPU (node 0) sends::
UnblockTraffic (8003F0226B00)

lcdinsert.bin (ghostbusters)  
-------------------------------------------------------------------------------------  
  
0x200 byte header  
dword at offset 16 is the sum32-byte hash of the data following the header  
  
read in 0x200 bytes at a time and sent to node 24 as four 0x80 byte pages  
 
Spike Menu  
-------------------------------------------------------------------------------------  
Sends 2048 Byte Packets on /dev/spi0, (4x 512byte frames, 128x32 @ 1bpp).  
  
Menu Command Line Interface  
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
