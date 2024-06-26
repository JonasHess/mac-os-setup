```
███    ███  █████   ██████        ██████  ███████     ███████ ███████ ████████ ██    ██ ██████  
████  ████ ██   ██ ██            ██    ██ ██          ██      ██         ██    ██    ██ ██   ██ 
██ ████ ██ ███████ ██      █████ ██    ██ ███████     ███████ █████      ██    ██    ██ ██████  
██  ██  ██ ██   ██ ██            ██    ██      ██          ██ ██         ██    ██    ██ ██      
██      ██ ██   ██  ██████        ██████  ███████     ███████ ███████    ██     ██████  ██      
```

This repository leverages [mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook) to set up my MacBook, install various packages, and symlink my dotfiles.

### Setup SSH Keys
```bash
 cp -R /Volumes/USB-Stick/.ssh ~/.ssh
 chmod 600 -R ~/.ssh
 ssh git@github.com
```

### Clone this repo
``` bash
mkdir -p ~/repos 
git clone git@github.com:JonasHess/mac-os-setup.git ~/repos/mac-os-setup
```


### Ensure Apple's command line tools are installed
``` bash
xcode-select --install
```

### Install Ansible
``` bash
pip3 install ansible
```

### Download git submodules
``` bash
git submodule update --init --recursive
```


### Run Setup.sh
``` bash
chmod +x ./setup.sh
./setup.sh
```

### Clear all elements from the Dock
``` bash
defaults write "com.apple.dock" "persistent-apps" -array
killall Dock
```
