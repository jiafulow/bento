#!/bin/bash

mkdir otsdaq-mrb
cd otsdaq-mrb

mkdir products
cd products
Products=$PWD
curl http://scisoft.fnal.gov/scisoft/packages/ups/v5_1_5/ups-5.1.5-Linux64bit%2B2.6-2.12.tar.bz2|tar -jx
curl http://scisoft.fnal.gov/scisoft/packages/mrb/v1_05_00/mrb-1.05.00-noarch.tar.bz2|tar -jx
source ./setup 
curl http://scisoft.fnal.gov/scisoft/bundles/tools/pullProducts -o pullProducts
chmod +x pullProducts
./pullProducts . slf6 artdaq-v1_12_14 s15-e7 prof
rm -f *.bz2

cd ..
Base=$PWD
setup git
setup gitflow
setup mrb
export MRB_PROJECT=otsdaq
mrb newDev -v v1_00_00 -q e7:s15:prof -f

. $Base/local*/setup
cd $MRB_SOURCE
mrb gitCheckout http://cdcvs.fnal.gov/projects/otsdaq
mrb gitCheckout -d otsdaq_demo http://cdcvs.fnal.gov/projects/otsdaq-demo
mrb gitCheckout -d otsdaq_utilities http://cdcvs.fnal.gov/projects/otsdaq-utilities

cd $Products
tar -xf $MRB_SOURCE/otsdaq_demo/xdaq*
cp -a smc_compiler/v6_1_0.version/ smc_compiler/current.chain/

cd $MRB_BUILDDIR
mrbsetenv
export CETPKG_J=24
mrb build


# _____________________________________
#MRB_PROJECT=otsdaq
#MRB_PROJECT_VERSION=v1_00_00
#MRB_QUALS=e7:s15:prof
#MRB_TOP=/home/vagrant/otsdaq-mrb
#MRB_SOURCE=/home/vagrant/otsdaq-mrb/srcs
#MRB_BUILDDIR=/home/vagrant/otsdaq-mrb/build_slf6.x86_64
#MRB_INSTALL=/home/vagrant/otsdaq-mrb/localProducts_otsdaq_v1_00_00_e7_s15_prof
#
#PRODUCTS=/home/vagrant/otsdaq-mrb/localProducts_otsdaq_v1_00_00_e7_s15_prof:/home/vagrant/otsdaq-mrb/products

