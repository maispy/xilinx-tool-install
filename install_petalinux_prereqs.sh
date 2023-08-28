#!/bin/bash
#
# Libraries for running called out in ??? (some official Xilinx doc)
#

pkgs_1=(\
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
)

pkgs_2=(\
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
        sudo apt install -y "${pkgs_1[@]}"
        sudo apt install -y libstdc++6          # The ++ messes up the list, why broken up
        sudo apt install -y "${pkgs_2[@]}"
        sudo apt install -y tftpd-hpa          # Needs this or PetaL whines
        sudo touch /var/lib/tftpboot
        sudo chown -R tftp /var/lib/tftpboot
        sudo chown -R tftp /srv/tftp/
    else
        echo "Wrong password"
        exit 1
    fi
fi
