cd /tmp
sudo wget https://raw.githubusercontent.com/tuyendev/useful-linux-command/master/software/overview/overviews.png
sudo mkdir /opt/overview
sudo mv overviews.png /opt/overview
sudo touch /usr/bin/overview
sudo chmod a+x /usr/bin/overview
sudo touch /usr/share/applications/overviews.desktop
echo "dbus-send --session --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'Main.overview.show();'" | sudo tee -a /usr/bin/overview > /dev/null
echo "Name=Overview
Comment=Show all windows
Exec=overview &
Icon=//opt/overview/overviews.png
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Others;" | sudo tee -a /usr/share/applications/overviews.desktop >/dev/null
