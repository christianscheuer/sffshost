## Installation

### To install on Alpine Linux VM in VMWare Fusion

* Download https://raw.githubusercontent.com/christianscheuer/sffshost/bin/assets/AlpineLinuxSFFSHostBase.ova
* In VMWare Fusion, choose Import from this AlpineLinuxSFFSHostBase.ova
* Choose Retry if it asks to relax verification settings
* Click Customize Settings
* Click "Network Adapter", activate "bridged networking via ethernet" (so VM gets its own IP)
* Start VM (click Upgrade if prompted)
* Log in with root/sffshost

* Run this command:
```
wget -O - https://raw.githubusercontent.com/christianscheuer/sffs/master/bootstrap-alpine.sh | sh
```
