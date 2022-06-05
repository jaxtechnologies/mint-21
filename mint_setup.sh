#!/bin/bash

sudo sed -i 's/http:\/\/packages.linuxmint.com/https:\/\/mirror.cs.jmu.edu\/pub\/linuxmint\/packages/g' /etc/apt/sources.list.d/official-package-repositories.list

sudo sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu/http:\/\/mirror.clarkson.edu\/ubuntu/g' /etc/apt/sources.list.d/official-package-repositories.list

sudo apt-get update
sudo apt-get upgrade -y

clear
echo ""
echo Installing 1/39 Setting up openssh-server...  Please be patient...
echo ""
echo ""
sudo apt-get install openssh-server -y

clear
echo ""
echo Installing 2/39 Setting up vim...  Please be patient...
echo ""
echo ""
sudo apt-get install vim -y

clear
echo ""
echo Installing 3/39 Setting up chromium-browser...  Please be patient...
echo ""
echo ""
sudo apt-get install chromium-browser -y

clear
echo ""
echo Installing 4/39 Setting up gtkhash...  Please be patient...
echo ""
echo ""
sudo apt-get install gtkhash -y

clear
echo ""
echo Installing 5/39 Setting up remmina...  Please be patient...
echo ""
echo ""
#use for SSH and RDP connections
sudo apt-get install remmina -y

clear
echo ""
echo Installing 6/39 Setting up remmina-plugin-rdp...  Please be patient...
echo ""
echo ""
sudo apt-get install remmina-plugin-rdp -y

clear
echo ""
echo Installing 7/39 Setting up remmina-plugin-vnc...  Please be patient...
echo ""
echo ""
sudo apt-get install remmina-plugin-vnc -y

clear
echo ""
echo Installing 8/39 Setting up scribus...  Please be patient...
echo ""
echo ""
sudo apt-get install scribus -y

clear
echo ""
echo Installing 9/39 Setting up scribus-template...  Please be patient...
echo ""
echo ""
sudo apt-get install scribus-template -y

clear
echo ""
echo Installing 10/39 Setting up notepadqq...  Please be patient...
echo ""
echo ""
sudo apt-get install notepadqq -y

clear
echo ""
echo Installing 11/39 Setting up sublime-text...  Please be patient...
echo ""
echo ""
#not sure this is free
sudo apt-get install sublime-text -y

clear
echo ""
echo Installing 12/39 Setting up dos2unix...  Please be patient...
echo ""
echo ""
sudo apt-get install dos2unix -y

clear
echo ""
echo Installing 13/39 Setting up keepass2...  Please be patient...
echo ""
echo ""
sudo apt-get install keepass2 -y

clear
echo ""
echo Installing 14/39 Setting up conky-all...  Please be patient...
echo ""
echo ""
sudo apt-get install conky-all -y

clear
echo ""
echo Installing 15/39 Setting up vnstat...  Please be patient...
echo ""
echo ""
#required by conky network statistics section
sudo apt-get install vnstat -y

clear
echo ""
echo Installing 16/39 Setting up psensor...  Please be patient...
echo ""
echo ""
#graphical sensor monitor
sudo apt-get install psensor -y

clear
echo ""
echo Installing 17/39 Setting up tree...  Please be patient...
echo ""
echo ""
#helps determine system monitors for conky
sudo apt-get install tree -y

clear
echo ""
echo Installing 18/39 Setting up python-pip...  Please be patient...
echo ""
echo ""
sudo apt-get install python-pip -y

clear
echo ""
echo Installing 19/39 Setting up python3-tk...  Please be patient...
echo ""
echo ""
#test ‘python3’ tkinkter app before install
sudo apt-get install python3-tk -y

clear
echo ""
echo Installing 20/39 Setting up tk...  Please be patient...
echo ""
echo ""
#test ‘python3’ tkinkter app before install
sudo apt-get install tk -y

clear
echo ""
echo Installing 21/39 Setting up docker.io...  Please be patient...
echo ""
echo ""
sudo apt-get install docker.io -y

clear
echo ""
echo Installing 22/39 Setting up sqlitebrowser...  Please be patient...
echo ""
echo ""
sudo apt-get install sqlitebrowser -y

clear
echo ""
echo Installing 23/39 Setting up pdfshuffler...  Please be patient...
echo ""
echo ""
#Merge or Split PDF Documents
sudo apt-get install pdfshuffler -y

clear
echo ""
echo Installing 24/39 Setting up okular...  Please be patient...
echo ""
echo ""
#Document Reader - PDF’s, etc
sudo apt-get install okular -y

clear
echo ""
echo Installing 25/39 Setting up kleopatra...  Please be patient...
echo ""
echo ""
sudo apt-get install kleopatra -y

clear
echo ""
echo Installing 26/39 Setting up synergy...  Please be patient...
echo ""
echo ""
sudo apt-get install synergy -y

clear
echo ""
echo Installing 27/39 Setting up mysql-workbench...  Please be patient...
echo ""
echo ""
sudo apt-get install mysql-workbench -y

clear
echo ""
echo Installing 28/39 Setting up netbeans...  Please be patient...
echo ""
echo ""
sudo apt-get install netbeans -y

clear
echo ""
echo Installing 29/39 Setting up steam...  Please be patient...
echo ""
echo ""
#Steam Gaming
sudo apt-get install steam -y

clear
echo ""
echo Installing 30/39 Setting up cmatrix...  Please be patient...
echo ""
echo ""
#cmatrix turns terminal into matrix terminal
sudo apt-get install cmatrix -y

clear
echo ""
echo Installing 31/39 Setting up krita...  Please be patient...
echo ""
echo ""
#Professional Paint Program
sudo apt-get install krita -y

clear
echo ""
echo Installing 32/39 Setting up cheese...  Please be patient...
echo ""
echo ""
#Camera Software
sudo apt-get install cheese -y

clear
echo ""
echo Installing 33/39 Setting up guvcview...  Please be patient...
echo ""
echo ""
#Camera Software
sudo apt-get install guvcview -y

clear
echo ""
echo Installing 34/39 Setting up gftp...  Please be patient...
echo ""
echo ""
sudo apt-get install gftp -y

clear
echo ""
echo Installing 35/39 Setting up handbrake...  Please be patient...
echo ""
echo ""
sudo apt-get install handbrake -y

clear
echo ""
echo Installing 36/39 Setting up virtualbox...  Please be patient...
echo ""
echo ""
sudo apt-get install virtualbox -y

clear
echo ""
echo Installing 37/39 Setting up virtualbox-guest-additions-iso...  Please be patient...
echo ""
echo ""
sudo apt-get install virtualbox-guest-additions-iso -y

clear
echo ""
echo Installing 38/39 Setting up falkon...  Please be patient...
echo ""
echo ""
sudo apt-get install falkon -y

clear
echo ""
echo Installing 39/39 Setting up openoffice.org-hyphenation...  Please be patient...
echo ""
echo ""
#Fixes the Local Language Packs message after Initial Installation
sudo apt-get install openoffice.org-hyphenation -y


clear
echo ""
echo Setting up Timeshift and taking first snapshot...  Please be patient...
echo ""
echo ""
sudo timeshift --create --rsync --comment "Base Install Snapshot" --yes
sudo sed -i 's/"schedule_weekly" : "false"/"schedule_weekly" : "true"/g' /etc/timeshift/timeshift.json

cd ~/Downloads/mint-setup/
mv 2.json ~/.cinnamon/configs/grouped-window-list@cinnamon.org/

clear
echo ""
echo "Setup Complete - Machine will reboot in 30 seconds"
sleep 30


sudo reboot
