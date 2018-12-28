cd ~
foo=$(systemd-path user)
mkdir -p ~/.local/.overview
mkdir -p ~/.local/bin/
mkdir -p ~/.local/share/applications


cd /tmp
wget https://raw.githubusercontent.com/tuyendev/useful-linux-command/master/software/overview/overviews.png
mv -f overviews.png ~/.local/.overview

rm -f ~/.local/bin/overview
touch ~/.local/bin/overview
rm -f ~/.local/share/applications/overviews.desktop
touch ~/.local/share/applications/overviews.desktop
chmod +x ~/.local/bin/overview

foo=$(systemd-path user)
echo "xdotool key Super+s &" | tee -a ~/.local/bin/overview > /dev/null

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

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo "${red}Don't forget install xdotool"
echo " ${reset}"
echo " - ${green}Ubuntu-based: sudo apt-get install xdotool"
echo " - ${green}Fedora-based: sudo yum install xdotool"
echo "${reset}"
