#!/bin/bash

set -x

sudo yum -y install kernel-devel gcc make perl;
sudo yum -y clean all;

sudo /etc/init.d/vboxadd setup

set +x
