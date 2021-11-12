#!/bin/bash

lsmod | grep gtp5g
err=$?
if [ $err -ne 0 ]; then
  apt-get install -y linux-headers-$(uname -r)
  make
  make install
fi
sleep infinity
