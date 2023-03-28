# Enter your password user when any command confirm request
set -e
# Upgrade
sudo dnf upgrade -y 
# RPM Fusion / NonFree
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf groupupdate core -y 
sudo dnf install dnf-plugins-core -y
# Installing Nvidia Driver Akmod-Nvidia
sudo dnf install akmod-nvidia -y
sudo dnf install xorg-x11-drv-nvidia-cuda -y
# Add Flathub Repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 
# Updating Firmware
sudo fwupdmgr get-devices -y 
sudo fwupdmgr refresh --force -y 
sudo fwupdmgr get-updates -y
sudo fwupdmgr update -y
# Increase DNF speed
echo -e "# Added for speed: \nfastestmirror=True\nmax_parallel_downloads=5\nkeepcache=True" | sudo tee -a /etc/dnf/dnf.conf
# Clean Your System
sudo yum clean all && sudo yum update -y
