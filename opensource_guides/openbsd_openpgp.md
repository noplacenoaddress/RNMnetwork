# OpenBSD is back! Now with GnuPG

## Another friend, another animal, a gnu.

------

![music gnu](https://steemitimages.com/640x0/https://www.gnu.org/graphics/listen-eighth.jpg)
And yes, this gnu is *special*. First of all is a capital letters **GNU**, he likes [free software](https://www.gnu.org/), and our special one also like **electronic music**. But not only *free software*, he is specialized also in privacy, he can be the **guardian** of our privacy! Because one of the hottest applications in this wonderful *GNU world* is [**GnuPG**](https://www.gnupg.org/) a mature piece of *open source* software:

> GnuPG is a complete and free implementation of the OpenPGP standard as defined by RFC4880 (also known as PGP). GnuPG allows you to encrypt and sign your data and communications; it features a versatile key management system, along with access modules for all kinds of public key directories. GnuPG, also known as GPG, is a command line tool with features for easy integration with other applications. A wealth of frontend applications and libraries are available. GnuPG also provides support for S/MIME and Secure Shell (ssh).
> Since its introduction in 1997, GnuPG is Free Software (meaning that it respects your freedom). It can be freely used, modified and distributed under the terms of the GNU General Public License .

## OpenBSD want your pretty good privacy

------

![privacy is like a pretty woman](https://steemitimages.com/640x0/https://media.vanityfair.com/photos/59c9789f4f79bc3b7908b511/master/w_960,c_limit/pretty-woman-musical%25202.jpg)
Speaking about *pretty* obviously my first tough is a *wonderful woman*. And doing a simple association my *connected* brain has elaborated this image, a wonderful Julia Roberts singing a song in the set's bathroom of [*pretty woman*](http://www.imdb.com/title/tt0100405/), do you remember it?
But you have to understand that *pretty* have to be also our **privacy** in a **interconnected world**, *the Internet*. Every single man and woman (child i don't think that have to use it) in the world have access to the Internet, but only a little part know how to protect him/her **privacy** from what we've previously named *the privacy cannibals*.
Today we add another friend to our great guarantees of privacy, a cool dude that follow the **OpenPGP** standard that you can freely study reading the [**RFC 4880**](https://tools.ietf.org/html/rfc4880).

## Create the perfect pgp keypair with OpenBSD

![perfect pgp keypair](https://steemitimages.com/640x0/https://static.fsf.org/nosvn/enc-dev0/img/en/screenshots/step2a-01-make-keypair.png)
Ok let's go deep and start the configuration of our *GNU PGP*.
Install the software from ports repository:

```
$ rm -rf .gnupg
$ mkdir .gnupg
$ chmod -R go-rwx .gnupg
$ doas pkg_add -U gnupg-2.1.23
```

We've deleted possible previous `gnupg` configuration, recreate the user directory of the program, assign to it the correct permissions and install the version 2 of the `gnupg` collection.

```
$ cat << EOF > ~/.gnupg/gpg.conf
use-agent
personal-cipher-preferences AES256 AES192 AES CAST5
personal-digest-preferences SHA512 SHA384 SHA256 SHA224
default-preference-list SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed
cert-digest-algo SHA512
s2k-digest-algo SHA512
s2k-cipher-algo AES256
charset utf-8
fixed-list-mode
no-comments
no-emit-version
keyid-format 0xlong
list-options show-uid-validity
verify-options show-uid-validity
with-fingerprint
EOF
```

Create the *bootstrap* `gpg` configuration file in our previously created directory.

```
$ gpg2 --full-generate-key
gpg (GnuPG) 2.1.23; Copyright (C) 2017 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Please select what kind of key you want:
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
Your selection? 4
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048) 4096
Requested keysize is 4096 bits
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 0
Key does not expire at all
Is this correct? (y/N) y

GnuPG needs to construct a user ID to identify your key.

Real name: No Place No Address
Email address: npna@protonmail.ch
Comment: No Place No Address
You selected this USER-ID:
    "No Place No Address (No Place No Address) <npna@protonmail.ch>"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
gpg: /home/taglio/.gnupg/trustdb.gpg: trustdb created
gpg: key 0xAD8E487FF2F05FDE marked as ultimately trusted
gpg: directory '/home/taglio/.gnupg/openpgp-revocs.d' created
gpg: revocation certificate stored as '/home/taglio/.gnupg/openpgp-revocs.d/6ACFBE8E6C24EA903F5B9F49AD8E487FF2F05FDE.rev'
public and secret key created and signed.

Note that this key cannot be used for encryption.  You may want to use
the command "--edit-key" to generate a subkey for this purpose.
pub   rsa4096/0xAD8E487FF2F05FDE 2018-02-23 [SC]
      Key fingerprint = 6ACF BE8E 6C24 EA90 3F5B  9F49 AD8E 487F F2F0 5FDE
uid                              No Place No Address (No Place No Address) <npna@protonmail.ch>
```

We're creating a **no expiring** master key in our home directory, using `RSA` sign only option with the maximum key size that is `4096 bits` . In `gpg` every key is associated with a user ID, in our case is `npna@protonmail.ch`. Remember to use a strong unpredictable password and to anote and store it in a secure place (*¿do you remember what is a pen and what is a paper?*). It's important for the rest of the configuration know the result `keyid`, for our case is `0xAD8E487FF2F05FDE`. Go ahead with the deep configuration:

```
$ gpg2 --expert --edit-key 0xAD8E487FF2F05FDE
gpg (GnuPG) 2.1.23; Copyright (C) 2017 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Secret key is available.

gpg: checking the trustdb
gpg: marginals needed: 3  completes needed: 1  trust model: pgp
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
sec  rsa4096/0xAD8E487FF2F05FDE
     created: 2018-02-23  expires: never       usage: SC  
     trust: ultimate      validity: ultimate
[ultimate] (1). No Place No Address (No Place No Address) <npna@protonmail.ch>

gpg> addkey
Please select what kind of key you want:
   (3) DSA (sign only)
   (4) RSA (sign only)
   (5) Elgamal (encrypt only)
   (6) RSA (encrypt only)
   (7) DSA (set your own capabilities)
   (8) RSA (set your own capabilities)
  (10) ECC (sign only)
  (11) ECC (set your own capabilities)
  (12) ECC (encrypt only)
  (13) Existing key
Your selection? 6
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048) 4096
Requested keysize is 4096 bits
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 
Key does not expire at all
Is this correct? (y/N) y
Really create? (y/N) y
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.

sec  rsa4096/0xAD8E487FF2F05FDE
     created: 2018-02-23  expires: never       usage: SC  
     trust: ultimate      validity: ultimate
ssb  rsa4096/0x3C423C42DE438790
     created: 2018-02-23  expires: never       usage: E   
[ultimate] (1). No Place No Address (No Place No Address) <npna@protonmail.ch>
```

Now we've entered in the `gpg` shell! Look at the new prompt `gpg>`. From there we can access to all the possible commands of our **GNU** privacy suite.

```
gpg> addkey
Please select what kind of key you want:
   (3) DSA (sign only)
   (4) RSA (sign only)
   (5) Elgamal (encrypt only)
   (6) RSA (encrypt only)
Your selection? 6
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048) 4096
Requested keysize is 4096 bits
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 
Key does not expire at all
Is this correct? (y/N) y
Really create? (y/N) y
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.

sec  rsa4096/0x17B9BD907F897DD1
     created: 2018-02-23  expires: never       usage: SC  
     trust: ultimate      validity: ultimate
ssb  rsa4096/0xEF0998EA8BB3F32B
     created: 2018-02-23  expires: never       usage: E   
[ultimate] (1). No Place No Address (No Place No Address) <npna@protonmail.ch>
```

We've created a key that depend from our master key, selecting `RSA` for encrypt only. This is our encryption key.

```
gpg>addkey
addkey
Please select what kind of key you want:
   (3) DSA (sign only)
   (4) RSA (sign only)
   (5) Elgamal (encrypt only)
   (6) RSA (encrypt only)
   (7) DSA (set your own capabilities)
   (8) RSA (set your own capabilities)
  (10) ECC (sign only)
  (11) ECC (set your own capabilities)
  (12) ECC (encrypt only)
  (13) Existing key
Your selection? 4
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048) 4096
Requested keysize is 4096 bits
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 
Key does not expire at all
Is this correct? (y/N) y
Really create? (y/N) y
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.

sec  rsa4096/0xAD8E487FF2F05FDE
     created: 2018-02-23  expires: never       usage: SC  
     trust: ultimate      validity: ultimate
ssb  rsa4096/0x3C423C42DE438790
     created: 2018-02-23  expires: never       usage: E   
ssb  rsa4096/0x5DC3DAEF3359F361
     created: 2018-02-23  expires: never       usage: S   
[ultimate] (1). No Place No Address (No Place No Address) <npna@protonmail.ch>
```

Now we've created another sub key. This time to sign only, always with the `RSA` protocol. His size is as usual `4096 bits`.

```
addkey
Please select what kind of key you want:
   (3) DSA (sign only)
   (4) RSA (sign only)
   (5) Elgamal (encrypt only)
   (6) RSA (encrypt only)
   (7) DSA (set your own capabilities)
   (8) RSA (set your own capabilities)
  (10) ECC (sign only)
  (11) ECC (set your own capabilities)
  (12) ECC (encrypt only)
  (13) Existing key
Your selection? 8

Possible actions for a RSA key: Sign Encrypt Authenticate 
Current allowed actions: Sign Encrypt 

   (S) Toggle the sign capability
   (E) Toggle the encrypt capability
   (A) Toggle the authenticate capability
   (Q) Finished

Your selection? S

Possible actions for a RSA key: Sign Encrypt Authenticate 
Current allowed actions: Encrypt 

   (S) Toggle the sign capability
   (E) Toggle the encrypt capability
   (A) Toggle the authenticate capability
   (Q) Finished

Your selection? E

Possible actions for a RSA key: Sign Encrypt Authenticate 
Current allowed actions: 

   (S) Toggle the sign capability
   (E) Toggle the encrypt capability
   (A) Toggle the authenticate capability
   (Q) Finished

Your selection? A

Possible actions for a RSA key: Sign Encrypt Authenticate 
Current allowed actions: Authenticate 

   (S) Toggle the sign capability
   (E) Toggle the encrypt capability
   (A) Toggle the authenticate capability
   (Q) Finished

Your selection? Q
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048) 4096
Requested keysize is 4096 bits
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 
Key does not expire at all
Is this correct? (y/N) y
Really create? (y/N) y
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.

sec  rsa4096/0xAD8E487FF2F05FDE
     created: 2018-02-23  expires: never       usage: SC  
     trust: ultimate      validity: ultimate
ssb  rsa4096/0x3C423C42DE438790
     created: 2018-02-23  expires: never       usage: E   
ssb  rsa4096/0x5DC3DAEF3359F361
     created: 2018-02-23  expires: never       usage: S   
ssb  rsa4096/0x52E923E51A16A5E9
     created: 2018-02-23  expires: never       usage: A   
[ultimate] (1). No Place No Address (No Place No Address) <npna@protonmail.ch>
gpg> save
```

At last we've created a sub key for authentication purpose. Thanks to the `--expert` option that we've used we can edit **like a pro** our last `RSA` key using the `(8)` option in our `gpg` shell. Follow the commands and we've finished! Don't leave the last `save` if you don't launch it you will loose all! Review the created keys with:

```
$ gpg2 --list-secret-keys
/home/taglio/.gnupg/pubring.kbx
-------------------------------
sec   rsa4096/0xAD8E487FF2F05FDE 2018-02-23 [SC]
      Key fingerprint = 6ACF BE8E 6C24 EA90 3F5B  9F49 AD8E 487F F2F0 5FDE
uid                   [ultimate] No Place No Address (No Place No Address) <npna@protonmail.ch>
ssb   rsa4096/0x3C423C42DE438790 2018-02-23 [E]
ssb   rsa4096/0x5DC3DAEF3359F361 2018-02-23 [S]
ssb   rsa4096/0x52E923E51A16A5E9 2018-02-23 [A]
```

## Export to an encrypted USB stick

------

Ok, we've have created our **4** `gpg2` keys, one master with 3 slaves, *encryption, sign and authentication* .
Let's prepare an encrypted fresh USB stick to backup them!

```
$ doas su
#fdisk -yig sd2 
Writing MBR at offset 0.
Writing GPT.
# disklabel -E sd2
Label editor (enter '?' for help at any prompt)
> ?
Available commands:
 ? | h    - show help                 n [part] - set mount point
 A        - auto partition all space  p [unit] - print partitions
 a [part] - add partition             q        - quit & save changes
 b        - set OpenBSD boundaries    R [part] - resize auto allocated partition
 c [part] - change partition size     r        - display free space
 D        - reset label to default    s [path] - save label to file
 d [part] - delete partition          U        - undo all changes
 e        - edit drive parameters     u        - undo last change
 g [d|u]  - [d]isk or [u]ser geometry w        - write label to disk
 i        - modify disklabel UID      X        - toggle expert mode
 l [unit] - print disk label header   x        - exit & lose changes
 M        - disklabel(8) man page     z        - delete all partitions
 m [part] - modify partition

Suffixes can be used to indicate units other than sectors:
 'b' (bytes), 'k' (kilobytes), 'm' (megabytes), 'g' (gigabytes) 't' (terabytes)
 'c' (cylinders), '%' (% of total disk), '&' (% of free space).
Values in non-sector units are truncated to the nearest cylinder boundary.
> l
# /dev/rsd2c:
type: SCSI
disk: SCSI disk
label: Flash Disk      
duid: 0000000000000000
flags:
bytes/sector: 512
sectors/track: 63
tracks/cylinder: 255
sectors/cylinder: 16065
cylinders: 16
total sectors: 257536
boundstart: 64
boundend: 257473
drivedata: 0 
> > a a
offset: [64] 
size: [257409] 
FS type: [4.2BSD] RAID
> w
> q
No label changes.
# 
```

We've initialized the USB stick with the **OpenBSD** `fdisk` with a `GPT` partition table and the we add a single `RAID` partition to it with `disklabel`. We use `RAID` because this is the manner that use **OpenBSD** to do it.

```
# bioctl -c C -l /dev/sd2a softraid0  
New passphrase: 
Re-type passphrase: 
softraid0: CRYPTO volume attached as sd3
# 
```

We've encrypted the first partition label of our USB stick with the command `bioctl` that result in the creation of the pseudo device `sd3`.

```
# newfs sd3c         
newfs: reduced number of fragments per cylinder group from 16048 to 15984 to enlarge last cylinder group
/dev/rsd3c: 125.4MB in 256880 sectors of 512 bytes
5 cylinder groups of 31.22MB, 1998 blocks, 4096 inodes each
super-block backups (for fsck -b #) at:
 32, 63968, 127904, 191840, 255776,
# mkdir /mnt/encrypted_usb && mount dev/sd3c /mnt/encrypted_usb
```

Create an `ufs2` filesystem in the pseudo device disk label `c`, that is the one that indicate all the disk. Create a partition where to mount it and mount it!

```
# gpg2 --homedir /home/taglio/.gnupg --armor --export-secret-keys 0xAD8E487FF2F05FDE > /mnt/encrypted_usb/mastersub.key
# gpg2 --homedir /home/taglio/.gnupg --armor --export-secret-subkeys 0xAD8E487FF2F05FDE > /mnt/encrypted_usb/sub.key
# umount /mnt/encrypted_usb
# 
```



# OpenBSD, OpenPGP, Bob and Alice but also a little bit of magic.



<iframe frameborder="0" allowfullscreen="allowfullscreen" webkitallowfullscreen="webkitallowfullscreen" mozallowfullscreen="mozallowfullscreen" src="https://www.youtube.com/embed/Zf1VTOUIuP8" width="640" height="360" style="box-sizing: inherit; max-width: 100%; max-height: 75vw; position: absolute; width: 640px; height: 359.672px; left: 0px; top: 0px;"></iframe>

In this catch from [*viaggi di nozze*](https://it.wikipedia.org/wiki/Viaggi_di_nozze) the Italian iconic actors [*Carlo Verdone*](https://it.wikipedia.org/wiki/Carlo_Verdone) and [*Claudia Gerini*](https://it.wikipedia.org/wiki/Claudia_Gerini) listening to some good *heavy metal* remember the most special situation where they have some good sex.
Like them, or better *i wish it'll be*, our two friends **OpenBSD** and **GnuPG** continue them relation. [*Last time*](https://steemit.com/openbsd/@npna/openbsd-is-back-now-with-gnupg) we've seen how to install, generate master key and subkeys (*sign, encryption and authentication*) and backup all of them in an encrypted usb stick under **OpenBSD**. The result of those operation can be resumed and visualized with this command:

```
$ gpg2 --list-keys
/home/taglio/.gnupg/pubring.kbx
-------------------------------
pub   rsa4096/0xAD8E487FF2F05FDE 2018-02-23 [SC]
      Key fingerprint = 6ACF BE8E 6C24 EA90 3F5B  9F49 AD8E 487F F2F0 5FDE
uid                   [ultimate] No Place No Address (No Place No Address) <npna@protonmail.ch>
sub   rsa4096/0x3C423C42DE438790 2018-02-23 [E]
sub   rsa4096/0x5DC3DAEF3359F361 2018-02-23 [S]
sub   rsa4096/0x52E923E51A16A5E9 2018-02-23 [A]
$
```

## Export the public key to the Internet

------

![_Hierarchical trust](https://steemitimages.com/0x0/http://users.ece.cmu.edu/~adrian/630-f04/PGP-intro_files/fig1-12.gif)

To publish our public key to the Internet allowing others **OpenPGP** users establish a secure channel of communication with us (*i know it's not perfect but combined with other technologies it's the state of the art*) we've to export our **public key** 0xAD8E487FF2F05FDE to one the keyserver of the *pgp network* . Let's start with our *shell sex*:

```
$ wget -P ~/.gnupg https://sks-keyservers.net/sks-keyservers.netCA.pem{,.asc}
$ chmod -R 700 .gnupg 
$ openssl verify -trusted sks-keyservers.netCA.pem -check_ss_sig sks-keyservers.netCA.pem
sks-keyservers.netCA.pem: OK
$ openssl x509 -in sks-keyservers.netCA.pem -noout -text | grep "X509v3 Subject Key Identifier" -A1 | tail -n1                E4:C3:2A:09:14:67:D8:4D:52:12:4E:93:3C:13:E8:A0:8D:DA:B6:F3
```

We download the `CA`certificate of the keyservers pool `sks-keyservers.net`
with its **PGP signature** (*.asc file*). We verify it with the [**openssl suite** ](https://www.openssl.org/) and then we extract the *"X509v3 Subject Key Identifier"* and check if it is the same with the one that we've [here](https://sks-keyservers.net/verify_tls.php).

```
$ host -t a hkps.pool.sks-keyservers.net
hkps.pool.sks-keyservers.net has address 193.164.133.100
$ cat << EOF >> ~/.gnupg/gpg.conf          
keyserver hkps://193.164.133.100
EOF
$ cat << EOF > ~/.gnupg/dirmngr.conf
keyserver hkps://193.164.133.100
hkp-cacert ~/.gnupg/sks-keyservers.netCA.pem
EOF
```

Like you can see we've just added one new directive in our `gpg.conf` file after resolving the pool of keyservers `sks` in a single `ipv4` address. Next we've created a new configure file for `dirmngr` that is the daemon resposible of the access to the **OpenPGP** keyservers

```
$ gpg2 --send-key 0xAD8E487FF2F05FDE
gpg: sending key 0xAD8E487FF2F05FDE to hkp://193.164.133.100
$ gpg2 --fingerprint 0xAD8E487FF2F05FDE | grep finger | head -n 1
      Key fingerprint = 6ACF BE8E 6C24 EA90 3F5B  9F49 AD8E 487F F2F0 5FDE
```

this is the normal command to transfer our `pub`key who owner is `[ultimate] No Place No Address (No Place No Address) <npna@protonmail.ch>`; after some minutes we can search our `public` key in the **OpenPGP** network [here](http://hkps.pool.sks-keyservers.net/).

## Encryption using public key is AWESOME

We want to establish a secure communications channel between `npna@protonmail.ch` and `r.giuntoli@protonmail`, without public key encription and signing will give us a lot of headchache. Using it produce this esquema:

![bob and alice](https://steemitimages.com/640x0/https://www.usna.edu/Users/cs/wcbrown/courses/si110AY13S/lec/l26/asymmetricencryption.png)

In practice never Alice or Bob have to send in an insecure channel, like *Internet*, their private keys. In my example alice got a **Gentoo** workstation, and Bob an **OpenBSD** one. The two folks have uploaded their `public` keys using the **OpenPGP** suite. The two `trust` each one and can verify the fingerprint of the other utilizing a *secure* channel, like they are in the same room creating this example.

```
alice$ gpg --search-keys npna
gpg: data source: http://37.191.226.104:11371
(1) No Place No Address (No Place No Address) <npna@protonmail.ch>
      4096 bit RSA key 0xAD8E487FF2F05FDE, created: 2018-02-23
Keys 1-1 of 1 for "npna".  Enter number(s), N)ext, or Q)uit > 1
gpg: key 0xAD8E487FF2F05FDE: public key "No Place No Address (No Place No Address) <npna@protonmail.ch>" imported
gpg: Total number processed: 1
gpg:               imported: 1
alice $ gpg --edit-key 0xAD8E487FF2F05FDE
gpg (GnuPG) 2.2.5; Copyright (C) 2018 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

pub  rsa4096/0xAD8E487FF2F05FDE
     created: 2018-02-23  expires: never       usage: SC  
     trust: unknown       validity: unknown
sub  rsa4096/0x3C423C42DE438790
     created: 2018-02-23  expires: never       usage: E   
sub  rsa4096/0x5DC3DAEF3359F361
     created: 2018-02-23  expires: never       usage: S   
sub  rsa4096/0x52E923E51A16A5E9
     created: 2018-02-23  expires: never       usage: A   
[ unknown] (1). No Place No Address (No Place No Address) <npna@protonmail.ch>

gpg> fpr
pub   rsa4096/0xAD8E487FF2F05FDE 2018-02-23 No Place No Address (No Place No Address) <npna@protonmail.ch>
 Primary key fingerprint: 6ACF BE8E 6C24 EA90 3F5B  9F49 AD8E 487F F2F0 5FDE

gpg> sign

pub  rsa4096/0xAD8E487FF2F05FDE
     created: 2018-02-23  expires: never       usage: SC  
     trust: unknown       validity: unknown
 Primary key fingerprint: 6ACF BE8E 6C24 EA90 3F5B  9F49 AD8E 487F F2F0 5FDE

     No Place No Address (No Place No Address) <npna@protonmail.ch>

Are you sure that you want to sign this key with your
key "Riccardo Giuntoli <r.giuntoli@protonmail.ch>" (0xA51D8EF938AF47D0)

Really sign? (y/N) y

gpg> save
alice$
```

So we search the `public` key of Alice in the `keyserver` , in this case we've got only a possible key, we select pressing `1` at the **OpenPGP** shell. Next we enter in `edid` mode and always at the **OpenPGP** shell and we see that also Bob have created three *subkeys* one for **encryption**, another for **signing** and the last for **authentication**. We print the fingerprint to validate it with Bob to locally sign it with the option `sign` . We save and the returl to the `bash` shell.

We do the same process in the Bob **OpenBSD** machine:

```
bob$ gpg2 --search-key r.giuntoli
gpg: data source: http://18.9.60.141:11371
(1)     Riccardo Giuntoli <r.giuntoli@protonmail.ch>
          4096 bit RSA key 0x6DAE5C27DFAF0D6F, created: 2018-02-20
(2)     ANTRAX <r.giuntoli@protonmail.ch>
          3072 bit RSA key 0xAAE9F49A70ED3F09, created: 2017-09-04
(3)     Riccardo Giuntoli (MESWIFI, S.L.) <r.giuntoli@meswifi.com>
          2048 bit RSA key 0x83D1285CD6F38DFA, created: 2014-01-26
Keys 1-3 of 3 for "r.giuntoli".  Enter number(s), N)ext, or Q)uit > 1
gpg: key 0x6DAE5C27DFAF0D6F: public key "Riccardo Giuntoli <r.giuntoli@protonmail.ch>" imported
gpg: Total number processed: 1
gpg:               imported: 1
bob$ gpg2 --edit-key r.giuntoli
gpg (GnuPG) 2.1.23; Copyright (C) 2017 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.


pub  rsa4096/0x6DAE5C27DFAF0D6F
     created: 2018-02-20  expires: never       usage: SC  
     trust: unknown       validity: full
sub  rsa2048/0xA51D8EF938AF47D0
     created: 2018-02-20  expires: never       usage: S   
sub  rsa2048/0x32772E38B5C56D73
     created: 2018-02-20  expires: never       usage: E   
sub  rsa2048/0xE3E741619E88263B
     created: 2018-02-20  expires: never       usage: A   
[  full  ] (1). Riccardo Giuntoli <r.giuntoli@protonmail.ch>

gpg> fpr
pub   rsa4096/0x6DAE5C27DFAF0D6F 2018-02-20 Riccardo Giuntoli <r.giuntoli@protonmail.ch>
 Primary key fingerprint: 90DC 1D49 FC85 DD2E 38AC  5301 6DAE 5C27 DFAF 0D6F

gpg> sign

pub  rsa4096/0x6DAE5C27DFAF0D6F
     created: 2018-02-20  expires: never       usage: SC  
     trust: unknown       validity: full
 Primary key fingerprint: 90DC 1D49 FC85 DD2E 38AC  5301 6DAE 5C27 DFAF 0D6F

     Riccardo Giuntoli <r.giuntoli@protonmail.ch>

Are you sure that you want to sign this key with your
key "No Place No Address (No Place No Address) <npna@protonmail.ch>" (0xAD8E487FF2F05FDE)

Really sign? (y/N) y

gpg>save
bob$ 
```

In this case the reply at our search are three diferents keys, we install the first.

```
alice$ echo "Я хочу встретиться с тобой" | gpg --armor --sign --encrypt -r npna - 
gpg: checking the trustdb
gpg: marginals needed: 3  completes needed: 1  trust model: pgp
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
gpg: 0x3C423C42DE438790: There is no assurance this key belongs to the named user
sub  rsa4096/0x3C423C42DE438790 2018-02-23 No Place No Address (No Place No Address) <npna@protonmail.ch>
 Primary key fingerprint: 6ACF BE8E 6C24 EA90 3F5B  9F49 AD8E 487F F2F0 5FDE
      Subkey fingerprint: 2754 CF0A D8FA 32DD 1123  EF25 3C42 3C42 DE43 8790

It is NOT certain that the key belongs to the person named
in the user ID.  If you *really* know what you are doing,
you may answer the next question with yes.

Use this key anyway? (y/N) y
-----BEGIN PGP MESSAGE-----

hQIMAzxCPELeQ4eQAQ/8CzGw9ms0lyHcinfJptV3ICjUIrDxSHEDlj7L5oME1tc0
7BEuURJcqP6ftuU/OK8oQipKw+TBbioDIjNNnWVlpPGhSyHZl8tRnUyOKhQDcGEU
8KWk9wZfwElBVBAbqhfsih5dBIGgmZwvA9iVJrdvXv8uA7OD2qNsiD7SLG1XaemN
un8FnlRptYvwnR4/FEESf4FNeYUki0SwE3PDQb1c1uxTBILSavontFmUwxEhVyKB
2gV8SB2XtiN+WvxJDNlnuEI9NUM46XjNZVew9Iam78PAro/dcXxkD+PkY4Z8aXNB
ugIrym5//4vE7uTskT8qh0m4dlfDgnhuojFWjwSMdedntU09tNy5uMQMbqJkKmSV
8J4qfCVTtp9UtKgA/Ylqmw4TyAsZ+r8TZYgMtbTF3VTOGiXk5fSd5cjNUsAhDPWI
PR0+IrdumfTDoUdXX9SXZrJ8ftlFuVkj8II5Zm7wXbbXO3wTrzAZZTmZL0NoHkca
BKGp11rWk4MgpxwYQKsCI1LZc/q2Ve7PsviN57nmeiDGLGP1AgOqVVJP1LNEPLvs
7xlTDlviALdJXKR3rwww+iwFFLwdE7V7GO4pw5z/Wgxgsx2WlFbOPG6FnJmeW22D
xCQm4NDJvVLnmI6fa8Y2JPzZVFou7bJxEgnGWwoXGdT8b+S10DWxNlAxKKh+svLS
wPEBJYi7+I0iY1gucLhLnKDnTd1XV9POHt/kT2uSb7INZedd221lqLw327aqFpo+
anrVtodShpg3CQM9mC/VX5/tYh/4YqupR+TAmlXvscbjNEy19gjbTjhhO80c1dla
axeLsA6OuDh77arEyk1gzlEFHl2ebUSZjBVNG7nFAMur9hS22TBSOmGHdgEH4w4z
pPCk3dAnqOBdgXCOrt8a9MHDXmg6RqkpclXAK/X/EOtx0JouNQUSXjyakzrKffKF
KtkUGsTyH8wUAlJb2X/enOi89b2VBHgqqy4ss9B3Do1sYpgLo3Ho9oGqpxt0oaiZ
pnIq2jZdns8kdtsEJsQTnN/ucu4L+/MzDGjUAdP7vC94in62gqypnaNhYzpyHrS+
H8p+ddtWoYEZHnp/TuqqdSw3psDzhA9UyWFa1BKTOczI3CBFhoio/NPdK4bvnNdw
Ef9gP4kVaCIDh6QOQV5xJtKgTU53alu76xlyZcyBqP4q6fk94klVxkb1G5lmP60I
HLXQvFuTaGF8BTZqNYsNZlOS0B5plXMYCw1s4hX6n2h+4HgbOg71cHaTTIw5IRls
qk2g
=i1ah
-----END PGP MESSAGE-----
```

Alice encrypt and sign the message *Я хочу встретиться с тобой* for Bob. The process is simple, she piped it to `gpg` that is launched with:

1. `--armor` the result of the process have to be always text.
2. `--sign` she sign it with her `subkey` dedicated to the sign operation.
3. `--ecrypt` she encript it.
4. `-r Bob` the message will only readable by Bob (*that seems to be russian*).
5. `-` it indicate to `gpg` that the text in input was piped.

Now she use a **free past service** to upload it to the *Internet*, the result is there:

[ghostbin free past service, a message for you darling](https://ghostbin.com/paste/28fqm/raw)

So Bob is very exited and want to rapidly verify and decrypt his *love message*:

```
bob$ wget https://ghostbin.com/paste/28fqm/raw -o log -O testmsg
bob$ cat testmsg | gpg2 --decrypt
gpg: encrypted with 4096-bit RSA key, ID 0x3C423C42DE438790, created 2018-02-23
      "No Place No Address (No Place No Address) <npna@protonmail.ch>"
Я хочу встретиться с тобой
gpg: Signature made Tue Mar  6 18:49:14 2018 CET
gpg:                using RSA key E9664F440C5E14C8E661AC6BA51D8EF938AF47D0
gpg: Good signature from "Riccardo Giuntoli <r.giuntoli@protonmail.ch>" [full]
Primary key fingerprint: 90DC 1D49 FC85 DD2E 38AC  5301 6DAE 5C27 DFAF 0D6F
     Subkey fingerprint: E966 4F44 0C5E 14C8 E661  AC6B A51D 8EF9 38AF 47D0
bob$
```

Silently download the message and save in local `testmsg` text file and use `gpg --decrypt` to read his message.

## OpenPGP others applications and a little bit of magic

------

![gandalf](https://steemitimages.com/640x0/![gandalf.png](https://steemitimages.com/DQmbnXz4af8fQEEE7ky1EymSohLAJ85G97AR5hsjQELTghP/gandalf.png)g)

With the **OpenPGP** suite we can also simply encrypt a file or folder.

But *Bob* want to be more [**31337** ](https://en.wikipedia.org/wiki/Leet) and want to hide a *secret message* in an image, embedding in it using a technology knowned as [**Steganography**](https://en.wikipedia.org/wiki/Steganography). And with **OpenBSD** is a nice and rapid task.

```
bob$ doas pkg_add -U steghide
doas (taglio@Lutetia.unknown_domain) password: 
quirks-2.367 signed on 2017-10-03T11:21:28Z
steghide-0.5.1p3: ok
bob$ steghide
steghide version 0.5.1

the first argument must be one of the following:
 embed, --embed          embed data
 extract, --extract      extract data
 info, --info            display information about a cover- or stego-file
   info <filename>       display information about <filename>
 encinfo, --encinfo      display a list of supported encryption algorithms
 version, --version      display version information
 license, --license      display steghide's license
 help, --help            display this usage information

embedding options:
 -ef, --embedfile        select file to be embedded
   -ef <filename>        embed the file <filename>
 -cf, --coverfile        select cover-file
   -cf <filename>        embed into the file <filename>
 -p, --passphrase        specify passphrase
   -p <passphrase>       use <passphrase> to embed data
 -sf, --stegofile        select stego file
   -sf <filename>        write result to <filename> instead of cover-file
 -e, --encryption        select encryption parameters
   -e <a>[<m>]|<m>[<a>]  specify an encryption algorithm and/or mode
   -e none               do not encrypt data before embedding
 -z, --compress          compress data before embedding (default)
   -z <l>                 using level <l> (1 best speed...9 best compression)
 -Z, --dontcompress      do not compress data before embedding
 -K, --nochecksum        do not embed crc32 checksum of embedded data
 -N, --dontembedname     do not embed the name of the original file
 -f, --force             overwrite existing files
 -q, --quiet             suppress information messages
 -v, --verbose           display detailed information

extracting options:
 -sf, --stegofile        select stego file
   -sf <filename>        extract data from <filename>
 -p, --passphrase        specify passphrase
   -p <passphrase>       use <passphrase> to extract data
 -xf, --extractfile      select file name for extracted data
   -xf <filename>        write the extracted data to <filename>
 -f, --force             overwrite existing files
 -q, --quiet             suppress information messages
 -v, --verbose           display detailed information

options for the info command:
 -p, --passphrase        specify passphrase
   -p <passphrase>       use <passphrase> to get info about embedded data

To embed emb.txt in cvr.jpg: steghide embed -cf cvr.jpg -ef emb.txt
To extract embedded data from stg.jpg: steghide extract -sf stg.jpg
bob$ wget https://pbs.twimg.com/profile_images/966976157592838145/bzhg-p3s_400x400.jpg -o log 
bob$ cat << EOF > msg
trip lover trust
EOF
bob$ steghide embed -cf bzhg-p3s_400x400.jpg -ef msg
Enter passphrase: 
Re-Enter passphrase: 
embedding "testmsg" in "bzhg-p3s_400x400.jpg"... done
bob$ 
```

To obtain this little *magic*, Bob install **steghide** from the official ports of **OpenBSD**, next he write a text message and embedded protected with a password in the `jpeg` image.

Now he saves the `jpg` image in his harddisk with `gpg` and `symmetric` encryptions. When he will send to *Alice* he will decrypt it and reuse the `public` method.

```
bob$ gpg2 --symmetric bzhg-p3s_400x400.jpg
```

Nice, i'm in love with this *Bob and Alice* story, i'm in love with my work that is and will be write about security stuff, protecting privacy for who want it.

*love is back, RG*