#!/bin/bash

sudo sed -i 's/http:\/\/packages.linuxmint.com/https:\/\/mirror.cs.jmu.edu\/pub\/linuxmint\/packages/g' /etc/apt/sources.list.d/official-package-repositories.list

sudo sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu/http:\/\/mirror.clarkson.edu\/ubuntu/g' /etc/apt/sources.list.d/official-package-repositories.list

sudo apt-get update
sudo apt-get upgrade -y

clear
echo ""
echo Installing 1/40 openssh-server...  Please be patient...
echo ""
echo ""
sudo apt-get install openssh-server -y

clear
echo ""
echo Installing 2/40 vim...  Please be patient...
echo ""
echo ""
sudo apt-get install vim -y

clear
echo ""
echo Installing 3/40 chromium-browser...  Please be patient...
echo ""
echo ""
sudo apt-get install chromium-browser -y

clear
echo ""
echo Installing 4/40 gtkhash...  Please be patient...
echo ""
echo ""
sudo apt-get install gtkhash -y

clear
echo ""
echo Installing 5/40 remmina...  Please be patient...
echo ""
echo ""
#use for SSH and RDP connections
sudo apt-get install remmina -y

clear
echo ""
echo Installing 6/40 remmina-plugin-rdp...  Please be patient...
echo ""
echo ""
sudo apt-get install remmina-plugin-rdp -y

clear
echo ""
echo Installing 7/40 remmina-plugin-vnc...  Please be patient...
echo ""
echo ""
sudo apt-get install remmina-plugin-vnc -y

clear
echo ""
echo Installing 8/40 scribus...  Please be patient...
echo ""
echo ""
sudo apt-get install scribus -y

clear
echo ""
echo Installing 9/40 scribus-template...  Please be patient...
echo ""
echo ""
sudo apt-get install scribus-template -y

clear
echo ""
echo Installing 10/40 notepadqq...  Please be patient...
echo ""
echo ""
sudo apt-get install notepadqq -y

clear
echo ""
echo Installing 11/40 sublime-text...  Please be patient...
echo ""
echo ""
#not sure this is free
sudo apt-get install sublime-text -y

clear
echo ""
echo Installing 12/40 dos2unix...  Please be patient...
echo ""
echo ""
sudo apt-get install dos2unix -y

clear
echo ""
echo Installing 13/40 keepass2...  Please be patient...
echo ""
echo ""
sudo apt-get install keepass2 -y

clear
echo ""
echo Installing 14/40 conky-all...  Please be patient...
echo ""
echo ""
sudo apt-get install conky-all -y

clear
echo ""
echo Installing 15/40 vnstat...  Please be patient...
echo ""
echo ""
#required by conky network statistics section
sudo apt-get install vnstat -y

clear
echo ""
echo Installing 16/40 psensor...  Please be patient...
echo ""
echo ""
#graphical sensor monitor
sudo apt-get install psensor -y

clear
echo ""
echo Installing 17/40 tree...  Please be patient...
echo ""
echo ""
#helps determine system monitors for conky
sudo apt-get install tree -y

clear
echo ""
echo Installing 18/40 python-pip...  Please be patient...
echo ""
echo ""
sudo apt-get install python-pip -y

clear
echo ""
echo Installing 19/40 python3-tk...  Please be patient...
echo ""
echo ""
#test ‘python3’ tkinkter app before install
sudo apt-get install python3-tk -y

clear
echo ""
echo Installing 20/40 tk...  Please be patient...
echo ""
echo ""
#test ‘python3’ tkinkter app before install
sudo apt-get install tk -y

clear
echo ""
echo Installing 21/40 docker.io...  Please be patient...
echo ""
echo ""
sudo apt-get install docker.io -y

clear
echo ""
echo Installing 22/40 sqlitebrowser...  Please be patient...
echo ""
echo ""
sudo apt-get install sqlitebrowser -y

clear
echo ""
echo Installing 23/40 pdfshuffler...  Please be patient...
echo ""
echo ""
#Merge or Split PDF Documents
sudo apt-get install pdfshuffler -y

clear
echo ""
echo Installing 24/40 okular...  Please be patient...
echo ""
echo ""
#Document Reader - PDF’s, etc
sudo apt-get install okular -y

clear
echo ""
echo Installing 25/40 kleopatra...  Please be patient...
echo ""
echo ""
sudo apt-get install kleopatra -y

clear
echo ""
echo Installing 26/40 synergy...  Please be patient...
echo ""
echo ""
sudo apt-get install synergy -y

clear
echo ""
echo Installing 27/40 mysql-workbench...  Please be patient...
echo ""
echo ""
sudo apt-get install mysql-workbench -y

clear
echo ""
echo Installing 28/40 netbeans...  Please be patient...
echo ""
echo ""
sudo apt-get install netbeans -y

clear
echo ""
echo Installing 29/40 steam...  Please be patient...
echo ""
echo ""
#Steam Gaming
sudo apt-get install steam -y

clear
echo ""
echo Installing 30/40 cmatrix...  Please be patient...
echo ""
echo ""
#cmatrix turns terminal into matrix terminal
sudo apt-get install cmatrix -y

clear
echo ""
echo Installing 31/40 krita...  Please be patient...
echo ""
echo ""
#Professional Paint Program
sudo apt-get install krita -y

clear
echo ""
echo Installing 32/40 cheese...  Please be patient...
echo ""
echo ""
#Camera Software
sudo apt-get install cheese -y

clear
echo ""
echo Installing 33/40 guvcview...  Please be patient...
echo ""
echo ""
#Camera Software
sudo apt-get install guvcview -y

clear
echo ""
echo Installing 34/40 gftp...  Please be patient...
echo ""
echo ""
sudo apt-get install gftp -y

clear
echo ""
echo Installing 35/40 handbrake...  Please be patient...
echo ""
echo ""
sudo apt-get install handbrake -y

clear
echo ""
echo Installing 36/40 virtualbox...  Please be patient...
echo ""
echo ""
sudo apt-get install virtualbox -y

clear
echo ""
echo Installing 37/40 virtualbox-guest-additions-iso...  Please be patient...
echo ""
echo ""
sudo apt-get install virtualbox-guest-additions-iso -y

clear
echo ""
echo Installing 38/40 falkon...  Please be patient...
echo ""
echo ""
sudo apt-get install falkon -y

clear
echo ""
echo Installing 39/40 openoffice.org-hyphenation...  Please be patient...
echo ""
echo ""
#Fixes the Local Language Packs message after Initial Installation
sudo apt-get install openoffice.org-hyphenation -y

clear
echo ""
echo Installing 40/40 xrdp...  Please be patient...
echo ""
echo ""
#Allows RDP Connections to Linux
sudo apt-get install xrdp -y
sudo adduser xrdp ssl-cert

clear
echo ""
echo Modifying Grub Menu to not display...  Please be patient...
echo ""
echo ""
sudo sed -i 's/GRUB_TIMEOUT=10/GRUB_TIMEOUT=0/g' /etc/default/grub
sudo update-grub

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
