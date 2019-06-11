## Making the Alpine Linux Base image (on Ubuntu 18.04):

```
#Prerequisites
sudo apt-get install qemu-utils

#Get make alpine script
wget https://raw.githubusercontent.com/alpinelinux/alpine-make-vm-image/v0.4.0/alpine-make-vm-image \
    && echo '5fb3270e0d665e51b908e1755b40e9c9156917c0  alpine-make-vm-image' | sha1sum -c \
    || exit 1

#Make it ready
sudo chmod +x ./alpine-make-vm-image

#Run the script, create an alpine.qcox2 image
sudo ./alpine-make-vm-image -f qcow2 alpine.qcow2

#Convert that image
qemu-img convert -f qcow2 -O vmdk -o adapter_type=lsilogic,subformat=streamOptimized,compat6 alpine.qcow2 alpine.vmdk
```

## Making the SFFS Host Base image.

```
VMWare Fusion..
Choose Import
Choose Alpine Linux Base
Click "Retry"
click customize
setup bridged networking via ethernet in "network adapter" (så VM får sin egen IP)
Start VM (click Upgrade)
login: "root" (there's no password yet)
run "setup-alpine"
- system hostname: "sffshost"
- svar enter til alt andet
- set et root password (fx "sffshost")
- svar enter til en masse ting
- where to store configs: "usb"
run "apk update"
run "apk add git"
run "poweroff"

* Now export this as "AlpineLinuxSFFSHostBase.ova"
```
