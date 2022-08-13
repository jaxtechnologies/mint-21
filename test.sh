cd ~/Downloads/mint-setup/
mv 2.json ~/.cinnamon/configs/grouped-window-list@cinnamon.org/
mv linuxmint.png ~/Pictures/
mv .conkyrc ~
mv StartupConky.desktop ~/.config/autostart/
sudo mv sunset sunrise /usr/local/bin/

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
