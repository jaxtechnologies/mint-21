#!/bin/bash

### TODO
### Redshift Startup

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

#TOTAL APPS BEING ADDED TO INSTALLATION
total=36

clear
echo ""
echo Installing 1/$total openssh-server...  Please be patient...
echo ""
echo ""
sudo apt install openssh-server -y

clear
echo ""
echo Installing 2/$total vim...  Please be patient...
echo ""
echo ""
sudo apt install vim -y

clear
echo ""
echo Installing 3/$total dos2unix...  Please be patient...
echo ""
echo ""
sudo apt install dos2unix -y

clear
echo ""
echo Installing 4/$total gtkhash...  Please be patient...
echo ""
echo ""
sudo apt install gtkhash -y

clear
echo ""
echo Installing 5/$total remmina...  Please be patient...
echo ""
echo ""
#use for SSH and RDP connections
sudo apt install remmina -y

clear
echo ""
echo Installing 6/$total notepadqq...  Please be patient...
echo ""
echo ""
sudo apt install notepadqq -y

clear
echo ""
echo Installing 7/$total keepass2...  Please be patient...
echo ""
echo ""
sudo apt install keepass2 -y

clear
echo ""
echo Installing 8/$total gftp...  Please be patient...
echo ""
echo ""
sudo apt install gftp -y

clear
echo ""
echo Installing 9/$total pdfarranger...  Please be patient...
echo ""
echo ""
#Merge or Split PDF Documents
sudo apt install pdfarranger -y

clear
echo ""
echo Installing 10/$total okular...  Please be patient...
echo ""
echo ""
#Document Reader - PDF’s, etc
sudo apt install okular -y

clear
echo ""
echo Installing 11/$total handbrake...  Please be patient...
echo ""
echo ""
sudo apt install handbrake -y

clear
echo ""
echo Installing 12/$total cheese...  Please be patient...
echo ""
echo ""
#Camera Software
sudo apt install cheese -y

clear
echo ""
echo Installing 13/$total guvcview...  Please be patient...
echo ""
echo ""
#Camera Software
sudo apt install guvcview -y

clear
echo ""
echo Installing 14/$total scribus...  Please be patient...
echo ""
echo ""
sudo apt install scribus -y

clear
echo ""
echo Installing 15/$total scribus-template...  Please be patient...
echo ""
echo ""
sudo apt install scribus-template -y

clear
echo ""
echo Installing 16/$total krita...  Please be patient...
echo ""
echo ""
#Professional Paint Program
sudo apt install krita -y

clear
echo ""
echo Installing 17/$total virtualbox...  Please be patient...
echo ""
echo ""
sudo apt install virtualbox -y

clear
echo ""
echo Installing 18/$total virtualbox-ext-pack...  Please be patient...
echo ""
echo ""
sudo apt install virtualbox-ext-pack -y

clear
echo ""
echo Installing 19/$total virtualbox-guest-additions-iso...  Please be patient...
echo ""
echo ""
sudo apt install virtualbox-guest-additions-iso -y

clear
echo ""
echo Installing 20/$total kleopatra...  Please be patient...
echo ""
echo ""
sudo apt install kleopatra -y

clear
echo ""
echo Installing 21/$total conky-all...  Please be patient...
echo ""
echo ""
sudo apt install conky-all -y

clear
echo ""
echo Installing 22/$total vnstat...  Please be patient...
echo ""
echo ""
#required by conky network statistics section
sudo apt install vnstat -y

clear
echo ""
echo Installing 23/$total psensor...  Please be patient...
echo ""
echo ""
#graphical sensor monitor
sudo apt install psensor -y

clear
echo ""
echo Installing 24/$total tree...  Please be patient...
echo ""
echo ""
#helps determine system monitors for conky
sudo apt install tree -y

clear
echo ""
echo Installing 25/$total cmatrix...  Please be patient...
echo ""
echo ""
#cmatrix turns terminal into matrix terminal
sudo apt install cmatrix -y

clear
echo ""
echo Installing 26/$total steam...  Please be patient...
echo ""
echo ""
#Steam Gaming
sudo apt install steam -y

clear
echo ""
echo Installing 27/$total pingus...  Please be patient...
echo ""
echo ""
#Pingus Game
sudo apt install pingus -y

clear
echo ""
echo Installing 28/$total frozen-bubble...  Please be patient...
echo ""
echo ""
#Frozen Bubble Game
sudo apt install frozen-bubble -y

clear
echo ""
echo Installing 29/$total python3-pip...  Please be patient...
echo ""
echo ""
sudo apt install python3-pip -y

clear
echo ""
echo Installing 30/$total python3-tk...  Please be patient...
echo ""
echo ""
#test ‘python3’ tkinkter app before install
sudo apt install python3-tk -y

clear
echo ""
echo Installing 31/$total tk...  Please be patient...
echo ""
echo ""
#test ‘python3’ tkinkter app before install
sudo apt install tk -y

clear
echo ""
echo Installing 32/$total docker.io...  Please be patient...
echo ""
echo ""
sudo apt install docker.io -y

clear
echo ""
echo Installing 33/$total sqlitebrowser...  Please be patient...
echo ""
echo ""
sudo apt install sqlitebrowser -y

clear
echo ""
echo Installing 34/$total openoffice.org-hyphenation...  Please be patient...
echo ""
echo ""
#Fixes the Local Language Packs message after Initial Installation
sudo apt install openoffice.org-hyphenation -y

clear
echo ""
echo Installing 35/$total xrdp...  Please be patient...
echo ""
echo ""
#Allows RDP Connections to Linux
sudo apt install xrdp -y
sudo adduser xrdp ssl-cert

clear
echo ""
echo Installing 36/$total falkon...  Please be patient...
echo ""
echo ""
sudo apt install falkon -y

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
