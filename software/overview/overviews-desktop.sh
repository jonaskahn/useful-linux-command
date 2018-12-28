
cd ~
foo=$(systemd-path user)
mkdir -p ~/.local/.overview
mkdir -p ~/.local/bin/
mkdir -p ~/.local/share/applications


cd /tmp
wget https://raw.githubusercontent.com/tuyendev/useful-linux-command/master/software/overview/overviews.png
mv -f overviews.png ~/.local/.overview

rm -f ~/.local/bin/showoverview
rm -f ~/.local/bin/overview
touch ~/.local/bin/showoverview
touch ~/.local/bin/overview
rm -f ~/.local/bin/hideoverview
touch ~/.local/bin/hideoverview
rm -f ~/.local/share/applications/overviews.desktop
touch ~/.local/share/applications/overviews.desktop
chmod +x ~/.local/bin/showoverview
chmod +x ~/.local/bin/hideoverview
chmod +x ~/.local/bin/overview

foo=$(systemd-path user)
echo "$foo/.local/bin/showoverview &" | tee -a ~/.local/bin/overview > /dev/null

echo "
foo=$(systemd-path user)
sed -i 's/showoverview/hideoverview/' $foo/.local/bin/overview > /dev/null
dbus-send --session --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'Main.overview.show();'" | tee -a ~/.local/bin/showoverview > /dev/null

echo "
foo=$(systemd-path user)
sed -i 's/hideoverview/showoverview/' $foo/.local/bin/overview > /dev/null 
dbus-send --session --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'Main.overview.hide();'" | tee -a ~/.local/bin/hideoverview > /dev/null

echo "
[Desktop Entry]
Name=Overview
Comment=Show all windows
Exec=overview &
Icon=$foo/.local/.overview/overviews.png
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Others;" | tee -a ~/.local/share/applications/overviews.desktop >/dev/null
