clear
echo ""
echo Installing 13/$total conky-all...  Please be patient...
echo ""
echo ""
sudo apt-get install conky-all -y

clear
echo ""
echo Installing 14/$total vnstat...  Please be patient...
echo ""
echo ""
#required by conky network statistics section
sudo apt-get install vnstat -y

clear
echo ""
echo Installing 15/$total psensor...  Please be patient...
echo ""
echo ""
#graphical sensor monitor
sudo apt-get install psensor -y

clear
echo ""
echo Installing 16/$total tree...  Please be patient...
echo ""
echo ""
#helps determine system monitors for conky
sudo apt-get install tree -y



cd ~/Downloads/mint-setup/
mv 2.json ~/.cinnamon/configs/grouped-window-list@cinnamon.org/
mv linuxmint.png ~/Pictures/
mv .conkyrc ~
mv StartupConky.desktop ~/.config/autostart/
sudo mv ~/Downloads/mint-setup/sunset /usr/local/bin/
sudo mv ~/Downloads/mint-setup/sunrise /usr/local/bin/

sudo mv sun-hours_etc_cron.daily /etc/cron.daily/sun-hours
sudo chown root.root /etc/cron.daily/sun-hours
sudo chmod 755 /etc/cron.daily/sun-hours

sudo mv sun-hours_usr_local_bin /usr/local/bin/sun-hours
sudo chown root.root /usr/local/bin/sun-hours
sudo chmod 755 /usr/local/bin/sun-hours

echo ""
echo ""
echo Getting current Sunset and Sunrise times...  Please be patient...
sudo /usr/local/bin/sun-hours
sleep 60


clear
echo ""
echo "Setup Complete - Machine will reboot in 30 seconds"
sleep 30

sudo reboot
