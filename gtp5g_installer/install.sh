#!/bin/bash

make uninstall || true

apt-get install -y linux-headers-$(uname -r)
make
make install

sleep infinity
