#!/bin/bash
set -e

nim c -c -f --compileOnly --nimcache:nimcache --cpu:arm --gc:none --os:standalone barebone
mv nimcache/*.c .
sed -i '/^int main/,/^}/d' barebone.c

FPC_PATH=/root/ultibo/core/fpc/bin/ BOARD_TYPE=qemuvpb make

CMDLINE=""
CMDLINE+="NETWORK0_IP_CONFIG=STATIC"
CMDLINE+=" NETWORK0_IP_ADDRESS=10.0.2.15"
CMDLINE+=" NETWORK0_IP_NETMASK=255.255.255.0"
CMDLINE+=" NETWORK0_IP_GATEWAY=10.0.2.2"

qemu-system-arm \
     -kernel kernel.bin \
     -append "$CMDLINE" \
     -machine versatilepb \
     -cpu cortex-a8 \
     -m 256M \
     -net nic -net user,hostfwd=tcp::5080-:80 \
     -display none \
     -serial stdio
