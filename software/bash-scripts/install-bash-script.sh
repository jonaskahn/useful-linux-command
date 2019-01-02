cd ~
foo=$(systemd-path user)
rm -f ~/.local/bin/bs
touch ~/.local/bin/bs
echo "
#!/bin/bash
RED='\e[1;31;107m'
GREEN='\e[1;32;107m'
BLUE='\e[1;34;107m'
YELLOW='\e[1;33;107m'
NC='\e[0;39;40m'

if [ \"\$1\" = \"\" ];then 
    echo \"Do nothing\"
else
    for d in *;
        do
            if [ -d \"\$d\" ]; then
                cd \"\$d\"
                echo ""
                echo -e \"Project \${RED} \$d \${NC} will run \${NC}: \${GREEN} \$1 \${NC}\"
                echo \"\"
                \$1
                cd ..
                echo \"\"
                echo -e \"\${BLUE}FINISH: \${NC}\${GREEN} \$1 \${NC}\"
                echo \"\"
            fi
        done
fi" | tee -a  ~/.local/bin/bs > /dev/null

chmod +x ~/.local/bin/bs