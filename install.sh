#!/usr/bin/env sh

TMPFILE=/tmp/pkg
TARGET=/usr/bin
NAME=pkg

#####################################

function checkos
{
case `uname` in
  Linux )
     LINUX=1
     which yum >/dev/null 2>&1  && { echo centos; return; }
     which zypper >/dev/null 2>&1  && { echo opensuse; return; }
     which apt-get>/dev/null 2>&1  && { echo debian; return; }
     which pacman >/dev/null 2>&1 && { echo arch; return;  }
     ;;
  Darwin )
     DARWIN=1
     echo macos; return; 
     ;;
  * )
	echo unknown;
;;
esac
}  
##################################### End Function Definitions

# Call checkos to detect Linux package manager flavor
os=$(checkos) && echo "OS detected: $os"

if [ $os = "unknown" ]; then
   	echo -e "Not installed\n[WARNING] This script is not supported (yet) on MacOS or freebsd"  	
	exit -1
fi 

wget -O $TMPFILE  https://raw.githubusercontent.com/Inducido/package-manager-rosetta-stone/master/pkg-$os
if [ -s $TMPFILE ]; then
	echo "This installer Will copy the script '$NAME' into $TARGET";
	sudo cp $TMPFILE $TARGET/$NAME && sudo chmod +x $TARGET/$NAME
	echo "----------------------------------------------"
	echo "$NAME $(grep VERSION pkg|head -1|cut -d '=' -f 2) has been installed."
	echo -e "( full path: $TARGET/$NAME )\n"
	echo -e "-> try 'pkg' or 'pkg help' to check it out.\n"
fi
