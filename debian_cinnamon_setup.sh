#!/bin/bash

#Need to modify to not use the mint repos but use http://debian.gtisc.gatech.edu/debian/
#sudo sed -i 's/http:\/\/packages.linuxmint.com/https:\/\/mirror.cs.jmu.edu\/pub\/linuxmint\/packages/g' /etc/apt/sources.list

sudo apt-get update
sudo apt-get upgrade -y

clear
echo ""
echo Installing 1/33 Setting up openssh-server...  Please be patient...
echo ""
echo ""
sudo apt-get install openssh-server -y

clear
echo ""
echo Installing 2/33 Setting up vim...  Please be patient...
echo ""
echo ""
sudo apt-get install vim -y

clear
echo ""
echo Installing 3/33 Setting up chromium-browser...  Please be patient...
echo ""
echo ""
sudo apt-get install chromium-browser -y

clear
echo ""
echo Installing 4/33 Setting up gtkhash...  Please be patient...
echo ""
echo ""
sudo apt-get install gtkhash -y

clear
echo ""
echo Installing 5/33 Setting up scribus...  Please be patient...
echo ""
echo ""
sudo apt-get install scribus -y

clear
echo ""
echo Installing 6/33 Setting up scribus-template...  Please be patient...
echo ""
echo ""
sudo apt-get install scribus-template -y

clear
echo ""
echo Installing 7/33 Setting up notepadqq...  Please be patient...
echo ""
echo ""
sudo apt-get install notepadqq -y

clear
echo ""
echo Installing 8/33 Setting up sublime-text...  Please be patient...
echo ""
echo ""
#not sure this is free
sudo apt-get install sublime-text -y

clear
echo ""
echo Installing 9/33 Setting up dos2unix...  Please be patient...
echo ""
echo ""
sudo apt-get install dos2unix -y

clear
echo ""
echo Installing 10/33 Setting up keepass2...  Please be patient...
echo ""
echo ""
sudo apt-get install keepass2 -y

clear
echo ""
echo Installing 11/33 Setting up conky-all...  Please be patient...
echo ""
echo ""
sudo apt-get install conky-all -y

clear
echo ""
echo Installing 12/33 Setting up vnstat...  Please be patient...
echo ""
echo ""
#required by conky network statistics section
sudo apt-get install vnstat -y

clear
echo ""
echo Installing 13/33 Setting up psensor...  Please be patient...
echo ""
echo ""
#graphical sensor monitor
sudo apt-get install psensor -y

clear
echo ""
echo Installing 14/33 Setting up python-pip...  Please be patient...
echo ""
echo ""
sudo apt-get install python-pip -y

clear
echo ""
echo Installing 15/33 Setting up python3-tk...  Please be patient...
echo ""
echo ""
#test ‘python3’ tkinkter app before install
sudo apt-get install python3-tk -y

clear
echo ""
echo Installing 16/33 Setting up tk...  Please be patient...
echo ""
echo ""
#test ‘python3’ tkinkter app before install
sudo apt-get install tk -y

clear
echo ""
echo Installing 17/33 Setting up docker.io...  Please be patient...
echo ""
echo ""
sudo apt-get install docker.io -y

clear
echo ""
echo Installing 18/33 Setting up sqlitebrowser...  Please be patient...
echo ""
echo ""
sudo apt-get install sqlitebrowser -y

clear
echo ""
echo Installing 19/33 Setting up pdfshuffler...  Please be patient...
echo ""
echo ""
#Merge or Split PDF Documents
sudo apt-get install pdfshuffler -y

clear
echo ""
echo Installing 20/33 Setting up okular...  Please be patient...
echo ""
echo ""
#Document Reader - PDF’s, etc
sudo apt-get install okular -y

clear
echo ""
echo Installing 21/33 Setting up kleopatra...  Please be patient...
echo ""
echo ""
sudo apt-get install kleopatra -y

clear
echo ""
echo Installing 22/33 Setting up synergy...  Please be patient...
echo ""
echo ""
sudo apt-get install synergy -y

clear
echo ""
echo Installing 23/33 Setting up mysql-workbench...  Please be patient...
echo ""
echo ""
sudo apt-get install mysql-workbench -y

clear
echo ""
echo Installing 24/33 Setting up netbeans...  Please be patient...
echo ""
echo ""
sudo apt-get install netbeans -y

clear
echo ""
echo Installing 25/33 Setting up steam...  Please be patient...
echo ""
echo ""
#Steam Gaming
sudo apt-get install steam -y

clear
echo ""
echo Installing 26/33 Setting up cmatrix...  Please be patient...
echo ""
echo ""
#cmatrix turns terminal into matrix terminal
sudo apt-get install cmatrix -y

clear
echo ""
echo Installing 27/33 Setting up krita...  Please be patient...
echo ""
echo ""
#Professional Paint Program
sudo apt-get install krita -y

clear
echo ""
echo Installing 28/33 Setting up guvcview...  Please be patient...
echo ""
echo ""
#Camera Software
sudo apt-get install guvcview -y

clear
echo ""
echo Installing 29/33 Setting up gftp...  Please be patient...
echo ""
echo ""
sudo apt-get install gftp -y

clear
echo ""
echo Installing 30/33 Setting up handbrake...  Please be patient...
echo ""
echo ""
sudo apt-get install handbrake -y

clear
echo ""
echo Installing 31/33 Setting up virtualbox...  Please be patient...
echo ""
echo ""
sudo apt-get install virtualbox -y

clear
echo ""
echo Installing 32/33 Setting up virtualbox-guest-additions-iso...  Please be patient...
echo ""
echo ""
sudo apt-get install virtualbox-guest-additions-iso -y

clear
echo ""
echo Installing 33/33 Setting up falkon...  Please be patient...
echo ""
echo ""
sudo apt-get install falkon -y

clear
echo ""
echo Modifying Grub Menu to not display...  Please be patient...
echo ""
echo ""
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub
sudo update-grub

clear
read -p "Is this a Dell Latitude E6530 that requires NVidia 340 Drivers... (y/n)? "
if [ "$REPLY" = "y" ]; then
	
	echo ""
	echo "Installing NVidia-340 Drivers...  Please be patient..."
  echo ""
  echo ""
  sudo apt-get install nvidia-340 -y

else
	cancel
fi

clear
echo ""
echo "Setup Complete - Machine will reboot in 30 seconds"
sleep 30


sudo reboot
