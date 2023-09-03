# Need to hold the kernal and updates from happening
# This links were helpful:
# - https://askubuntu.com/questions/742358/do-held-kernel-packages-upgrade-when-hw-specific-used-updates-are-present-in-the
# - https://wiki.ubuntu.com/Kernel/FAQ#Kernel.2FFAQ.2FGeneralVersionMeaning.What_does_a_specific_Ubuntu_kernel_version_number_mean.3F
sudo apt-mark hold linux-generic
sudo apt-mark hold linux-image-generic
sudo apt-mark hold linux-headers-generic
sudo apt-mark hold linux-image-6.2.0-26-generic
sudo apt-mark hold linux-headers-6.2.0-26-generic
sudo apt update -y

sudo snap install htop   # nice to have
sudo apt install build-essential -y
sudo apt install openssh-server -y
sudo apt install python-pip libtinfo5 libncurses5 -y
# sudo ln -s /usr/bin/make /usr/bin/gmake    # Maybe don't need?

# Some more libraries listed from the following help articles
# https://support.xilinx.com/s/question/0D52E00006iHjbcSAC/vivado-20211-installation-hangs-at-generating-installed-device-list?language=en_US
# https://support.xilinx.com/s/article/63794?language=en_US#:~:text=You%20can%20install%20the%20following%20packages%20using%20apt-get,sudo%20apt-get%20install%20libgtk2.0-0%3Ai386%20sudo%20apt-get%20install%20dpkg-dev%3Ai386
# sudo apt update
# sudo apt upgrade
# sudo apt install libncurses5
# sudo apt install libtinfo5
# sudo apt install libncurses5-dev libncursesw5-dev
# sudo apt install ncurses-compat-libs

echo "Install Vivado/Vitus now..."

echo "After your install, run the cable driver script at <PATH_TO_VIVADO>/2023.1/data/xicom/cable_drivers/lin64/install_script/install_drivers/"
echo "As sudo, run ./install_drivers"
echo "Make sure to put the Digilent board files in <PATH_TO_VIVADO>/2023.1/data/boards/"