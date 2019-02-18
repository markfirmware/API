#
# Makefile
#
# This file is part of the Ultibo project, https://ultibo.org/
#
# The MIT License (MIT)
#
# Copyright (c) 2018 Garry Wood <garry@softoz.com.au>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

API_PATH = ../..
FPC_PATH = $(HOME)/ultibo/core/fpc/bin/
BOARD_TYPE = qemuvpb
OBJS = zigmain.o
PROJECT_NAME = zigtestproject.lpr
CMDLINE  = NETWORK0_IP_CONFIG=STATIC
CMDLINE += NETWORK0_IP_ADDRESS=10.0.2.15
CMDLINE += NETWORK0_IP_NETMASK=255.255.255.0
CMDLINE += NETWORK0_IP_GATEWAY=10.0.2.2

include ../../Rules.mk

demo: $(TARGET_NAME)
	qemu-system-arm \
	-kernel kernel.bin \
	-append "$(CMDLINE)" \
	-machine versatilepb \
	-cpu cortex-a8 \
	-m 256M \
	-net nic -net user,hostfwd=tcp::5080-:80 \
	-display none \
	-serial stdio

zigmain.o: zigmain.zig
	zig build-obj --release-safe -isystem ../../include -isystem /usr/lib/gcc/arm-none-eabi/5.4.1/include-missing --target-arch armv7 --target-os freestanding --target-environ gnueabihf zigmain.zig

cleaner:
	rm -rf zig-cache
