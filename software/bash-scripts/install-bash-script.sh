cd ~
foo=$(systemd-path user)
rm -f ~/.local/bin/bs
touch ~/.local/bin/bs
echo "
#!/bin/bash
RED='\e[41m'
GREEN='\e[102m'
BLUE='\e[104m'
YELLOW='\e[103m'
NC='\e[49m'

if [ \"\$1\" = \"\" ];then 
    echo \"Do nothing\"
else
    for d in *;
        do
            if [ -d \"\$d\" ]; then
                cd \"\$d\"
                echo ""
                echo -e \"Project \${RED}\$d \${NC}will run \${NC}: \${YELLOW} \$1 \${NC}\"
                echo \"\"
                \$1
                cd ..
                echo \"\"
                echo -e \"\${BLUE}END\${NC}\"
                echo \"\"
            fi
        done
fi" | tee -a  ~/.local/bin/bs > /dev/null

chmod +x ~/.local/bin/bs