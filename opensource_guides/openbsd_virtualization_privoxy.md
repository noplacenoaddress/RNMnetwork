# OpenBSD up on the Alps, vmm and Alpine linux

## Four days ago...

------

¡Hello there, dear souls! Days pass rapidly, exactly *four days ago* we're speaking about add another soldier, who's name was **privoxy**, in our personal battle with the infamous *privacy cannibals*, [¿do you remember?](https://steemit.com/openbsd/@npna/openbsd-tor-privoxy-and-the-browsers)
Our new friend, could act like a **layer 7 firewall**, but in our last article we didn't any firewalling, only we rewrite the **Refer** HTTP header.
You have to know that some fantastic dudes maintained a public list of hosts that use our *personal sensible data* with the scope of monetizing it (¿have i give my permission to this abuse?) . The name of the list is **easylist** and you can navigate to the home site of the project [here](https://easylist.to/). Normally is used with browsers extensions to grant **ad-free** navigation to his users. But we're *deep* users and we want to use the list in ours *privoxy* rules. The problem is that this is not so simple. There is a project on the *fantastic github* that could help us in doing that, but it use a language not installed by default in our **OpenBSD**, the name of the language is [**haskell**](https://www.haskell.org/), a *standardized, general-purpose purely functional programming language*. Here is some links to the project:

1. [GitHub project home page](https://github.com/essandess/adblock2privoxy)
2. [Project home page](https://projects.zubr.me/wiki/adblock2privoxy)

**Haskell** can be installed on **OpenBSD** but **adblock2privoxy** want [*The stack package*](https://hackage.haskell.org/package/stack) that i couldn't correctly compile under OpenBSD.

That's the reason why i take my OpenBSD and we go to the up of the [Alps](https://en.wikipedia.org/wiki/Alps) to meet with *another good friend*, another security guy, [**Alpine linux**](https://www.alpinelinux.org/).

## Install Alpine linux under OpenBSD vmm

------

![Alps](https://steemitimages.com/640x0/https://images.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.rci.com%2Fstatic%2Fimages%2Fcontent%2Findia%2FC5%2FS5%2Fc5-en_IN_all-destinations-Alps.jpg&f=1)

We're lucky, or *the karma* is in love with us (we're also in love with you), because a few months ago **OpenBSD** introduce in his base tree the *virtual machine monitor* [**vmm**](https://man.openbsd.org/vmm). But *karma* help us more than this, because it's just very few months that under *vmm* we can virtualize *linux*, read [here](https://marc.info/?l=openbsd-misc&m=149329839013688&w=2).
Ok, let's start with prepare the correct *environment* for our new friend:

Download **Alpine** minimal ISO image, to use in virtual environment, and create a virtual disk of 10GB:

```
$ wget http://dl-cdn.alpinelinux.org/alpine/v3.7/releases/x86_64/alpine-virt-3.7.0-x86_64.iso
$ vmctl create alpine-virt.img -s 10G
```

Enable routing in our OpenBSD:

```
$ doas sysctl net.inet.ip.forwarding=1
# echo "net.inet.ip.forwarding=1" >> /etc/sysctl.conf
```

Create virtual switch `vether0`:

```
# echo "inet 10.1.10.1 255.255.255.0" > /etc/hostname.vether0
# cat > /etc/vm.conf << EOF
switch "local" {
        add vether0
        up
}
EOF
```

Enable **vmd** on boot, enable it and download the virtual BIOS:

```
$ doas rcctl enable vmd
$ doas rcctl start vmd
$ doas fw_update
```

Indicate dns service of Tor to listen in the `vether0` interface and restart it:

```
# echo 'DNSPort 10.1.10.1:53 IsolateDestPort' >> /etc/tor/torrc
$ doas rcctl restart tor
```

Create a dedicated **privoxy** for our new friend, **Alpine**:

```
$ doas cp -p /etc/rc.d/privoxyfirefox /etc/rc.d/privoxyvesta
# cat > /etc/privoxy/vesta << EOF
#        Sample Configuration File for Privoxy 3.0.26
#
# $Id: config,v 1.112 2016/08/26 13:14:18 fabiankeil Exp $
#
# Copyright (C) 2001-2016 Privoxy Developers https://www.privoxy.org/
#

user-manual https://www.privoxy.org/user-manual/
trust-info-url https://learn.canva.com/wp-content/uploads/2015/06/50-Of-The-Most-Creative-404-Pages-On-The-Web-01.png
admin-address r.giuntoli@protonmail.ch
#config guide
#proxy-info-url http://www.example.com/proxy-service.html
confdir /etc/privoxy
templdir /etc/privoxy/templates
logdir /var/log/privoxy
actionsfile match-all.action # Actions that are applied to all sites and maybe overruled later on.
actionsfile default.action   # Main actions file
actionsfile user.action      # User customizations
filterfile default.filter
filterfile user.filter      # User customizations
logfile privoxyvesta.log
#if set all deny but the ones listed on [use ~ like *]
#trustfile trust
#
#        debug     1 # Log the destination for each request Privoxy let through. See also debug 1024
#        debug     2 # show each connection status
#        debug     4 # show I/O status
#        debug     8 # show header parsing
#        debug    16 # log all data written to the network
#        debug    32 # debug force feature
#        debug    64 # debug regular expression filters
#        debug   128 # debug redirects
#        debug   256 # debug GIF de-animation
#        debug   512 # Common Log Format
#        debug  1024 # Log the destination for requests Privoxy didn't let through, and the reason why.
#        debug  2048 # CGI user interface
#        debug  4096 # Startup banner and warnings.
#        debug  8192 # Non-fatal errors
#        debug 32768 # log all data read from the network
#        debug 65536 # Log the applying actions
debug     1 # Log the destination for each request Privoxy let through. See also debug 1024.
#debug  1024 # Actions that are applied to all sites and maybe overruled later on.
#debug  4096 # Startup banner and warnings
#debug  8192 # Non-fatal errors
single-threaded 0
hostname Lutetia.unknown_domain
listen-address  10.1.10.1:8812
#filter mode
toggle  1
enable-remote-toggle  0
#filter by X-filter http header
enable-remote-http-toggle  0
enable-edit-actions 0
enforce-blocks 1
#      src_addr[:port][/src_masklen] [dst_addr[:port][/dst_masklen]]
permit-access  10.1.10.2
buffer-limit 8192
#enable if there's a parent proxy
enable-proxy-authentication-forwarding 0
forward-socks5 / 127.0.0.1:9912 .
forwarded-connect-retries  0
#transparent proxy
accept-intercepted-requests 0
#
allow-cgi-request-crunching 0
split-large-forms 0
# grow up to 300 (if browser hang stop)
keep-alive-timeout 5
# disable if problems
tolerate-pipelining 1
#default-server-timeout 60
connection-sharing 0
# try to reduce to 5 sec
socket-timeout 300
#max-client-connections 256
handle-as-empty-doc-returns-ok 0
#enable-compression 1
#compression-level 3
#client-header-order Host \
#   Accept \
#   Accept-Language \
#   Accept-Encoding \
#   Proxy-Connection \
#   Referer \
#   Cookie \
#   DNT \
#   If-Modified-Since \
#   Cache-Control \
#   Content-Length \
#   Content-Type
#
#client-specific-tag circumvent-blocks Overrule blocks but do not affect other actions
#          disable-content-filters Disable content-filters but do not affect other actions
#
#
#            client-tag-lifetime 180
#            # IP address with a X-Forwarded-For header.
#            trust-x-forwarded-for 1
EOF
$ doas rcctl enable privoxyvesta
$ doas rcctl set privoxyvesta flags=/etc/privoxy/vesta
$ doas rcctl start privoxyvesta
```

And prepare pf for the new services opened on `vether0`:

```
# cat >> /etc/pf.conf << EOF
pass in on vether0 proto tcp from 10.1.10.2 to 10.1.10.1 port 8812
pass in on vether0 proto udp from 10.1.10.2 to 10.1.10.1 port 53
EOF
$ doas pfctl -f /etc/pf.conf
```

Notice that we don't NAT connections from *Alpine linux vesta*, it will only arrive in Internet by the use of our *privoxy* dedicated instance.

## Alpine under OpenBSD, the video

------

Now, using [this guide](https://wiki.alpinelinux.org/wiki/Install_to_disk) we are going to install our **Alpine** under the **OpenBSD**

[![asciicast](https://steemitimages.com/640x0/https://asciinema.org/a/157644.png)](https://asciinema.org/a/157644)

*...to be continued...* and yes **I LOVE YOU**

# OpenBSD, Alpine and Docker; the good, the bad and the hugly

## The goodfellas

------

![blue whale](https://steemitimages.com/640x0/https://images.duckduckgo.com/iu/?u=http%3A%2F%2Fnews.bbcimg.co.uk%2Fmedia%2Fimages%2F50355000%2Fjpg%2F_50355036_blue_whale_1.jpg&f=1)

OpenBSD, [*last time*](https://steemit.com/openbsd/@npna/openbsd-up-on-the-alps-vmm-and-alpine-linux), meet a good friend in the alps, [**Alpine Linux**](https://en.wikipedia.org/wiki/Alpine_Linux), *¿do you remember?*
After **four** days of [*titties & beer*](https://www.last.fm/music/Frank+Zappa/_/Titties+and+Beer) , they decides to meet another friend, *a blue whale*, his name is [**Docker**](https://www.docker.com/).

## ¿Who is Docker?

------

> Docker is a software technology providing containers, promoted by the company Docker, Inc. Docker provides an additional layer of abstraction and automation of operating-system-level virtualization on Windows and Linux. Docker uses the resource isolation features of the Linux kernel such as cgroups and kernel namespaces, and a union-capable file system such as OverlayFS and others to allow independent "containers" to run within a single Linux instance, avoiding the overhead of starting and maintaining virtual machines (VMs).

> The Linux kernel's support for namespaces mostly isolates an application's view of the operating environment, including process trees, network, user IDs and mounted file systems, while the kernel's cgroups provide resource limiting, including the CPU, memory, block I/O, and network. Since version 0.9, Docker includes the libcontainer library as its own way to directly use virtualization facilities provided by the Linux kernel, in addition to using abstracted virtualization interfaces via libvirt, LXC (Linux Containers) and systemd-nspawn.

## OpenBSD, Alpine linux and Docker

------

Always remembering [*russian Matryoshka*](https://steemit.com/openbsd/@npna/openbsd-tor-privoxy-and-the-browsers), we've decided to add another layer of virtualization to our workstation searching how to build [**adblock2privoxy**](http://projects.zubr.me/wiki/adblock2privoxy) in OpenBSD. Retaking our last video tutorial we've got **Alpine linux** correctly installed in a virtual environment in a OpenBSD host. Now we've to adjust some parameters in Alpine to finish the installation:
Add the virtual machine in automatic boot with the host OS:

```
# cat >> /etc/vm.conf <<EOF
vm "screencast" {
       memory 2048M
       disk "/home/taglio/Virtual/alpine-screencast.img"
       interface { switch "local" }
}
EOF
#
$ doas rcctl restart vmd
```

Connect to the serial console, press `ENTER` to boot the default `initramfs` and `kernel` and customize `syslinux` [bootloader](http://www.syslinux.org/) and enable the community repository of `apk` [packet manager](https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management):

```
alpine# cat /boot/extlinux.conf
SERIAL 0 115200
DEFAULT virthardened
PROMPT 0
LABEL virthardened
 MENU LABEL Linux virthardened
 LINUX vmlinuz-virthardened
 INITRD initramfs-virthardened
 APPEND root=UUID=ebf73ff9-7df6-463d-915f-0ab84f5e11e9 modules=sd-mod,usb-storage,ext4 quiet rootfstype=ext4
MENU SEPARATOR
alpine# cat /etc/apk/repositories
http://nl.alpinelinux.org/alpine/v3.7/main
http://nl.alpinelinux.org/alpine/v3.7/community
#
```

Doing so Alpine will reboot automatically without the need of press `ENTER` in `syslinux` prompt.
Generate `root` OpenBSD ssh keys and add to the `root` `authorized_keys` in the virtual Alpine:

```
$ doas su
# ssh-keygen
# ssh 10.1.10.2 mkdir /root/.ssh
# scp ./ssh/id_rsa.pub 10.1.10.2:/root/.ssh/authorized_keys
```

Upgrade Alpine packages and install our new friend, **Docker**:

```
alpine# apk update && apk upgrade
alpine# apk add docker
```

Configure Alpine `openrc` , the [**Gentoo**](https://gentoo.org/) [antagonist](https://wiki.gentoo.org/wiki/Project:OpenRC) of the *hugly infamous* [systemd](https://suckless.org/sucks/systemd), to boot on start our **Docker**.

```
alpine# rc-service docker start
alpine# rc-update add docker default
```

## adblock2privoxy Docker configuration

------

**Docker** container is a extremely flexible software. Have got thousand of different possible uses and configurations. And a *deep dive* into it will require an entire new series of articles (*asap* we will analyze it).
The most important think to understand, he has got a public internet libraries from where you can `pool` a system operative `image` into our local system. After pulling the correct one we can automate a serie of operation every time we `build` one of them into a `container`. I know...there's many new types of concepts here, but with practice it will be simple. Containers are super flexibles because for every command defined in a special file called `Dockerfile` they save a subcontainer in a `overlay` [filesystem](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/filesystems/overlayfs.txt).
This is the `Dockerfile` that we're going to use in this project:

```
alpine# mkdir docker
alpine# cat > Dockerfile << EOF
FROM debian:8

MAINTAINER Riccardo Giuntoli <r.giuntoli@protonmail.ch>

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install wget 

WORKDIR /root
RUN mkdir privoxy
RUN mkdir lists

RUN wget https://s3.amazonaws.com/ab2p/adblock2privoxy_1.4.2_amd64.debian8.deb
RUN dpkg -i adblock2privoxy_1.4.2_amd64.debian8.deb

RUN wget -O lists/easyprivacy.txt https://easylist.to/easylist/easyprivacy.txt 
RUN wget -O lists/easylist.txt https://easylist.to/easylist/easylist.txt
RUN wget -O lists/antiadblockfilters.txt https://easylist-downloads.adblockplus.org/antiadblockfilters.txt
RUN wget -O lists/malwaredomains_full.txt https://easylist-downloads.adblockplus.org/malwaredomains_full.txt
RUN wget -O lists/adblock-list.txt https://raw.githubusercontent.com/Dawsey21/Lists/master/adblock-list.txt

RUN adblock2privoxy -p ./privoxy lists/easyprivacy.txt lists/easylist.txt  \
   lists/antiadblockfilters.txt lists/malwaredomains_full.txt lists/adblock-list.txt

RUN tar -cvzf privoxy.tgz privoxy/
```

Let's dive a little bit into this `Dockerfile`:

1. `FROM`: key to specify base `image` where start to compile the `container` , in this key is a [**debian**](https://debian.org/) machine, stable version number **8**, codename [**jessie**](https://www.debian.org/releases/jessie/).
2. `MANTAINER`: simply the owner of this `Dockerfile`.
3. `RUN`: `exec` commands in the virtual debian environment.
4. `WORKDIR`: change the working directory.

In this specific docker application you can see that we download and install our **adblock2privoxy** software, download *bad boys* list maintained buy the guys of [**easylist.to**](https://easylist.to/), give to adblock2proxy and pack the result in a `tar.gz` archive.

## Automatic OpenBSD, Alpine and Docker process

Our goal is the automatize all the process and every week update ours **privoxy** rules. We've got an environment with three distinct system operatives, one OpenBSD and two Linux, it's like an orgy.
Let's start to create a little `ash` script in our **Alpine**:

```
alpine# mkdir bin
alpine# cat > bin/automatic_docker.sh <<EOF
cd docker/ && docker build -t adblock2privoxy-bootstrap:final .
ASDF=`docker run -d -t adblock2privoxy-bootstrap:final /bin/bash`
docker cp $ASDF:/root/privoxy.tgz .
docker system prune -f
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
EOF
```

1. `docker build`: Build an image from a Dockerfile.
2. `docker run`: Run a command in a new container.
3. `docker system prune`: Remove unused data.
4. `docker stop`: Stop one or more running containers.
5. `docker rm`: Remove one or more containers.
6. `docker rmi`: Remove one or more images.
7. `docker ps`: List containers.
8. `docker images`: List images.

Next combine it with a little `ksh` *magic* in our **OpenBSD**:

```
#/bin/sh
ssh 10.1.10.2 rm -rf /root/docker/privoxy.tgz
ssh 10.1.10.2 sh /root/bin/automatic_docker.sh
scp 10.1.10.2:/root/docker/privoxy.tgz /etc/privoxy/adblock2privoxy.tgz
cd /etc/privoxy/
tar zxvf adblock2privoxy.tgz
```

Very basic, i know, it simply remove old output, run the Alpine script, copy and `untar` the output in our **privoxy** directory.
Just add a `crontab` weekly script in OpenBSD and indicate to the [*three browsers*](https://steemit.com/openbsd/@npna/openbsd-tor-privoxy-and-the-browsers) to do the **things work like a charm**.

```
# crontab -l | tail -n 1
5       12      *       *       2       /bin/sh /root/bin/automatic_adblock2privoxy.sh
# 
# cat >> /etc/privoxy/firefox <<EOF
actionsfile adblock2privoxy/ab2p.system.action
actionsfile adblock2privoxy/ab2p.action
filterfile adblock2privoxy/ab2p.system.filter
filterfile adblock2privoxy/ab2p.filter
EOF
# cat >> /etc/privoxy/chrome <<EOF
actionsfile adblock2privoxy/ab2p.system.action
actionsfile adblock2privoxy/ab2p.action
filterfile adblock2privoxy/ab2p.system.filter
filterfile adblock2privoxy/ab2p.filter
EOF
# cat >> /etc/privoxy/torbrowser <<EOF
actionsfile adblock2privoxy/ab2p.system.action
actionsfile adblock2privoxy/ab2p.action
filterfile adblock2privoxy/ab2p.system.filter
filterfile adblock2privoxy/ab2p.filter
EOF
```

And with this **triple cat** i remember to you **all** that the wind of changes is blowing.

*i love you*,

# OpenBSD and FreeDOS vs the hell in earth

**[npna (33)](https://steemit.com/@npna)**in [#openbsd](https://steemit.com/trending/openbsd) • 2 years ago (edited)

## The family is rapidly growing

------

![GENOVA antifascista](https://steemitimages.com/640x0/https://scontent-otp1-1.xx.fbcdn.net/v/t1.0-9/26992485_10215637286587786_5182180295980038263_n.jpg?oh=7fd752bfb4977878a635cda33d79d682&oe=5B150DBE)

Yes sir, yes. Our family, composed until now by [OpenBSD](https://www.openbsd.org/), [Alpine Linux](https://www.alpinelinux.org/) and [Docker](https://www.docker.com/) is rapidly growing. And yes, sir. Yes. All together we're fighting against your best friends, the infamous, the ugliest, the worst...the dudes called *the privacy cannibals*. Do you know what i mean, sure?
We're working hard, no matter what time is it, no matter in what part in the world we are, no matter if we've **no money**. We perfectly know that you cannot do nothing against **the true**. And we're doing our best to expand our true, our doors are opened to all the *good guys*, there's a lot here but their brain was fucked by your shit tv, your fake news, your laws, etc etc etc. We're alive, we're **here to fight against you**.
Tonight, yes *it's a Friday night and we're working*, we're ready to welcome with open arms an *old guy*, his experience will give us more power. Welcome to:

[**FreeDOS**](http://www.freedos.org/)

> FreeDOS is a complete, free, DOS-compatible operating system that you can use to play classic DOS games, run legacy business software, or develop embedded systems. Any program that works on MS-DOS should also run on FreeDOS.
> It doesn’t cost anything to download and use FreeDOS. You can also share FreeDOS for others to enjoy! And you can view and edit our source code, because all FreeDOS programs are distributed under the GNU General Public License or a similar open source software license.

## UEFI

------

![The hell in earth](https://steemitimages.com/640x0/https://scontent-frx5-1.xx.fbcdn.net/v/t1.0-9/22886001_10214894127769280_7559827501261378744_n.jpg?oh=3f015f59bfb1b5b3d7fa53c0cfe848a4&oe=5B1A8A6A)

But why we want to build a bootable usb stick with **FreeDOS** under our strong **OpenBSD**? The answer is as usual to fight against the privacy cannibals!
More than one decade ago the old [**BIOS**](https://en.wikipedia.org/wiki/BIOS) was silently replaced by the more capable and advanced [**UEFI**](http://www.uefi.org/), this is absolutely normal because of the pass of the years and exponencial grow of the power of our personal computers. [**UEFI**](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface) is a complex system, it's like a standalone system operative with direct access to every component of our (*yes, it's our not your!*) machine. But...wait a moment...do you know how to use it? Do you ever know that it exist? And one more thing, *it's secure*? The answer to this question is totally insane, no, *it's not secure*. The idea is good, the company that started in theory is one of the most important in IT, it's [**Intel**](https://www.intel.co.uk/content/www/uk/en/homepage.html?_ga=2.49642342.1336926968.1517604803-1923177664.1517604803).
The history is very large and obviously *we're going to go very deep in it*, but trust me **UEFI** and the various friend of him, like [**ME**](https://en.wikipedia.org/wiki/Intel_Management_Engine), [**TPM**](https://en.wikipedia.org/wiki/Trusted_Platform_Module) are insecure and closed source! Like **the hell in earth**.

## Lenovo UEFI BIOS without Windows?

------

![chaos](https://steemitimages.com/640x0/https://lh4.googleusercontent.com/ywq-n7n21H-S1x6vfI39fyRfgqJNtrzEd57IMNpMrofO6kr90wqUBDds7bpBvbmAsg3BC5ONqCV8nePRIj_o=w1366-h601)

There's no simple method to upgrade our personal computer if we've uninstall Windows...ou it's the first time that i write this name, shit! And it's basic for the users have one, because *UEFI* is living under the hood, in the first ring after the hardware. *It's the most important think to keep secure and clean!* There is no clean information, there is nothing, only there's [Χάος](https://en.wikipedia.org/wiki/Chaos_(mythology)).
Remember well people, *they love Χάος*.

## A FreeDOS bootable usb image under OpenBSD

------

But let's start preparing our **OpenBSD** to put order in this chaos:

```
$ mkdir -p freedos/stuff
$ cd freedos/stuff
$ wget https://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/distributions/1.0/fdboot.img
$ wget https://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/dos/sys/sys-freedos-linux/sys-freedos-linux.zip
$ wget https://download.lenovo.com/consumer/desktop/o35jy19usa_y900.exe
$ wget http://145.130.102.57/domoticx/software/amiflasher/AFUDOS%20Flasher%205.05.04.7z
```

Explanation in clear language as usual: create two directory, download the minimal boot disc image of **FreeDOS**, download [Syslinux](http://www.syslinux.org/wiki/index.php?title=The_Syslinux_Project) assembler [**MBR**](https://en.wikipedia.org/wiki/Master_boot_record) bootloaders, download the last *Windows only* UEFI update from [Lenovo](https://pcsupport.lenovo.com/) and download the relative *unknown* utility from [**AMI**](https://ami.com/en/) to flash our motherboard UEFI chipset. Go ahead:

```
$ doas pkg_add -U nasm unzip dosfstools cabextract p7zip
```

1. `nasm` the Netwide Assembler, a portable 80x86 assembler.
2. `unzip` list, test and extract compressed files in a ZIP archive.
3. `dosfstools`a collections of utilities to manipulate `MS-DOS`fs.
4. `cabextract` program to extract files from cabinet.
5. `p7zip`collection of utilities to manipulate `7zip` archives.

```
$ mkdir sys-freedos-linux && cd sys-freedos-linux
$ unzip ../sys-freedos-linux.zip
$ cd ~/freedos && mkdir old new
$ dd if=/dev/null of=freedos.img bs=1024 seek=20480
$ mkfs.fat freedos.img
```

Create another working directory, cd into it, unzip the archive that we've downloaded, return to the *working root* and create another twos directories.
`dd`is one of the most important utilities in the *unix* world to manipulate at *byte level* **input** and **output**:

> The dd utility copies the standard input to the standard output, applying
> any specified conversions. Input data is read and written in 512-byte
> blocks. If input reads are short, input from multiple reads are
> aggregated to form the output block. When finished, dd displays the
> number of complete and partial input and output blocks and truncated
> input records to the standard error output.

We're creating here a *virtual* disk with `bs=1024` we're setting both input and output block to `1024`bytes; with `seek=20480` we require `20480`bytes. This is the result:
`-rw-r--r-- 1 taglio taglio 20971520 Feb 3 00:11 freedos.img`.
Next we format the virtual disk using the `MS-DOS` filesystem. Go ahead:

```
$ doas su
# perl stuff/sys-freedos-linux/sys-freedos.pl --disk=freedos.img
# vnconfig vnd0 stuff/fdboot.img
# vnconfig vnd1 freedos.img
# mount -t msdos /dev/vnd0c old/
# mount -t msdos /dev/vnd1c new/
```

We use the `perl` utility from `syslinux` to write the MBR of our virtual disk `freedos.img`. Next we create to `loop` virtual node using the **OpenBSD** utility `vnconfig`. Take care here because *it is quite different from Linux*, but as usual is *clear and simple*. The virtual nodes are associated to the downloaded `fdboot.img` and the newly created `freedos.img`. Next we mount the two virtual nodes `c`partitions; in **OpenBSD** `c`partition describes the entire physical disk. *Quite different from Linux, take care*.

```
# cp -R old/* new/
# cd stuff
$ mkdir o35jy19usa
$ cabextract -d o35jy19usa o35jy19usa_y900.exe
$ doas su
# cp o35jy19usa/ ../new/
$ mkdir afudos && cd afudos
$ 7z e ../AFUDOS*
$ doas su
# cp AFUDOS.exe ../../new/
# umount ~/freedos/old/ && umount ~/freedos/new/
# vnconfig -u vnd1 && vnconfig -u vnd0
```

Copy all files and directories in the new virtual node partition, extract the Lenovo cabinet in a new directory, copy the result in our new image, extract the `afudos` utility and like the others copy it. Umount the partitions and destroy the **loop vnode**.



# OpenBSD FreeDOS usb stick and a brief about QEMU



## In the last chapter...

------

![the terminator](https://steemitimages.com/640x0/https://images.duckduckgo.com/iu/?u=http%3A%2F%2F2.bp.blogspot.com%2F-ezjdI7-BZFc%2FTc6Ooc4pGVI%2FAAAAAAAAMlQ%2FAZ54weX0YhA%2Fs1600%2FTERMINATOR5.jpg&f=1)

Hello there, nice people. Machines and technology, take care i'm in love with the twos but i command them they cannot own me, today are so so dangerous. Obviously we're not in the post apocalyptic scene *predicted* by **James Cameron** long time ago, in the **1984** with the futuristic (*just now*) film [**The Terminator**](http://www.imdb.com/title/tt0088247/). But i don't think that *we are not so distance from it*. *But this is off-topic and i don't have sufficient information to argue it*. Simply take care. **Take child off technological dispositives**.
So in our [last article](https://steemit.com/openbsd/@npna/openbsd-and-freedos-vs-the-hell-in-earth) we build with **OpenBSD** a **FreeDOS** *raw* image and now we want to write directly to a **usb stick**. I've presented to you OpenBSD like a very *clean and clear* system; and it's absolutely true. But if you came here with a Linux background it could not appear like this to you, and yes...you have got reason.
One of the biggest wall you have to pass to enter in the *OpenBSD world* is understand how he handle **mass storage devices**, or *disks*.
**OpenBSD** for x86 and amd64 handle storage with two drivers wich manual pages you could find at:

1. `man 4 wd`, driver compatible with standards `MFM`, `RLL`, `ESDI`, `IDE`, and `EIDE` drives, as well as `Serial ATA` drives, and `PCMCIA/CF` storage media.
2. `man 4 sd`, driver compatible with standards `SCSI` that includes USB disks, SATA disks attached to an ahci(4) interface, and disk arrays attached to a RAID controller.
   Devices are number on boot stage in the sequence that they are found, from `0`to `x`.

Partitions means two different thinks in **OpenBSD**:

1. filesystem partitions created and managed by `disklabel`. We can find more information about it at `man 8 disklabel`.
2. `MBR`, `GPT`, that can be named also like *BIOS partitions*, because they are created using the `BIOS controller`, that are managed by `fdisk`. We can find more information about at `man 8 fdisk`.

## Write an usb stick with OpenBSD

------

![OpenBSD](https://steemitimages.com/640x0/https://www.openbsd.org/images/tshirt-2.jpg)

Let's see what happened when we plug an usb stick:

```
$ dmesg | tail -n 5
umass0 at uhub0 port 1 configuration 1 interface 0 "SanDisk Cruzer Blade" rev 2.00/2.01 addr 5
umass0: using SCSI over Bulk-Only
scsibus4 at umass0: 2 targets, initiator 0
sd2 at scsibus4 targ 1 lun 0: <SanDisk, Cruzer Blade, 2.01> SCSI4 0/direct fixed serial.888888888888888888
sd2: 3819MB, 512 bytes/sector, 7821312 sectors
```

We can see that the device `sd2` is initialized and it is a 4GB USB stick. Do directly write our boot `FAT-16`disk image that we previously created we don't have to take care about any partition of any kind, the virtual disk image have his personal `MBR`and filesystem. So we directly write to the disk with the `dd`utility, we can find more information about it at `man 1 dd`.

```
$ doas disklabel sd2
# /dev/rsd2c:
type: SCSI
disk: SCSI disk
label: Cruzer Blade    
duid: 0000000000000000
flags:
bytes/sector: 512
sectors/track: 63
tracks/cylinder: 255
sectors/cylinder: 16065
cylinders: 486
total sectors: 7821312
boundstart: 0
boundend: 7821312
drivedata: 0 

16 partitions:
#                size           offset  fstype [fsize bsize   cpg]
  c:          7821312                0  unused                    
  i:          7821312                0   MSDOS 
```

The `c` partition simply identify the entire disk, so:

```
$ doas dd if=~/freedos/freedos.img of=/dev/sd2c bs=4M
$ doas sync
$ doas sync
```

Now simply reboot the personal computer, select from `BIOS`the USB stick to boot and enjoy **FreeDOS**.

## Virtualize FreeDOS full with QEMU

------

![QEMU](https://steemitimages.com/640x0/https://images.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.fB91mTfs8H5RQTykFT-ytwHaEj%26pid%3D15.1&f=1)
Just in case you thinking that i'm alone, i've decided to add *another friend* in my personal *list of good guys*. It's another way to handle virtual machines under **OpenBSD**. It's a lot more sophisticated and older than *OpenBSD vmm* but in this case is not *kernel accelerated*. We will dedicate to it many others POST but for now let's see how to install it under **OpenBSD** and next we will attach a video document about the process of instalation of the latest version of **FreeDOS**, the `1.2`. Simply add to the packages like this:
`$ doas pkg_add -U qemu`
And here you are the video:

<iframe frameborder="0" allowfullscreen="allowfullscreen" webkitallowfullscreen="webkitallowfullscreen" mozallowfullscreen="mozallowfullscreen" src="https://www.youtube.com/embed/sZlZgt6YSg4" width="640" height="360" style="box-sizing: inherit; max-width: 100%; max-height: 75vw; position: absolute; width: 640px; height: 359.672px; left: 0px; top: 0px;"></iframe>

## Greetings

------

As usual have a good night, thank you for spend you time reading me.
Nice regards,

*Riccardo Giuntoli*

