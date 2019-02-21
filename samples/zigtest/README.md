
Install zig and add it to the PATH (must use most recent master
from https://ziglang.org/download)

Obtain this repo:

    git clone https://github.com/markfirmware/API

Run the demo:

    cd API/samples/zigtest
    make demo

This will make the ultibo kernel (kernel.bin) and run it using qemu-system-arm
with machine type versatilepb (versatile platform board.)

The qemu display (i.e. frame buffer) is not used. Ultibo logging is directed to
a serial port that is printed to stdout.

The main ultibo program calls the zig function named zigmain.
zigmain logs the command line arguments that are passed to it.
It then calls the ultibo tick counter to log three messages at a one second period.
It then returns an error code to ultibo which ultibo then logs.

The log will look like this:

    003CEE20 - Device: Sending device notification (Name=Framebuffer0 Class=DEVICE_CLASS_FRAMEBUFFER Notification=DEVICE_NOTIFICATION_ENABLE)
    003CEE20 - Device: Sending device notification (Name=Console0 Class=DEVICE_CLASS_CONSOLE Notification=DEVICE_NOTIFICATION_REGISTER)
    003CEE20 - Device: Registered device (Handle=010509B4 Class=DEVICE_CLASS_CONSOLE Name=Console0)
    003CEE20 - Device: Sending device notification (Name=Console0 Class=DEVICE_CLASS_CONSOLE Notification=DEVICE_NOTIFICATION_OPEN)
    00580048 - USB: Successfully initialized USB subsystem
    0000000000000524 - 003CEE20 - Device: Sending device notification (Name=Logging2 Class=DEVICE_CLASS_LOGGING Notification=DEVICE_NOTIFICATION_REGISTER)
    000000000000052B - 003CEE20 - Device: Registered device (Handle=013E165C Class=DEVICE_CLASS_LOGGING Name=Logging2)
    000000000000052B - 003CEE20 - Device: Sending device notification (Name=Serial0 Class=DEVICE_CLASS_SERIAL Notification=DEVICE_NOTIFICATION_OPENING)
    000000000000052E - 005C3D18 - Device: Sending device notification (Name=MMC0 Class=DEVICE_CLASS_MMC Notification=DEVICE_NOTIFICATION_REGISTER)
    000000000000052E - 005C3D18 - Device: Registered device (Handle=013D097C Class=DEVICE_CLASS_MMC Name=MMC0)
    00000000000005C3 - 003CEE20 - Device: Sending device notification (Name=UART0 Class=DEVICE_CLASS_UART Notification=DEVICE_NOTIFICATION_ENABLE)
    00000000000005C4 - 005C3D18 - Device: Sending device notification (Name=Storage0 Class=DEVICE_CLASS_STORAGE Notification=DEVICE_NOTIFICATION_REGISTER)
    00000000000005C4 - 005C3D18 - Device: Registered device (Handle=010FAC20 Class=DEVICE_CLASS_STORAGE Name=Storage0)
    00000000000005C7 - 003CEE20 - Device: Sending device notification (Name=Serial0 Class=DEVICE_CLASS_SERIAL Notification=DEVICE_NOTIFICATION_OPEN)
    00000000000005C7 - 003CEE20 - Device: Sending device notification (Name=Logging2 Class=DEVICE_CLASS_LOGGING Notification=DEVICE_NOTIFICATION_ENABLE)
    00000000000005C8 - 005C3D18 - Device: Sending device notification (Name=SDHCI1 Class=DEVICE_CLASS_SDHCI Notification=DEVICE_NOTIFICATION_ENABLE)
    00000000000005D3 - 005C3D18 - Device: Sending device notification (Name=MMC1 Class=DEVICE_CLASS_MMC Notification=DEVICE_NOTIFICATION_REGISTER)
    00000000000005D3 - 005C3D18 - Device: Registered device (Handle=01405A38 Class=DEVICE_CLASS_MMC Name=MMC1)
    00000000000005D9 - 005C3D18 - Device: Sending device notification (Name=Storage1 Class=DEVICE_CLASS_STORAGE Notification=DEVICE_NOTIFICATION_REGISTER)
    00000000000005D9 - 005C3D18 - Device: Registered device (Handle=00C90624 Class=DEVICE_CLASS_STORAGE Name=Storage1)
    00000000000005DE - 005C3D18 - Device: Sending device notification (Name=SDHCI0 Class=DEVICE_CLASS_SDHCI Notification=DEVICE_NOTIFICATION_ENABLE)
    0000000000000691 - 0064C710 - Device: Allocated device notification (Handle=0141758C Device=00000000 Class=DEVICE_CLASS_STORAGE Notification=DEVICE_NOTIFICATION_REGISTER, DEVICE_NOTIFICATION_DEREGISTER, DEVICE_NOTIFICATION_INSERT, DEVICE_NOTIFICATION_EJECT, DEVICE_NOTIFICATION_EJECTING)
    0000000000000754 - 00580048 - Device: Sending device notification (Name=Network0 Class=DEVICE_CLASS_NETWORK Notification=DEVICE_NOTIFICATION_OPEN)
    000000000000075B - 00580048 - Device: Sending device notification (Name=Network0 Class=DEVICE_CLASS_NETWORK Notification=DEVICE_NOTIFICATION_UP)
    0000000000000848 - 006903E0 - Network: IP: Configuring adapter Loopback with CONFIG_TYPE_LOOPBACK
    000000000000085B - 006903E0 - Network: IP: Configuration completed for adapter Loopback
    000000000000085B - 006903E0 - Network: IP:  Config = CONFIG_TYPE_LOOPBACK
    000000000000085B - 006903E0 - Network: IP:  Address = 127.0.0.1
    000000000000085F - 006903E0 - Network: IP:  Netmask = 255.0.0.0
    000000000000085F - 006903E0 - Network: IP:  Gateway = 0.0.0.0
    000000000000085F - 006903E0 - Network: IP:  Server = 0.0.0.0
    0000000000000861 - 006903E0 - Network: IP: Configuring adapter Network0 with CONFIG_TYPE_STATIC
    0000000000000C6B - 006903E0 - Network: IP: Configuration completed for adapter Network0
    0000000000000C6B - 006903E0 - Network: IP:  Config = CONFIG_TYPE_STATIC
    0000000000000C6D - 006903E0 - Network: IP:  Address = 10.0.2.15
    0000000000000C6D - 006903E0 - Network: IP:  Netmask = 255.255.255.0
    0000000000000C71 - 006903E0 - Network: IP:  Gateway = 10.0.2.2
    0000000000000C71 - 006903E0 - Network: IP:  Server = 255.255.255.255
    0000000000000D9B - 003CEE20 - zig command line argument 1 is kernel.bin
    0000000000000D9C - 003CEE20 - zig command line argument 2 is NETWORK0_IP_CONFIG=STATIC
    0000000000000D9C - 003CEE20 - zig command line argument 3 is NETWORK0_IP_ADDRESS=10.0.2.15
    0000000000000D9C - 003CEE20 - zig command line argument 4 is NETWORK0_IP_NETMASK=255.255.255.0
    0000000000000D9C - 003CEE20 - zig command line argument 5 is NETWORK0_IP_GATEWAY=10.0.2.2
    0000000000000D9D - 003CEE20 - zig clock message 1
    0000000000001185 - 003CEE20 - zig clock message 2
    000000000000156E - 003CEE20 - zig clock message 3
    000000000000156E - 003CEE20 - zigmain stopped with exit code 1
