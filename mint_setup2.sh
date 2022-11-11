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
sudo apt install gtkhash -y
sudo apt install remmina -y		#use for SSH and RDP connections
sudo apt install notepadqq -y
sudo apt install keepass2 -y
sudo apt install gftp -y
sudo apt install pdfarranger -y		#Merge or Split PDF Documents
sudo apt install okular -y		#Document Reader - PDF’s, etc
sudo apt install handbrake -y
sudo apt install cheese -y		#Camera Software
sudo apt install guvcview -y		#Camera Software
sudo apt install scribus -y
sudo apt install scribus-template -y
sudo apt install krita -y		#Professional Paint Program
sudo apt install virtualbox -y
sudo apt install virtualbox-ext-pack -y
sudo apt install virtualbox-guest-additions-iso -y
sudo apt install kleopatra -y
sudo apt install conky-all -y
sudo apt install vnstat -y		#required by conky network statistics section
sudo apt install psensor -y		#graphical sensor monitor
sudo apt install tree -y		#helps determine system monitors for conky
sudo apt install cmatrix -y		#cmatrix turns terminal into matrix terminal
sudo apt install steam -y		#Steam Gaming
sudo apt install pingus -y		#Pingus Game
sudo apt install frozen-bubble -y	#Frozen Bubble Game
sudo apt install python3-pip -y
sudo apt install python3-tk -y		#test ‘python3’ tkinkter app before install
sudo apt install tk -y			#test ‘python3’ tkinkter app before install
sudo apt install docker.io -y
sudo apt install sqlitebrowser -y
sudo apt install openoffice.org-hyphenation -y	#Fixes the Local Language Packs message after Initial Installation
sudo apt install falkon -y		#Web browser

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
read -p "Is this a Dell Latitude E6530 that requires NVidia 340 Drivers... (y/n)? "
if [ "$REPLY" = "y" ]; then
	
  echo ""
  echo "Installing NVidia-340 Drivers...  Please be patient..."
  echo ""
  echo ""
  sudo apt install nvidia-340 -y

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

PS3="Select the conky file to use: "

clear
echo ""
echo ""

select opt in vm e6530 macpro quit; do

  case $opt in
    vm)
      cp $install_path/.conkyrc_vm ~/.conkyrc
      break
      ;;
    e6530)
      cp $install_path/.conkyrc_e6530 ~/.conkyrc
      break
      ;;
    macpro)
      cp $install_path/.conkyrc_macpro ~/.conkyrc
      break
      ;;
    quit)
      break
      ;;
    *)
      echo "Invalid option $REPLY"
      ;;
  esac
done

mv $install_path/2.json ~/.cinnamon/configs/grouped-window-list@cinnamon.org/
mv $install_path/linuxmint.png ~/Pictures/
mv $install_path/StartupConky.desktop ~/.config/autostart/

sudo mv $install_path/sun-hours_etc_cron.daily /etc/cron.daily/sun-hours
sudo chown root.root /etc/cron.daily/sun-hours
sudo chmod 755 /etc/cron.daily/sun-hours

sudo mv $install_path/sun-hours_usr_local_bin /usr/local/bin/sun-hours
sudo chown root.root /usr/local/bin/sun-hours
sudo chmod 755 /usr/local/bin/sun-hours

echo ""
echo ""
echo Getting current Sunset and Sunrise times...  Please be patient...
sudo /usr/local/bin/sun-hours
sleep 10

gsettings set org.cinnamon.desktop.background picture-uri 'file:///usr/share/backgrounds/linuxmint/ktee_linuxmint.png'

clear
echo ""
read -p "Do you want to download and install the latest version of Chrome Browser... (y/n)? "
if [ "$REPLY" = "y" ]; then
	
  echo ""
  echo "Downloading and installing Chrome Browser...  Please be patient..."
  echo ""
  echo ""
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb

else
	cancel
fi

clear
echo ""
read -p "Do you want to install Sublime-Text... (y/n)? "
if [ "$REPLY" = "y" ]; then
	
  echo ""
  echo "Downloading and installing Sublime-Text...  Please be patient..."
  echo ""
  echo ""
  sudo apt install sublime-text -y

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
