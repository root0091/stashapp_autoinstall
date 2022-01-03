echo "Credentials Setup"
echo "-----------------------------------------------------------------------"
echo "Future Stash Install Username"
read username
echo "Future Stash Install Password"
read password
echo "ThePornDB API Key"
read apikey
clear
echo "Headless Chrome Install"
echo "-----------------------------------------------------------------------"
sleep 5
export CHROME_BIN=/usr/bin/google-chrome
export DISPLAY=:99.0
apt install -y xvfb 
apt-get update
apt-get -y upgrade
apt-get install -y python3 python3-pip python3-pil python3-requests unzip libappindicator1 fonts-liberation libasound2 libgconf-2-4 libnspr4 libxss1 libnss3 xdg-utils
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
apt --fix-broken -y install
cd /
rm google-chrome*
clear
echo "Stash Install"
echo "-----------------------------------------------------------------------"
sleep 5
mkdir /work
cd /work
wget https://github.com/stashapp/stash/releases/latest/download/stash-linux
chmod +x ./*
mv stash-linux stash
echo "[Unit]">> /etc/systemd/system/stashapp.service
echo "Description=StashApp">> /etc/systemd/system/stashapp.service
echo "[Service]">> /etc/systemd/system/stashapp.service
echo "User=root">> /etc/systemd/system/stashapp.service
echo "WorkingDirectory=/work">> /etc/systemd/system/stashapp.service
echo "ExecStart=/work/stash">> /etc/systemd/system/stashapp.service
echo "Restart=always">> /etc/systemd/system/stashapp.service
echo "[Install]">> /etc/systemd/system/stashapp.service
echo "WantedBy=multi-user.target">> /etc/systemd/system/stashapp.service
chmod +x /etc/systemd/system/stashapp.service
systemctl enable stashapp
mkdir /work/plugins
mkdir /work/avail.plugins
cd /work/avail.plugins
wget https://github.com/stashapp/CommunityScripts/archive/refs/heads/main.zip
unzip ./*
cd ./C*
mv ./* ../
cd ../
rm main.zip
rm -rf Community*
mkdir /work/scrapers
cd /work/scrapers
wget https://github.com/stashapp/CommunityScrapers/archive/refs/heads/master.zip
unzip ./*
cd ./C*
cd ./s*
mv ./* ../../
cd ../../
rm master.zip
rm -rf Community*
chmod +x *
mkdir /work/autoscraper
cd /work/autoscraper
wget https://github.com/bnkai/stash_theporndb_scraper/archive/refs/heads/master.zip
unzip ./*
cd stash*
mv ./* ../
cd ../
rm -rf stash_theporndb_scraper-master
rm SAMPLE_configur*
chmod +x ./*
echo "use_https = False">> /work/autoscraper/configuration.py
echo 'server_ip= "127.0.0.1"'>> /work/autoscraper/configuration.py
echo 'server_port = "9999"'>> /work/autoscraper/configuration.py
echo 'username="'$username'"'>> /work/autoscraper/configuration.py                                         
echo 'password="'$password'"'>> /work/autoscraper/configuration.py                                         
echo "ignore_ssl_warnings= True">> /work/autoscraper/configuration.py
echo "scrape_tag= None">> /work/autoscraper/configuration.py
echo "unmatched_tag = None">> /work/autoscraper/configuration.py
echo "disambiguate_only = False">> /work/autoscraper/configuration.py
echo "verify_aliases_only = False">> /work/autoscraper/configuration.py
echo "rescrape_scenes= True">> /work/autoscraper/configuration.py
echo "retry_unmatched = True">> /work/autoscraper/configuration.py
echo "background_size = 'full'">> /work/autoscraper/configuration.py
echo "debug_mode = False">> /work/autoscraper/configuration.py
echo "set_details = True">> /work/autoscraper/configuration.py
echo "set_date = True">> /work/autoscraper/configuration.py
echo "set_cover_image = True">> /work/autoscraper/configuration.py
echo "set_performers = True">> /work/autoscraper/configuration.py
echo "set_studio = True">> /work/autoscraper/configuration.py
echo "set_tags = True">> /work/autoscraper/configuration.py
echo "set_title = True">> /work/autoscraper/configuration.py
echo "set_url = True">> /work/autoscraper/configuration.py
echo 'tpdb_api_key = "'$apikey'"'>> /work/autoscraper/configuration.py                                 
echo "add_studio = True">> /work/autoscraper/configuration.py
echo "add_tags = True">> /work/autoscraper/configuration.py
echo "add_performers = True">> /work/autoscraper/configuration.py
echo "ambiguous results">> /work/autoscraper/configuration.py
echo "auto_disambiguate = True">> /work/autoscraper/configuration.py
echo "manual_disambiguate = False">> /work/autoscraper/configuration.py
echo "ambiguous_tag = None">> /work/autoscraper/configuration.py 
echo "tag_ambiguous_performers = False">> /work/autoscraper/configuration.py  
echo "confirm_questionable_aliases = True">> /work/autoscraper/configuration.py 
echo "trust_tpbd_aliases = True">> /work/autoscraper/configuration.py 
echo "#Other config options">> /work/autoscraper/configuration.py
echo "parse_with_filename = True">> /work/autoscraper/configuration.py 
echo "dirs_in_query = 1">> /work/autoscraper/configuration.py 
echo "only_add_female_performers = True">> /work/autoscraper/configuration.py  
echo "scrape_performers_freeones = True">> /work/autoscraper/configuration.py 
echo "get_images_babepedia = True">> /work/autoscraper/configuration.py 
echo "include_performers_in_title = True">> /work/autoscraper/configuration.py 
echo "male_performers_in_title = False">> /work/autoscraper/configuration.py 
echo "clean_filename = True">> /work/autoscraper/configuration.py 
echo "compact_studio_names = True">> /work/autoscraper/configuration.py 
echo "proxies={}">> /work/autoscraper/configuration.py 
echo "#!/bin/bash">> ./start.sh
echo "while true; do">> ./start.sh
echo "./scrapeScenes.py">> ./start.sh
echo "sleep 7200">> ./start.sh
echo "done">> ./start.sh
chmod +x ./start.sh
echo "[Unit]">> /etc/systemd/system/stashapp-autoscrape.service
echo "Description=StashApp-Autoscraper">> /etc/systemd/system/stashapp-autoscrape.service
echo "[Service]">> /etc/systemd/system/stashapp-autoscrape.service
echo "User=root">> /etc/systemd/system/stashapp-autoscrape.service
echo "WorkingDirectory=/work/autoscraper">> /etc/systemd/system/stashapp-autoscrape.service
echo "ExecStart=/work/autoscraper/start.sh">> /etc/systemd/system/stashapp-autoscrape.service
echo "Restart=always">> /etc/systemd/system/stashapp-autoscrape.service
echo "[Install]">> /etc/systemd/system/stashapp-autoscrape.service
echo "WantedBy=multi-user.target">> /etc/systemd/system/stashapp-autoscrape.service
chmod +x /etc/systemd/system/stashapp-autoscrape.service
systemctl enable stashapp-autoscrape
systemctl start stashapp
clear
echo "Go to local IP listed below and select 'In the current working directory.'"
echo "Access is set to http:// at port :9999"
echo "----------------------------------------------------------------------------"
ip addr | grep -Po 'inet \K[\d.]+'
echo "Feel free to add directory of media at this time."
echo "----------------------------------------------------------------------------"
echo "Do NOT change any settings, once you have reached the main page, continue."
echo "----------------------------------------------------------------------------"
read -n 1 -s -r -p "Press any key to continue"
clear
systemctl stop stashapp
echo 'scraper_user_agent: ""'>>/work/config.yml
echo 'scraper_cdp_path: ""'>>/work/config.yml
sed -i '/scraper_cdp_path: ""/c scraper_cdp_path: /usr/bin/google-chrome' /work/config.yml
sed -i '/scraper_user_agent: ""/c scraper_user_agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36' /work/config.yml
sed -i '/dangerous_allow_public_without_auth: "false"/c dangerous_allow_public_without_auth: "true"' /work/config.yml
sed -i '/#- Key: Authorization # Uncomment and add a valid API Key after the `Bearer ` part/c - Key: Authorization' /work/scrapers/ThePornDB.yml
sed -i '/#Value: Bearer zUotW1dT5ESmpIpMnccUNczf8q4C9Thzn07ZqygE/c Value: Bearer '$apikey'' /work/scrapers/ThePornDB.yml
sed -i '/parallel_tasks: 1/c parallel_tasks: 0' /work/config.yml
sed -i '/port: 9999/c port: 443' /work/config.yml
echo 'username: '$username''>>/work/config.yml
snap install bcrypt-tool
hashed=$(bcrypt-tool hash $password)
echo 'password: '$hashed''>>/work/config.yml
systemctl start stashapp
systemctl start stashapp-autoscrape
clear
echo "Complete"
echo "-----------------------------------------------------------------------"
echo "Stash should be running with external IP access & scrapers installed."
echo "ThePornDB autoscraper installed by default. Both instances set as"
echo "services to autostart on boot."
echo "-----------------------------------------------------------------------"
echo "All scrapers have been added along with all plugins added. Plugins are"
echo "located in /work/avail.plugins. To enable, set permissions and move to"
echo "/work/plugins as directed in README.md"

read -n 1 -s -r -p "Press any key to continue"
