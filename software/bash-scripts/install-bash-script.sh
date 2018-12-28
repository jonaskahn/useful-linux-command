cd ~
foo=$(systemd-path user)
rm -f ~/.local/bin/bs
touch ~/.local/bin/bs
echo "if [ \"\$1\" = "" ];
then echo "Do nothing"
else
    for d in *;
        do
            if [ -d "$d" ]; then
                cd "$d"
                echo ""
                echo "Project $d will run: $1"
                echo ""
                $1
                cd ..
                echo ""
                echo "*************************"
                echo ""
            fi
        done
fi" | tee -a  ~/.local/bin/bs > /dev/null

chmod +x ~/.local/bin/bs