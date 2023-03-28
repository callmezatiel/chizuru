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
# Add EPEL Repo
sudo yum install -y epel-release yum-utils
sudo yum-config-manager --enable epel
sudo yum clean all && sudo yum update -y
# Updating Firmware
sudo fwupdmgr get-devices -y 
sudo fwupdmgr refresh --force -y 
sudo fwupdmgr get-updates -y
sudo fwupdmgr update -y
# Increase DNF speed
echo -e "# Added for speed: \nfastestmirror=True\nmax_parallel_downloads=5\nkeepcache=True" | sudo tee -a /etc/dnf/dnf.conf

echo "Installing multimedia libraries..."
sudo dnf install aalib-libs -y          # ASCII art library
sudo dnf install fluidsynth-libs -y     # MIDI software synthesizer
sudo dnf install freeglut -y            # OpenGL Utility Toolkit
sudo dnf install game-music-emu -y      # Video game music emulation
sudo dnf install libavc1394 -y          # Audio/Video Control library
sudo dnf install libdca -y              # DTS Coherent Acoustics decoder
sudo dnf install libdvbpsi -y           # DVB PSI tables decoding library
sudo dnf install libebml -y             # Extensible Binary Meta Language library
sudo dnf install libkate -y             # Karaoke and text codec for multimedia files
sudo dnf install libmatroska -y         # Matroska multimedia container format library
sudo dnf install libraw1394 -y          # Raw IEEE 1394 (Firewire) library
sudo dnf install libupnp -y             # Universal Plug and Play library
sudo dnf install live555 -y             # Live555 streaming media library
sudo dnf install schroedinger -y        # Dirac video codec library
sudo dnf install libspatialaudio -y     # MPEG-H 3D Audio library
sudo dnf install libdc1394 -y           # IEEE 1394 (Firewire) digital camera library
