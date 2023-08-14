#!/usr/bin/env bash
# NAME: JTOS
# DESC: An installation and deployment script for JaxTech's Mint Cinnamon desktop.
# Adapted from Derek Taylor's (DistroTube) DTOS script...
# Top logo inspiration came from Chris Titus's ArchTitus script...
### TODO
### Redshift Startup

clear

echo -ne "
   ████████╗  █████╗  ██╗   ██╗  ████████╗ ███████╗  ██████╗ ██╗  ██╗
   ╚══██╔══╝ ██╔══██╗  ██╗ ██╔╝  ╚══██╔══╝ ██╔════╝ ██╔════╝ ██║  ██║
      ██║    ███████║   ████╔╝      ██║    ███████╗ ██║      ███████║
   ██ ██║    ██╔══██║  ██╔╝██╗      ██║    ██╔════╝ ██║      ██╔══██║
   ╚███╔╝    ██║  ██║ ██╔╝  ██╗     ██║    ███████╗ ╚██████╗ ██║  ██║
    ╚══╝     ╚═╝  ╚═╝ ╚═╝   ╚═╝     ╚═╝    ╚══════╝  ╚═════╝ ╚═╝  ╚═╝
"
echo " JTOS script will launch in 5 seconds..."

sleep 5


clear
echo ""
read -p "Does this machine have plenty of drive space for timeshift setup...  Say NO for Virtual Machine setup... (y/n)? "
if [ "$REPLY" = "y" ]; then
	
  echo ""
  echo Setting up Timeshift and taking first snapshot...  Please be patient...
  echo ""
  echo ""
  sudo timeshift --create --rsync --comment "Base Install Snapshot" --yes
  sudo sed -i 's/"schedule_weekly" : "false"/"schedule_weekly" : "true"/g' /etc/timeshift/timeshift.json

else
	cancel
fi


install_path=$(pwd)

sudo sed -i 's/http:\/\/packages.linuxmint.com/https:\/\/mirror.cs.jmu.edu\/pub\/linuxmint\/packages/g' /etc/apt/sources.list.d/official-package-repositories.list

sudo sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu/http:\/\/mirror.clarkson.edu\/ubuntu/g' /etc/apt/sources.list.d/official-package-repositories.list

sudo apt update
sudo apt upgrade -y

sudo apt install openssh-server -y
sudo apt install vim -y
sudo apt install dos2unix -y
sudo apt install xrdp -y		#Allows RDP Connections to Linux
sudo adduser xrdp ssl-cert


clear
echo ""
read -p "Is this a Dual Boot Machine where the Grub Menu is needed to control the OS... (y/n)? "
if [ "$REPLY" = "n" ]; then

  echo ""
  echo Modifying Grub Menu to not display...  Please be patient...
  echo ""
  echo ""
  sudo sed -i 's/GRUB_TIMEOUT=10/GRUB_TIMEOUT=0/g' /etc/default/grub
  sudo update-grub

else
	cancel
fi


clear
echo ""
read -p "Does this machine need Synergy setup to connect to Synergy Server...  Say NO on SYNERGY SERVER CONTROLLER & VM INSTALLS... (y/n)? "
if [ "$REPLY" = "y" ]; then
	
  echo ""
  echo ""
  echo " Enter the Synergy Server Hostname"
  echo ""
  echo ""
  read synergy_host
  echo ""
  echo ""
  echo Setting up Synergy...  Please be patient...
  echo ""
  echo ""
  sudo gdebi $install_path/synergy_1.14.5-stable.1b7140f2_ubuntu22_amd64.deb
  echo -e "\ngreeter-setup-script=/usr/bin/synergyc $synergy_host" | sudo tee -a /etc/lightdm/lightdm.conf.d/70-linuxmint.conf
  echo ""
  echo ""
  
else
	cancel
fi


clear
echo ""
read -p "Setup is Complete - Reboot the Machine NOW (y/n)? "
if [ "$REPLY" = "y" ]; then
	
  sudo reboot
  
else
	cancel
fi

exit
