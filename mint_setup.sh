#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install openssh-server -y
sudo apt-get install vim -y
sudo apt-get install chromium-browser -y
sudo apt-get install gtkhash -y
sudo apt-get install remmina -y
sudo apt-get install remmina-plugin-rdp -y
sudo apt-get install remmina-plugin-vnc -y
sudo apt-get install scribus -y
sudo apt-get install scribus-template -y
sudo apt-get install notepadqq -y
sudo apt-get install sublime-text -y		#not sure this is free
sudo apt-get install dos2unix -y
sudo apt-get install keepass2 -y
sudo apt-get install conky-all -y
sudo apt-get install vnstat -y			#required by conky network statistics section
sudo apt-get install psensor -y		#graphical sensor monitor
sudo apt-get install tree -y			#helps determine system monitors for conky
sudo apt-get install python-pip -y
sudo apt-get install python3-tk -y		#test ‘python3’ tkinkter app before install
sudo apt-get install tk -y			#test ‘python3’ tkinkter app before install
sudo apt-get install docker.io -y
sudo apt-get install sqlitebrowser -y
sudo apt-get install pdfshuffler -y		#Merge or Split PDF Documents
sudo apt-get install okular -y			#Document Reader - PDF’s, etc
sudo apt-get install kleopatra -y
sudo apt-get install synergy
sudo apt-get install mysql-workbench -y
sudo apt-get install netbeans -y
sudo apt-get install steam -y			#Steam Gaming
sudo apt-get install cmatrix -y			#cmatrix turns terminal into matrix terminal
sudo apt-get install krita -y			#Professional Paint Program
sudo apt-get install cheese -y			#Camera Software
sudo apt-get install guvcview -y		#Camera Software
sudo apt-get install gftp -y
sudo apt-get install handbrake -y
sudo apt-get install virtualbox -y
sudo apt-get install virtualbox-guest-additions-iso -y
sudo apt-get install falkon -y

mv 2.json .cinnamon/configs/grouped-window-list@cinnamon.org/

sudo reboot
