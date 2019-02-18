
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
