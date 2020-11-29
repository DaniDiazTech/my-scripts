#!/usr/bin/bash

### DESKTOP SHORTCUT CREATOR BY DANIEL DIAZ ###
#
#  ____   ____
# |  _ \ |  _ \   Copyright (c) 2020 Daniel Diaz
# | | | || | | |
# | |_| || |_| |  http://www.github.com/Daniel1404/Github_automation
# |____/ |____/
#

PD=$(pwd)


echo "------ UNIX SHORTCUT CREATOR -------"
echo ""
echo ""

installation_folder=~/.local/share/applications

read -p "The name of your application >>> " name
read -p "Comment for your app >>> " comment
echo "If blank term app is False"
read -p "Is a terminal app [y/n] >>> " choice1

echo "Leave blank if you don't have an icon"
read -p "Do you have an icon Path >>> " icon
read -p "The executable path >>> " executable 

case $choice1 in
    "yes" ) term="true"
        ;;
    "y" ) term="true"
        ;;
    "n" ) term="false"
        ;;
    "no" ) term="false"
        ;;
    * ) term="false"
esac

APP="${name}.desktop"

##### TEST OUTPUT ######
# echo "----- TEST -----"
# echo ""
# echo ""
# echo $APP
# echo $name
# echo $executable
# echo $icon
# echo $choice

cat <<EOS > "$APP"
[Desktop Entry]
Name=${name}
Comment=${comment}
Exec=${executable}
Terminal=${term}
Type=Application
Icon=${icon}
EOS

chmod +x "${APP}"

mv "${APP}" $installation_folder

echo "-------- Program has finished ---------"

