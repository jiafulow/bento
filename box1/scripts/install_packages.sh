#!/bin/bash

set -x

# No docs
sudo cp /etc/yum.conf /etc/yum.conf.orig
sudo sed -i '/installonly_limit=3/a tsflags=nodocs' /etc/yum.conf

# Use mirrors
sudo cp /etc/yum.repos.d/sl.repo /etc/yum.repos.d/sl.repo.orig
sudo sed -i 's/\(^baseurl=\)\(http:\/\/ftp\.scientificlinux\.org\)\(.*\)/\1ftp:\/\/linux1.fnal.gov\3\n\t\t\2\3/' /etc/yum.repos.d/sl.repo
sudo cp /etc/yum.repos.d/sl6x.repo /etc/yum.repos.d/sl6x.repo.orig
sudo sed -i 's/\(^baseurl=\)\(http:\/\/ftp\.scientificlinux\.org\)\(.*\)/\1ftp:\/\/linux1.fnal.gov\3\n\t\t\2\3/' /etc/yum.repos.d/sl6x.repo

# List packages
yum list installed > yum-`date +%y%m%d-%H%M%S`.txt

# Upgrade
sudo yum -y upgrade
sudo yum clean all

# Required packages
sudo yum -y install \
  yum yum-utils sudo vim tar zip gzip bzip2 wget curl git \
  gcc gcc-c++ gcc-gfortran make cmake gettext freetype perl time \
  libuuid-devel openssl-devel glibc-devel

sudo yum clean all

# List packages
yum list installed > yum-`date +%y%m%d-%H%M%S`.txt

set +x
