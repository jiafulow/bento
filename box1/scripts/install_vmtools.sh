#!/bin/bash

set -x

#
# Based on bento/scripts/common/vmtools.sh 2016.01.17
#

# set a default HOME_DIR environment variable if not set
HOME_DIR="${HOME_DIR:-/home/vagrant}";
PACKER_BUILDER_TYPE="virtualbox-iso"

case "$PACKER_BUILDER_TYPE" in

virtualbox-iso|virtualbox-ovf)
    #sudo yum -y install kernel-devel-`uname -r` gcc make perl;
    sudo yum -y install kernel-devel gcc make perl;
    sudo yum -y clean all;

    mkdir -p /tmp/vbox;
    ver="`cat /home/vagrant/.vbox_version`";
    wget -q http://download.virtualbox.org/virtualbox/${ver}/VBoxGuestAdditions_${ver}.iso;
    sudo mount -o loop $HOME_DIR/VBoxGuestAdditions_${ver}.iso /tmp/vbox;
    sudo sh /tmp/vbox/VBoxLinuxAdditions.run \
        || echo "VBoxLinuxAdditions.run exited $? and is suppressed." \
            "For more read https://www.virtualbox.org/ticket/12479";
    sudo umount /tmp/vbox;
    rm -rf /tmp/vbox;
    rm -f $HOME_DIR/VBoxGuestAdditions_${ver}.iso;
    ;;

*)
    echo "Unknown Packer Builder Type >>$PACKER_BUILDER_TYPE<< selected.";
    echo "Known are virtualbox-iso|virtualbox-ovf.";
    ;;

esac

set +x
