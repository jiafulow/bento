#!/bin/bash

cd ~/otsdaq-mrb/
source products/setup
setup mrb
#setup git
source local*/setup
#mrb updateSource
mrbsetenv
StartOTS.sh


# _____________________________________
# Ref: https://cdcvs.fnal.gov/redmine/projects/otsdaq/wiki/Instructions_for_using_MRB_with_OTSDAQ
#
## Rebuild
#. $Base/local*/setup
#mrbsetenv
#mrb b
#
## Clean and rebuild
#. $Base/local*/setup
#mrbsetenv
#mrb z;mrbsetenv;mrb b
#
## Update/pull the source
#. $Base/local*/setup
#mrb updateSource


# _____________________________________
## Serve run control webpage
#sudo vi /etc/hosts
#--> change '127.0.0.1' to the IP address given by ifconfig

