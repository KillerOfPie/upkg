#!/usr/bin/env sh

TMPFILE=/tmp/pkg
TARGET=/usr/bin
NAME=pkg

wget -O $TMPFILE  https://raw.githubusercontent.com/Inducido/package-manager-rosetta-stone/master/pkg
echo "This installer Will copy the script '$NAME' into $TARGET";
sudo cp $TMPFILE $TARGET/$NAME && sudo chmod +x $TARGET/$NAME
echo "----------------------------------------------"
echo "$NAME 0.1 has been installed."
echo -e "( full path: $TARGET/$NAME )\n"
echo -e "-> try 'pkg' or 'pkg help' to check it out.\n"

