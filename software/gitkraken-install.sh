#!/bin/bash

# Enter /opt folder (common folder for user installed programs)
# This script assumes you have proper permissions on /opt
cd /tmp

# Download GitKraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz

# Extract the Kraken into /opt directory
sudo rm -rf /opt/gitkraken
sudo mkdir /opt/gitkraken

sudo tar -xvzf gitkraken-amd64.tar.gz -C /opt

# Remove tar.gz
rm -rf gitkraken-amd64.tar.gz*

# Add gitkraken to PATH
echo "export PATH=\$PATH:/opt/gitkraken" >> ~/.bashrc
source ~/.bashrc

# Download gitkraken launcher icon
wget http://img.informer.com/icons_mac/png/128/422/422255.png
sudo mv 422255.png /opt/gitkraken/icon.png
rm -rf 422255.png

# Create desktop entry
sudo touch /usr/share/applications/gitkraken.desktop

# copy the following contents into gitkraken.desktop file:
echo "
[Desktop Entry]
Name=GitKraken
Comment=Git Flow
Exec=/opt/gitkraken/gitkraken
Icon=/opt/gitkraken/icon.png
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Utility;Development;" | sudo tee -a /usr/share/applications/gitkraken.desktop >/dev/null

# Adding required lib
cd /opt/gitkraken
sudo ln -sf /usr/lib64/libcurl.so.4 libcurl.so.4
sudo ln -sf /usr/lib64/libcurl.so.4 /usr/lib64/libcurl-gnutls.so.4
