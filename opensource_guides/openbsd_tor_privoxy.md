# OpenBSD, Tor and the The Fourteen Eyes

![img](https://steemitimages.com/0x0/https://www.openbsd.org/images/puffy62.gif)

## INTRODUCTION TO THE FACTS

***H***ello people, got a good Saturday? Ready to open tons of bottles tomorrow? ***I***'m not...this year specially, i'm not ready. I will **return** on the street without any doubt, but this ~~the~~ another story.

So in our hands there's the **nightmare** of  the **security cannibals**, the *fish* more difficult to take. There's OpenBSD. He (yes, it's a person, it's ***my best friend***) is a pure BSD 4.4 based Unix that never fail to his customer, respecting rules that, i'm my opinion, are fundamental blocks of great secures peaces of software:

1. Clean and clear code.
2. Default install with the necessary, no less no more.
3.  Very easy to use for a new customer.

Yes, the point three will open yours eyes i know, you will be accuse my to be insane....Well for sure... ***i'm totally insane*** but OpenBSD it's very clear and simple to manage. The secret it's to follow simple rules very easy to understand for the new and semi-new customer. OpenBSD don't use strange, absurd and long explication or vocabulary to explain the things. He will do it in simple way. 

Remember, where you will find tons of code, many times there some *fantastic genius* that have done it to take you away from **the source code**. Adding complexity and time to understand basics procedure it's absolutely not a sign of great knowledge, it's a medieval procedure to maintain people away from the real purpose, that in this case will be obtain the keys to an extreme powerful, secure and clear Unix: OpenBSD.

I love Linux, but nowadays something, someone, or whatever the name you will use are totally destroy it. Millions of lines of code and complexity that have grow up a lot at low level code. For low class customer can use it with nice visual effects..

It's not difficult to understand, think about the new **systemd**, adopted for A LOT of great Linux distribution. Here are some links that will help you thing and OPEN your mind.

- https://suckless.org/
- https://suckless.org/sucks/systemd
- http://without-systemd.org/wiki/index.php/Arguments_against_systemd

And this only the first thing that i've got in my mind when a speak about the beautiful but terribly fucked Linux, that it's NOT secure by default.

##  TOR, ONE GOD OR ONE IMPOSTOR (IT DON'T HAVE THE 'H')

![img](https://steemitimages.com/640x0/http://www.ancientpages.com/wp-content/uploads/2017/06/thormidgardsorm11.jpg)

***T***or in computer science, that is what i'm speaking about with some Baroque embellishments, is the state of the art to theoretically preserve **privacy** of a Internet user. Remember very well, it was not designed to act like a **security** machine but like a **privacy** ensure. Is an open source software that enable anonymous communication  in Internet. It can be stacked with other technologies, like vpn or i2p, to try conceal our real ip address and geo point of source.

***Th***or mythologically speaking, was son of Odin, dedicated to the protection of mankind and of the fortress of Asgard.

But..¿Was or is T**[h]**or really dedicated to the protection of the truth or does it complain also with other more obscures functions? A great question with a very difficult reply without a lot of sentiment and passion. I'm trying to do it better that i can but i really appreciate T**[h]**or. Really.

In real world, ou Jesus..real...in the binary system, Tor also open to the user, the man who navigate the Internet ocean, the access to the subterranean Internet, the (in)famous [#deepweb](https://steemit.com/trending/deepweb), or Deep Internet. And like all the things that we know, deep can be deeper and deeper and deeper and so on. Many people think that [#deepinternet](https://steemit.com/trending/deepinternet) is many times bigger than the Internet, is this true? Nobody, that i know ... ¿you know? know the answer. Like the deepest ocean in nature, i cannot explain to you what is the deepest Internet and who is the owner of that obscure site.

So it's normal that sometimes i was thinking about T[h]or more like Χάρων

Here you are some URI to try to do some light more on that themes:

- https://www.torproject.org/
  - https://guardianproject.info/apps/orbot/
  - https://www.torproject.org/projects/torbrowser.html.en
  - https://ooni.torproject.org/
  - https://atlas.torproject.org/
  - https://nyx.torproject.org/

## THE FOURTEEN EYES

![img](https://steemitimages.com/640x0/https://restoreprivacy.com/wp-content/uploads/2017/10/5-Eyes-9-Eyes-14-Eyes-2.png)

But let's start together configuring those two fantastic open source project, and remember that Tor is not simple and easy like OpenBSD is.

Simply search and install tor and a good manager in nvcurse and gtk to admin it, we find in the classic port tree of OpenBSD:

```
$pkg_info -Q tor arm
$pkg_add -U tor arm
```

Arm is the the next Nyx.

We will use it like a foreground program, without launch it from rc. In this first and simple configuration it will act like a SOCKS proxy, configure only some kind of nation like good jump in our tor path to the Internet and little more.

We will use Arm with the same preinstaller `_tor` user that use OpenBSD package. So:

```
$doas chown -R _tor ~/.arm
$ doas cat > ~/.arm/.torrc << EOF 
DataDirectory /home/taglio/.arm/tor_data # location to store runtime data
Log notice file /home/taglio/.arm/tor_log # location to log notices, warnings, and errors
ControlPort 9051      # port controllers can connect to
CookieAuthentication 1     # method for controller authentication
ExitNodes {RO},{CH}
ExcludeNodes {AU},{CA},{US},{NZ},{UK}
EntryNodes {BE},{DE},{IT},{NL}
StrictNodes 1
SocksPort 9900
EOF
```

We're now interested in initialize arm configure and explain what the hell are those `{}`

https://en.wikipedia.org/wiki/UKUSA_Agreement

https://www.privacytools.io/#ukusa

Only the acronym is obscure yet. `UKUSA` 

Read with your eyes what the hell is this democratic right abuse and masochism. Here up in those links.

So in `torrc` we can indicate to our Tor how to don't pass through one nation that remiss to *"The Fourteen Eyes"*.  

I use to enter in this example Belgium or German or Italy or Holland, and after an unknown jump i will leave the Tor network passing or for Romania or for Swiss.

No only the correct launch for the same Tor and we can go to sleep :P

```
$doas -u _tor tor -f toorrc
$doas -u _tor arm
```

Explore the deepest that you can, but remember the more deep you arrive more pressure and less oxygen you will find.

# OpenBSD, Tor transparent local proxy.

## Background

------

**J**ust in the case that you've missed our last article we're speaking about *OpenBSD*, the most secure open source system operative in the world, and *Tor*, a free software for enabling anonymous communication.
In our [first post](https://steemit.com/openbsd/@npna/openbsd-tor-and-the-the-fourteen-eyes) we have done an introduction and a first configuration creating a tor service with only one local socks port opened for a static user configuration.
We've also introduced the concept of [FVEY](https://en.wikipedia.org/wiki/Five_Eyes) that we will continue to analyze as soon as possible.
What we don't touch last time is the important fact that this two fabulous softwares have got a strange difficult history of interoperability between them. OpenBSD is in ours life from middle of the nineteen and Tor, the onion router project, from September 2002.
![torbsd proyect](https://steemitimages.com/640x0/https://avatars3.githubusercontent.com/u/11576463?s=200&v=4)
But only with the birth of the [torbsd proyect](https://torbsd.github.io/) the configuration of the anonymizing daemon is something simple and easy as it have to be. We can study read and fork the work of the torbsd fellows at [github](https://github.com/torbsd/).

## Tor daemon in a OpenBSD system

------

Starting from a clean OpenBSD install we will install Tor from packages:

```
$ doas pkg_add -U tor
$ doas pkg_add -U arm # ncurse control tool
```

To see what files were added to our operative system with the install of those two packages simply use (*package tor in the example*):

```
$ pkg_info -L tor
Information for inst:tor-0.3.0.10
Files:
/usr/local/bin/tor
/usr/local/bin/tor-gencert
/usr/local/bin/tor-resolve
/usr/local/man/man1/tor-gencert.1
/usr/local/man/man1/tor-resolve.1
/usr/local/man/man1/tor.1
/usr/local/share/doc/tor/tor-gencert.html
/usr/local/share/doc/tor/tor-resolve.html
/usr/local/share/doc/tor/tor.html
/usr/local/share/examples/tor/torrc.sample
/usr/local/share/tor/geoip
/usr/local/share/tor/geoip6
/etc/rc.d/tor
```

## The torrc file

------

![tor network](https://steemitimages.com/640x0/https://images.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.VRtVhS3jk6inTyKwFDFLvQEsCs%26pid%3D15.1&f=1)

Now we have to configure the `torrc` file in `/etc/tor/torrc` :

```
$ doas cat <<EOF >> /etc/tor/torrc
User _tor
RunAsDaemon 1
AvoidDiskWrites 1
GeoIPFile /usr/local/share/tor/geoip
GeoIPv6File /usr/local/share/tor/geoip6
VirtualAddrNetwork 10.192.0.0/10
AutomapHostsOnResolve 1
TransPort 127.0.0.1:9040
DNSPort 127.0.0.1:53
DataDirectory /var/tor 
Log notice file /var/log/tor_log 
ControlPort 127.0.0.1:9051           
CookieAuthentication 1        
ExcludeNodes {AU}, {CA}, {US}, {NZ}, {GB}, {DK}, {FR}, {NL}, {NO}, {BE}, {DE}, {IT}, {ES}, {SE}
NodeFamily {AU}, {CA}, {US}, {NZ}, {GB}, {DK}, {FR}, {NL}, {NO}, {BE}, {DE}, {IT}, {ES}, {SE}
StrictNodes 1
GeoIPExcludeUnknown 1
SocksPort 127.0.0.1:9900
PathsNeededToBuildCircuits 0.95
EOF
```

Prepare the environment:

```
$ doas mkdir /var/tor
$ doas chown -R _tor:_tor /var/tor
$ doas chown _tor:_tor /dev/pf
$ doas touch /var/log/tor_log
$ doas chown _tor:_tor /var/log/tor_log
```

Let's explain every option in the `torrc` :

1. **User**: after open the sockets the daemon will work under the UID of.
2. **RunAsDaemon**: to launch or not the daemon in the background.
3. **AvoidDiskWrites**: try to write to disk less frequently.
4. **GeoIpFile**: where is in the fs tree.
5. **GeoIpv6File**: where is in the fs tree.
6. **VirtualAddrNetwork**: *will try to explain later*.
7. **AutomapHostsOnResolve**: control VirtualAddrNetwork.
8. **TransPort**: transparent proxy port where tor communicate with pf.
9. **DnsPort**: port where tor dns resolver accept queries.
10. **DataDirectory**: where tor put his session stuff.
11. **Log notice file**: log file (*don't know why accept spaces here*).
12. **ControlPort**: port where arm or others have to connect to control tor.
13. **CookieAuthentication**: bool to indicate the authentication mode in control port.
14. **ExcludeNodes**: where we don't want to go in ours tor circuits using ISO 3166 country code.
15. **NodeFamily**: build a unique family with those codes.
16. **StrictNodes**: strictly respect our ExcludeNodes list.
17. **GeoIPExcludeUnknown**: if it don't know where is the tor relay simply don't use it.
18. **SocksPort**: static port socks 4/5 listener (*will deepen later*).
19. **PathsNeededToBuildCircuits**: tor won’t build circuits until it has enough descriptors or microdescriptors to construct that fraction of possible paths.

Now we've to be sure that `dhclient`will not rewrite `/etc/resolv.conf`. In OpenBSD we've to add this to `/etc/dhcpclient.conf`:

```
$ doas cat <<EOF >> /etc/dhclient.conf
    supersede domain-name-servers 127.0.0.1;
EOF
$ doas sh /etc/netstart
```

## The pf.conf file

------

![the pf firewall](https://steemitimages.com/640x0/https://images.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.echothrust.com%2Fsites%2Fdefault%2Ffiles%2Fstyles%2Fmedium%2Fpublic%2Fopenbgpdpf-icon.png%3Fitok%3DDWz4H6Mi&f=1)

OpenBSD was the first system operative to use one of the most powerful firewall, **pf**.
In others POST we will better analyze how to properly use this monster, but for now simply use this `pf.conf` to create a transparent firewall in an OpenBSD system newer than the 4.7 version.
We create another loopback interface in our system to play a little with internal routing:

```
$ doas ifconfig lo1 create up 127.0.0.2
$ doas cat <<EOF >> /etc/hostname.lo1
inet 127.0.0.2
EOF
```

And use those directives in our `pf.conf` :

```
$ doas cat <<EOF >> /etc/pf.conf
# destinations you don't want routed through Tor
non_tor = "{ 10.0.0.0/8 172.16.0.0/12 192.168.0.0/16 }"
# Tor's TransPort
trans_port = "9040"

match in all scrub (no-df random-id reassemble tcp)
antispoof for egress inet
block return log on egress all

pass in quick on lo1 inet proto tcp all flags S/SA modulate state rdr-to 127.0.0.1 port $trans_port
pass in quick on lo1 inet proto udp to port domain rdr-to 127.0.0.1 port domain

pass quick on { lo0 lo1 }

pass out quick inet proto tcp user _tor flags S/SA modulate state
pass out quick inet proto udp to port domain route-to lo1
pass out quick inet to $non_tor
pass out inet proto tcp all route-to lo1
EOF
```

Here you are some examples on how to use the pf firewall:

- pfctl -e (enable)

- pfctl -d (disable)

- pfctl -f /etc/pf.conf (load rules)

- pfctl -nf /etc/pf.conf (parse file, don't load)

- pfctl -sr (show current ruleset)

- pfctl -ss (show current state table)

- pfctl -si (show filter stats and counters)

- pftcl -sa (show all)

- pfctl -t table -T flush (flush table)

- pfctl -k 192.168.1.80 (kill connections for host 80)

- pfctl -t

  -T expire 86400 -flush table (entries added in last 24 hours)

- add -vv to any for more info

## Start tor at boot

------

Last configuration is to activate tor at start.
*¿Will you use this daemon to protect your privacy or to access to the [#deepinternet](https://steemit.com/trending/deepinternet)?*

```
$ doas rcctl enable tor
$ doas reboot
```

**stay tuned for more OpenBSD, tor and deep Internet posts**, i love you.

# OpenBSD, Tor, 14 applications example. PART 1

## Fourteen application, the first three are browsers

------

First of all sorry for the delay, but i was busy with real life and i cannot go on with our series.
Let's start to analyze every step necessary to configure use of the TCP/IP socks sockets that we opened in our [last article](https://steemit.com/openbsd/@npna/openbsd-tor-and-the-streams-isolation).

## Firefox

------

![Firefox tor sockv5 configuration](https://steemitimages.com/640x0/https://lh6.googleusercontent.com/NQheoWsSqyJsFDMzaCTnnCHlQKu0A27zoxVr1XakuBW7ck_bECi-bMOeb5oWNbm_DNjHUR2Umo_IYbT7E5DS=w1366-h650)

Like we can see in the image:

1. open `about:preferences#advanced`
2. click on `network` tab
3. click on `Settings`
4. check `Manual proxy configuration`
5. write on `SOCKS Host`the local ip `127.0.0.1` and `Port` `9900`
6. write on `No proxy for` `localhost, 127.0.0.1, 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16` that are privates network as [RFC1918](https://tools.ietf.org/html/rfc1918).

## Chromium

------

As default chromium has no simple option to set a proxy server different from the system wide proxy. But we've done a little *hack*.

```
$ which chrome
/usr/local/bin/chrome
$ file /usr/local/bin/chrome
/usr/local/bin/chrome: Bourne shell script text executable
```

So here we can appreciate that chrome in our **OpenBSD workstation** is not an executable but is a shell script, here is a cat:

```
·$ cat /usr/local/bin/chrome
#!/bin/sh
# $OpenBSD: chrome,v 1.14 2016/06/02 21:03:38 sthen Exp $

DATASIZE="716800"
OPENFILES="400"

xm_log() {
        echo -n "$@\nDo you want to run Chromium anyway?\n\
(If you don't increase these limits, Chromium might fail to work properly.)" | \
                /usr/X11R6/bin/xmessage -file - -center -buttons yes:0,no:1 -default no
}

if [ $(ulimit -Sd) -lt ${DATASIZE} ]; then
        ulimit -Sd ${DATASIZE} || \
                xm_log "Cannot increase datasize-cur to at least ${DATASIZE}"
                [ $? -eq 0 ] || exit
fi

if [ $(ulimit -Sn) -lt ${OPENFILES} ]; then
        ulimit -Sn ${OPENFILES} || \
                xm_log "Cannot increase openfiles-cur to at least ${OPENFILES}"
                [ $? -eq 0 ] || exit
fi

if ! mount | grep `df -h /usr/local | tail -1 | awk '{print $6}'` | 
        grep -q wxallowed; then 
        echo "Filesystem containing /usr/local must have the 'wxallowed' flag" | 
            /usr/X11R6/bin/xmessage -file - -center -buttons exit:0 -default exit
        exit
fi

#
# Temporary workaround for the case when chromium crashes and leaves
# the SingletonLock, which prevents chromium to start up.
#
if [ -h ${HOME}/.config/chromium/SingletonLock ]; then
        _pid=`readlink ${HOME}/.config/chromium/SingletonLock | cut -d '-' -f 2`
        kill -0 ${_pid} 2>/dev/null
        if [ $? -gt 0 ]; then
                rm ${HOME}/.config/chromium/SingletonLock
        fi
fi

#
# Issue #395446
# https://code.google.com/p/chromium/issues/detail?id=395446
#
[ -z ${LANG} ] && _l=en_US.UTF-8 || _l=${LANG}

LANG=${_l} exec "/usr/local/chrome/chrome" "${@}" "--proxy-server="socks5://127.0.0.1:9901""
```

How you can see int last line of the script there is the real `exec`of the binary that in OpenBSD is located in `/usr/local/chrome/chrome` .
Simply *concat* in the same line of the var LANG the string `"--proxy-server="socks5://127.0.0.1:9901"`and close the sentence with a `"`that we've previously remove from the old sentence (the last one that you will find doing a `cat`). You can appreciate that for `chrome`we use socksv5 port `9901`.

## Tor browser

------

Tor browser is an open source fork of Firefox. It's maintained by the torproject folks. You can find the binaries [here](https://github.com/TheTorProject/gettorbrowser.git) in github. But remember that we're using OpenBSD and the Tor browser bundle is available in the ports tree. To download the binary for OpenBSD do:

```
$ doas pkg_add -U tor-browser
```

But `tor-browser`have got a `tor daemon` included that control via the `tor button` that we can launch via the onion icon on the left of the navigation bar. The first time that we execute this browser simply accept the default settings waiting to `connect`on the window that appear. But next:

![Tor browser onion button first window](https://steemitimages.com/640x0/https://lh3.googleusercontent.com/XGPNeUdWVWcW5rBkQGTl6SJwWKYUKLOwuxbX8elxmpVY3niDWIleBQMaSGmjp4Z-s5LM9LKH9nGYrH48Zvzu=w1366-h650)

This is the first sub window if we click on the `onion button`. Let's assume that we will use `tor browser`with the most deep navigation in the web. So click on `security settings` and:

![Tor browser security settings](https://steemitimages.com/640x0/https://lh4.googleusercontent.com/hSwsMxRqQGTJs1FxN28aZRSJrEhvvUkY7fDQaBHbw_flp4DUrhRKCYfnFb-_wdxDqEUdeGObrlJEpQjkG80Z=w1366-h650)

Use the `High` position to garantized the best shields for this *new adventure* .
Next return to the previous window and click on `Tor network settings`

![Tor browser network settings](https://steemitimages.com/640x0/https://lh3.googleusercontent.com/LjlF-MkOyxxe2UST5hbGMtYonduQf9ywlJMomEWst5MB0gFZBzjXG0tiCcuAliKSb1wQ8JpM7fB4ZBVOw-Df=w1366-h650)

1. Check `This computer need to use a local proxy to access the Internet`
2. Select for `Proxy Type`the option `SOCKS 5`
3. Write in `Address` `127.0.0.1` and in `Port` `9902`

Now...there's some post on the web that does not recommend concatenate **Tor over Tor**, like [this](https://trac.torproject.org/projects/tor/wiki/doc/TorifyHOWTO#ToroverTor); but there is no exact explication so i really don't think so.

Remember that we have banned **ALL** the fourteens eyes country in our [last](https://steemit.com/openbsd/@npna/openbsd-tor-and-the-streams-isolation) configuration. I quoted the explication from [privacytools.io](https://www.privacytools.io/) :

> The UKUSA Agreement is an agreement between the United Kingdom, United
> States, Australia, Canada, and New Zealand to cooperatively collect,
> analyze, and share intelligence. Members of this group, known as the
> Five Eyes, focus on gathering and analyzing intelligence from
> different parts of the world. While Five Eyes countries have agreed to
> not spy on each other as adversaries, leaks by Snowden have revealed
> that some Five Eyes members monitor each other’s citizens and share
> intelligence to avoid breaking domestic laws that prohibit them from
> spying on their own citizens. The Five Eyes alliance also cooperates
> with groups of third party countries to share intelligence (forming
> the Nine Eyes and Fourteen Eyes), however Five Eyes and third party
> countries can and do spy on each other.

In the configuration of the `tor daemon`that came with `tor browser`we force tor to use the countries of the **nine eyes group** that will be the first three hops of ours jumps in the tor network. Doing so we will use **six** hops to navigate the Internet.
This are the files shipped with `tor launcher` (a sub packet of `tor browser`):

```
$ pkg_info -L tor-launcher
Information for inst:tor-launcher-0.2.12.3p0

Files:
/usr/local/lib/tor-browser-7.0.5/browser/extensions/tor-launcher@torproject.org.xpi
/usr/local/share/tor-browser/torrc-defaults
```

Open `torrc-defaults` with your favorite text editor and add:

```
ExcludeNodes {AD},{AE},{AF},{AG},{AI},{AL},{AM},{AO},{AQ},{AR},{AS},{AT},{AU},{AW},{AX},{AZ},{BA},{BB},{BD},{BE},{BF},{BG},{BH},{BI},{BJ},{BL},{BM},{BN},{BO},{BQ},{BR},{BS},{BT},{BV},{BW},{BY},{BZ},{CA},{CC},{CD},{CF},{CG},{CH},{CI},{CK},{CL},{CM},{CN},{CO},{CR},{CU},{CV},{CW},{CX},{CY},{CZ},{DE},{DJ},{DM},{DO},{DZ},{EC},{EE},{EG},{EH},{ER},{ES},{ET},{FI},{FJ},{FK},{FM},{FO},{GA},{GB},{GD},{GE},{GF},{GG},{GH},{GI},{GL},{GM},{GN},{GP},{GQ},{GR},{GS},{GT},{GU},{GW},{GY},{HK},{HM},{HN},{HR},{HT},{HU},{ID},{IE},{IL},{IM},{IN},{IO},{IQ},{IR},{IS},{IT},{JE},{JM},{JO},{JP},{KE},{KG},{KH},{KI},{KM},{KN},{KP},{KR},{KW},{KY},{KZ},{LA},{LB},{LC},{LI},{LK},{LR},{LS},{LT},{LU},{LV},{LY},{MA},{MC},{MD},{ME},{MF},{MG},{MH},{MK},{ML},{MM},{MN},{MO},{MP},{MQ},{MR},{MS},{MT},{MU},{MV},{MW},{MX},{MY},{MZ},{NA},{NC},{NE},{NF},{NG},{NI},{NP},{NR},{NU},{NZ},{OM},{PA},{PE},{PF},{PG},{PH},{PK},{PL},{PM},{PN},{PR},{PS},{PT},{PW},{PY},{QA},{RE},{RO},{RS},{RU},{RW},{SA},{SB},{SC},{SD},{SE},{SG},{SH},{SI},{SJ},{SK},{SL},{SM},{SN},{SO},{SR},{SS},{ST},{SV},{SX},{SY},{SZ},{TC},{TD},{TF},{TG},{TH},{TJ},{TK},{TL},{TM},{TN},{TO},{TR},{TT},{TV},{TW},{TZ},{UA},{UG},{UM},{US},{UY},{UZ},{VA},{VC},{VE},{VG},{VI},{VN},{VU},{WF},{WS},{YE},{YT},{ZA},{ZM},{ZW}
NodeFamily {AD},{AE},{AF},{AG},{AI},{AL},{AM},{AO},{AQ},{AR},{AS},{AT},{AU},{AW},{AX},{AZ},{BA},{BB},{BD},{BE},{BF},{BG},{BH},{BI},{BJ},{BL},{BM},{BN},{BO},{BQ},{BR},{BS},{BT},{BV},{BW},{BY},{BZ},{CA},{CC},{CD},{CF},{CG},{CH},{CI},{CK},{CL},{CM},{CN},{CO},{CR},{CU},{CV},{CW},{CX},{CY},{CZ},{DE},{DJ},{DM},{DO},{DZ},{EC},{EE},{EG},{EH},{ER},{ES},{ET},{FI},{FJ},{FK},{FM},{FO},{GA},{GB},{GD},{GE},{GF},{GG},{GH},{GI},{GL},{GM},{GN},{GP},{GQ},{GR},{GS},{GT},{GU},{GW},{GY},{HK},{HM},{HN},{HR},{HT},{HU},{ID},{IE},{IL},{IM},{IN},{IO},{IQ},{IR},{IS},{IT},{JE},{JM},{JO},{JP},{KE},{KG},{KH},{KI},{KM},{KN},{KP},{KR},{KW},{KY},{KZ},{LA},{LB},{LC},{LI},{LK},{LR},{LS},{LT},{LU},{LV},{LY},{MA},{MC},{MD},{ME},{MF},{MG},{MH},{MK},{ML},{MM},{MN},{MO},{MP},{MQ},{MR},{MS},{MT},{MU},{MV},{MW},{MX},{MY},{MZ},{NA},{NC},{NE},{NF},{NG},{NI},{NP},{NR},{NU},{NZ},{OM},{PA},{PE},{PF},{PG},{PH},{PK},{PL},{PM},{PN},{PR},{PS},{PT},{PW},{PY},{QA},{RE},{RO},{RS},{RU},{RW},{SA},{SB},{SC},{SD},{SE},{SG},{SH},{SI},{SJ},{SK},{SL},{SM},{SN},{SO},{SR},{SS},{ST},{SV},{SX},{SY},{SZ},{TC},{TD},{TF},{TG},{TH},{TJ},{TK},{TL},{TM},{TN},{TO},{TR},{TT},{TV},{TW},{TZ},{UA},{UG},{UM},{US},{UY},{UZ},{VA},{VC},{VE},{VG},{VI},{VN},{VU},{WF},{WS},{YE},{YT},{ZA},{ZM},{ZW}
StrictNodes 1
GeoIPExcludeUnknown 1
```

You find all the country codes **ISO 3166** in this [sheet](https://drive.google.com/open?id=1NBjLS5Mbf0jDYCdkJ_UHJXFeiPDyaUnaNecr9GkuP7w)

# Openbsd, Tor, Privoxy and the browsers.

## Privoxy, add a new friend to the battle.

So, we've got now three browsers using three differents socks port to access the Tor network, and the last of ours browsers building a special doble circuit in the tor network combining different countries (*this is not bad at all*). Remember, we were [here](https://steemit.com/openbsd/@npna/openbsd-tor-14-applications-example-part-1) .
But...the situation is so difficult...we've to protect us with more layers.

Let's introduce the layer 7 firewall **Privoxy**.

What is a layer 7 firewall? It's a firewall that work at the last layer of the ISO/OSI network stack, that in *no technical* user speaking is the URI, www.facebook.com, steemit.com/@npna ...

## Matryoshka are sexis

![Russian Matrioska](https://steemitimages.com/640x0/https://i.pinimg.com/736x/be/bb/32/bebb32d9f52fc9c1d8f34e6f0c3b1e70.jpg).

*We like Russia*, and we like матрёшка.

In this case we're doing the exact thing, encapsulate layer after layer our information to protect it from the *privacy cannibals*.
Our dolls start from the navigator, go through privoxy and the will be routed to the Tor network.
Let install privoxy from the OpenBSD precompiled packages with a simple command:

```
$ doas pkg_add -U privoxy
```

It will install those files and binaries:

```
$ pkg_info -L privoxy
Information for inst:privoxy-3.0.26
Files:
/usr/local/bin/privoxy-log-parser.pl
/usr/local/bin/privoxy-regression-test.pl
/usr/local/bin/uagen.pl
/usr/local/bin/url-pattern-translator.pl
/usr/local/man/man1/privoxy.1
/usr/local/sbin/privoxy
/usr/local/share/doc/privoxy/AUTHORS
/usr/local/share/doc/privoxy/ChangeLog
/usr/local/share/doc/privoxy/LICENSE
/usr/local/share/doc/privoxy/README
/usr/local/share/examples/privoxy/config
/usr/local/share/examples/privoxy/default.action
/usr/local/share/examples/privoxy/default.filter
/usr/local/share/examples/privoxy/match-all.action
/usr/local/share/examples/privoxy/regression-tests.action
/usr/local/share/examples/privoxy/templates/blocked
/usr/local/share/examples/privoxy/templates/cgi-error-404
/usr/local/share/examples/privoxy/templates/cgi-error-bad-param
/usr/local/share/examples/privoxy/templates/cgi-error-disabled
/usr/local/share/examples/privoxy/templates/cgi-error-file
/usr/local/share/examples/privoxy/templates/cgi-error-file-read-only
/usr/local/share/examples/privoxy/templates/cgi-error-modified
/usr/local/share/examples/privoxy/templates/cgi-error-parse
/usr/local/share/examples/privoxy/templates/cgi-style.css
/usr/local/share/examples/privoxy/templates/client-tags
/usr/local/share/examples/privoxy/templates/connect-failed
/usr/local/share/examples/privoxy/templates/connection-timeout
/usr/local/share/examples/privoxy/templates/default
/usr/local/share/examples/privoxy/templates/edit-actions-add-url-form
/usr/local/share/examples/privoxy/templates/edit-actions-for-url
/usr/local/share/examples/privoxy/templates/edit-actions-for-url-filter
/usr/local/share/examples/privoxy/templates/edit-actions-list
/usr/local/share/examples/privoxy/templates/edit-actions-list-button
/usr/local/share/examples/privoxy/templates/edit-actions-list-section
/usr/local/share/examples/privoxy/templates/edit-actions-list-url
/usr/local/share/examples/privoxy/templates/edit-actions-remove-url-form
/usr/local/share/examples/privoxy/templates/edit-actions-url-form
/usr/local/share/examples/privoxy/templates/forwarding-failed
/usr/local/share/examples/privoxy/templates/mod-local-help
/usr/local/share/examples/privoxy/templates/mod-support-and-service
/usr/local/share/examples/privoxy/templates/mod-title
/usr/local/share/examples/privoxy/templates/mod-unstable-warning
/usr/local/share/examples/privoxy/templates/no-server-data
/usr/local/share/examples/privoxy/templates/no-such-domain
/usr/local/share/examples/privoxy/templates/show-request
/usr/local/share/examples/privoxy/templates/show-status
/usr/local/share/examples/privoxy/templates/show-status-file
/usr/local/share/examples/privoxy/templates/show-url-info
/usr/local/share/examples/privoxy/templates/show-version
/usr/local/share/examples/privoxy/templates/toggle
/usr/local/share/examples/privoxy/templates/toggle-mini
/usr/local/share/examples/privoxy/templates/untrusted
/usr/local/share/examples/privoxy/templates/url-info-osd.xml
/usr/local/share/examples/privoxy/user.action
/usr/local/share/examples/privoxy/user.filter
/etc/rc.d/privoxy
```

We've only a little problem respect to Tor with privoxy. To concatenate three privoxy ports to three Tor ports we've to launch three different privoxy instances. But with OpenBSD and to his clearness this is very simple.
Let's go **deep** in the configuration:

- cd to the privoxy configuration directory:
  - `$ cd /etc/privoxy`
- copy default config file into three different:
  - `$ doas cp config firefox && doas cp config chrome && doas cp config torbrowser`
- go to the OpenBSD rc.d directory:
  - `$ cd /etc/rc.d`
- copy the default privoxy init script in three different:
  - `$ doas cp privoxy privoxyfirefox && doas cp privoxy privoxychrome && doas cp privoxy privoxytorbrowser`

Ok all it's simple and without complications. Good, *i love OpenBSD*.
The privoxy main configuration file is full of options and you have to dedicate a couple of ours to understand all the voices, or to simply read it. For now we use this basic configuration (in ours next chapters probably we will do some changes to it). Let's see together the one that will be used in the firefox environment:

```
$ cat /etc/privoxy/firefox
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
logfile privoxyfirefox.log
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
listen-address  127.0.0.1:8800
#filter mode
toggle  1
enable-remote-toggle  0
#filter by X-filter http header
enable-remote-http-toggle  0
enable-edit-actions 0
enforce-blocks 1
#      src_addr[:port][/src_masklen] [dst_addr[:port][/dst_masklen]]
permit-access  127.0.0.1
buffer-limit 8192
#enable if there's a parent proxy
enable-proxy-authentication-forwarding 0
forward-socks5 / 127.0.0.1:9900 .
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
```

Ok simply change `admin-address`and `hostname` with the yours.
Privoxy send in every configuration file the `http proxy port` to a distinct `socks port`.
To create the others two execute this command:

```
# sed s/privoxyfirefox/privoxychrome/g privoxyfirefox | sed s/9900/9901/g > privoxychrome
# sed s/privoxychrome/privoxytorbrowser/g privoxychrome | sed s/9901/9902/g > privoxytorbrowser    
```

Now create the missing logs files with:

```
$ doas touch /var/log/privoxy/privoxyfirefox.log
$ doas touch /var/log/privoxy/privoxychrome.log
$ doas touch /var/log/privoxy/privoxytorbrowser.log
```

And enable all the three at boot:

```
$ doas rcctl enable privoxyfirefox
$ doas rcctl set privoxyfirefox user _privoxy
$ doas rcctl set privoxyfirefox flags /etc/privoxy/firefox
$ doas rcctl enable privoxychrome
$ doas rcctl set privoxychrome user _privoxy
$ doas rcctl set privoxychrome flags /etc/privoxy/chrome
$ doas rcctl enable privoxytorbrowser
$ doas rcctl set privoxytorbrowser user _privoxy
$ doas rcctl set privoxytorbrowser flags /etc/privoxy/torbrowser
```

At last start the three daemons:

```
$ doas rcctl start privoxyfirefox
$ doas rcctl start privoxychrome
$ doas rcctl start privoxytorbrowser
```

## Browsers configurations

![browsers configuration with privoxy](https://steemitimages.com/640x0/http://img3.wikia.nocookie.net/__cb20101231170457/mario/images/a/a7/Bowser_Super_Mario_Galaxy_2.png)
Now we've got the correct setup of privoxy, but remember without any rule of layer 7 firewalling, that we will see in our next chapter.
We've to change the configuration of the three browsers to use privoxy and not directly the tor socks.

1. Firefox:
   ![Firefox privoxy](https://steemitimages.com/640x0/https://lh5.googleusercontent.com/ddHo9wwk1dcYnLeQeWPgMhpGFrBkLanlsxzJo6jY8BXoGsWErsVLarkteptscKp73hb-p1Z82pZ6cLyfMHce=w1366-h650)
2. Chrome: simply change `--proxy-server="socks5://127.0.0.1:9901"`with `-proxy-server="http://127.0.0.1:8801"`
3. Torbrowser:
   ![Tor browser privoxy](https://steemitimages.com/640x0/https://lh3.googleusercontent.com/PjC3o3jzjdiJ6l_CFcEHIO9CRCJ-WXtbUxFYw2lhXSOp9J4pqk3MHCJNfETl9pxrug3PipjsvJ34VIUCdbb4=w1366-h650)

## Preparing the chicken soup

![chicken soup](https://steemitimages.com/640x0/http://www.foodfood.com/wp-content/uploads/2012/07/Homemade-chicken-soup.jpg)
Ok, the cooking is started, but one last little `hack`to disturb our favorites *cannibals*. Let's eliminate the `HTTP header` **[Refer](https://en.wikipedia.org/wiki/HTTP_referer)**:

```
# cat  >> /etc/privoxy/user.filter << EOF
{ +crunch-client-header{Referer:} }
/
EOF
```

