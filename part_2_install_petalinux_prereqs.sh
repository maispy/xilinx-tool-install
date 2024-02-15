#!/bin/bash
#
# Libraries for running called out in ??? (some official Xilinx doc)
#   > > Despite some hour of searching, I could not refind this official pdf...
#       the packages listed in 000035006 may prove more useful anyhow, as the
#       particular versions are called out. The conversion is left as an exercise
#       for the reader.
# 
# Relevant Documentation (UG):
# UG1144 - Petalinux Tools Reference Guide
# 000035006 - "PetaLinux 2023.1 - Product Update Release Notes and Known Issues" ( [Link](https://support.xilinx.com/s/article/000035006?language=en_US) )
#   > > At the page bottom, are an xlsx and txt. Download them, and they will list the required libs for your distro
# 63794 - "Install - What Ubuntu files are required for Vivado to run successfully?" ( [Link](https://support.xilinx.com/s/article/63794?language=en_US) )
#   > > A bit old, some of this is taken care of with the installer binary
#

pkgs=(\
"iproute2" \
"gcc" \
"g++" \
"net-tools" \
"libncurses5-dev" \
"zlib1g:i386" \
"libssl-dev" \
"flex" \
"bison" \
"libselinux1" \
"xterm" \
"autoconf" \
"libtool" \
"texinfo" \
"zlib1g-dev" \
"gcc-multilib" \
"build-essential" \
#SDL-devel \
#glibc-devel \
#glibc \
#glib2-devel \
"automake" \
"screen" \
"pax" \
"gawk" \
"python3" \
"python3-pexpect" \
"python3-pip" \
"python3-git" \
"python3-jinja2" \
"perl" \
"patch" \
"diffutils" \
"cpp" \
#perl-Data-Dumper \
#perl-Text-ParseWords \
#perl-Thread-Queue \
"xz-utils" \
#which \
"debianutils" \
"iputils-ping" \
"libegl1-mesa" \
"libsdl1.2-dev" \
"pylint" \
"cpio" )

if [[ "$EUID" = 0 ]]; then
    echo "Running as 'root', please run as sudo"
else
    sudo -k # make sure to ask for password on next sudo
    if sudo true; then
        sudo apt install -y "${pkgs[@]}"
        sudo apt install -y tftpd-hpa          # Needs this or PetaL whines
        sudo touch /var/lib/tftpboot
        sudo chown -R tftp /var/lib/tftpboot
        sudo chown -R tftp /srv/tftp/
        sudo dpkg-reconfigure dash             # At least Ubuntu uses dash, other  distros may skip?
    else
        echo "Wrong password"
        exit 1
    fi
fi
