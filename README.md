## Installation

### To install on Alpine Linux VM in VMWare Fusion

* Download https://raw.githubusercontent.com/christianscheuer/sffs/bin/assets/AlpineLinuxSFFSHostBase.ova
* In VMWare Fusion, choose Import from this AlpineLinuxSFFSHostBase.ova
* Choose Retry
* Click Customize
* Setup bridged networking via ethernet in "network adapter" (så VM får sin egen IP)
* Start VM (click Upgrade if prompted)
* Log in with root/sffshost

* Run this command:
```
cd /opt && sudo git clone --depth 1 https://github.com/christianscheuer/sffs -b master && cd sffs && sudo chown -R $USER . && ./install-alpine.sh
```
