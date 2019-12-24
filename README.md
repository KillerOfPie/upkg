
## UPKG : What is it?


**upkg** is a **universal package manager** for Linux (a **wrapper** for the command line).
- **Goal**: Same syntax for most frequent tasks on all flavors of Linux 
- **Name**: **upkg**  (or **rosetta** or better idea?  --> I plan to ask for the name at install, why not?).

This is a package manager wrapper, or say a proxy: This is just a script, voluntarily kept simple to that you can check what it does in 1 minute.

> **Supports**:  dnf, yum, zypper, apt-get, pacman, emerge, tazpkg, xbps, pkg_add, brew (mostly untested, this is alpha version)
> So all flavors of: Arch, Red Hat/Fedora, Debian/Ubuntu, SLES/openSUSE, Gentoo/calculate, Slitaz, Void linux, openBSD, MacOS


## What will you get?

Same syntax for a package manager whatever the distribution:

```
Usage: upkg <command> [arguments]

where command is:

	install
		Install a package(s) by name

	remove
		Remove a package(s) by name

	search
		search for package(s) by name

	update
		Update local catalog then Upgrade Packages ->
		Upgrades installed packages which have a newer version

	locate FILE
		Find the package which provides FILE

	info
		Print information about a package

	list
		list the files installed with a package

	version
		version of a package(s) by name

```
It is like a new generic package manager, which will proxy command line to the underlying system package manager (rpm, yum, apt, pacman, you name it).
Said differently: an "alias script" for package managers, a "proxy script" for package managers

> Note: the final installed script is named upkg-XXX where XXX is your distro.   
> You can check the file in this repo, or directly download it to avoid the installer


## How To Install?

**For Linux Users**
- Use the single line installer command line below (Debian has wget, Red Hat has curl by default)
- cut and paste in a terminal (you will be asked for sudo):

```
wget -O - https://raw.githubusercontent.com/Inducido/package-manager-rosetta-stone/master/install.sh | bash
or
curl https://raw.githubusercontent.com/Inducido/package-manager-rosetta-stone/master/install.sh | bash

alternative  (shortened URL)

curl -L http://bit.do/upkg | sh


```

**For Windows Users**
- Format your disk & install Linux
- proceed to the previous section


## Prior to Install on some distributions

Install curl on Void Linux:

```
	sudo xbps-install -Su
	sudo xbps-install -S curl
```



## The Rosetta Stone

The famous Arch Linux's **Pacman Rosetta** gave me the idea for this tool. I wrote it several years later.   
Above all: that weird syntax for basic commands on Arch Linux (pacman) mainly motivated me 

> see here: https://wiki.archlinux.org/index.php/Pacman/Rosetta


| rpm                   | yum                           | debian                        | arch                              |
|-----------------------|-------------------------------|-------------------------------|-----------------------------------|
| `rpm -i foo.rpm`      |                               | `dpkg -i foo.deb`             | `pacman -U foo.pkg.tar.xz`        |
|                       | `yum install foo`             | `apt-get install foo`         | `pacman -S`                       |
| `rpm -e foo`          | `yum remove foo`              | `dpkg -P foo`                 | `pacman -R foo`                   |
| `rpm -qip foo.rpm`    |                               | `dpkg -I foo.deb`             | `pacman -Qi -p foo.pkg.tar.xz`    |
|                       | `yum info foo`                | `apt-cache show foo`          | `pacman -Si foo`                  |
| `rpm -qlp foo.rpm`    |                               | `dpkg -c foo.deb`             | `pacman -Ql -p foo.pkg.tar.xz`    |
| `rpm -ql foo`         |                               | `dpkg -L foo`                 | `pacman -Ql foo`                  |
| `rpm -qi foo`         |                               | `dpkg -p foo, dpkg -s foo`    | `pacman -Qi foo`                  |
| `rpm -q --show-scripts foo` |                         | `dpkg-query --control-list foo \| xargs -n 1 dpkg-query --control-show foo` |                        |
| `rpm -qa`             | `yum list installed`          | `dpkg-query -W, dpkg --list`  | `pacman -Q`                       |
| `rpm -qf /bin/bash`   | `yum whatprovides /bin/bash`  | `dpkg -S /bin/bash`           | `pacman -Qo /bin/bash`            |
|                       | `yum search foo`              | `apt-cache search foo`        | `pacman -Ss foo`                  |
|                       | `yum list available`          | `apt-cache dumpavail`         | `pacman -Sl`                      |
| `rpm2cpio bash.rpm \| cpio -diu` |                     | `dpkg -x bash.deb $PWD`       | `tar -xzf bash.pkg.tar.xz`        |

Other sources: 

* http://cupcakecarnival.net/2009/02/17/debian-equivalent-rpm-based-system-commands
* http://wiki.debian.org/RPM
* https://help.ubuntu.com/community/SwitchingToUbuntu/FromLinux/RedHatEnterpriseLinuxAndFedora
* https://wiki.archlinux.org/index.php/Pacman/Rosetta_(简体中文)
* https://wiki.archlinux.org/index.php/Pacman/Rosetta

