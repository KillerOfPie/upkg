#!/usr/bin/env sh
#===============================================================================
#          FILE: pkg installer
#   DESCRIPTION: Universal Installer for package manager command line
#
#        AUTHOR: Nadir Boussoukaia
#       CREATED: 18/05/2019
#===============================================================================
TMPFILE=/tmp/upkg
TARGET=/usr/bin
NAME=upkg

#####################################
checkos()
{
	case `uname` in
	  Linux )
		 LINUX=1
		 which dnf >/dev/null 2>&1  && { echo redhat; return; }
		 which yum >/dev/null 2>&1  && { echo centos; return; }
		 which zypper >/dev/null 2>&1  && { echo opensuse; return; }
		 which apt-get>/dev/null 2>&1  && { echo debian; return; }
		 which pacman >/dev/null 2>&1 && { echo arch; return;  }
		 which emerge >/dev/null 2>&1 && { echo gentoo; return;  }
		 which tazpkg >/dev/null 2>&1 && { echo slitaz; return;  }
		 which xbps >/dev/null 2>&1 && { echo void; return;  }
		 which pkg_add >/dev/null 2>&1 && { echo openbsd; return;  }
		 which brew >/dev/null 2>&1 && { echo macos; return;  }
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

wget -O $TMPFILE  https://raw.githubusercontent.com/Inducido/package-manager-rosetta-stone/master/upkg-$os 2> /dev/null
if [ -s $TMPFILE ]; then
        echo "This installer Will copy the script '$NAME' into $TARGET";
        sudo=$(which sudo|cut -d ':' -f 2)
        if [ $(id -u) -eq 0 ]; then sudo=""; fi

        $sudo cp $TMPFILE $TARGET/$NAME && $sudo chmod +x $TARGET/$NAME
        echo "----------------------------------------------"
        echo "$NAME $(grep VERSION $TMPFILE|head -1|cut -d '=' -f 2) has been installed."
        echo "( full path: $TARGET/$NAME )"
        echo "-> try '$NAME' or '$NAME help' to check it out."
        echo ""
fi
