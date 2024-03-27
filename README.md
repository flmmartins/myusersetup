# Linux/Mac Provision

### Important warnings

* Linux playbooks and conditionals are not tested yet

#### Mac M1

**Support AMD64 docker images instead of ARM**

Colima support to AMD64 images only if started with : `colima start --arch aarch64 --vm-type=vz --vz-rosetta --runtime docker`

Minikube will not run because doesn't support M1 so force to use colima or docker desktop with --driver docker

## Requirements

Install ansible and

```bash
ansible-galaxy install -r requirements.yml
```

## Run

### Run in locally in your machine
```bash
ansible-playbook -kK --ask-vault-pass playbook.yml
```

### To run remotely use:
```bash
ansible-playbook --connection=ssh -i <IP_ADDRESS> -kK --ask-vault-pass playbook.yml
```

### Running specific tags

Select the tags according to playbook and use `-t "tag1,tag2"`

To list tags:

```
ansible-playbook --list-tags playbook.yml
```


# SSH Command Tips

## Check keys

```bash
ssh-add -l
```

## Add keys

```bash
ssh-add -t *h <key_path>
```

## Check public keys via agent

```bash
ssh-add -L
```

## Create new key type
```bash
ssh-keygen -o -a 200 -t ed25519 -f ~/.ssh/id_ed25519 -C "fernandamartins@worklaptop"
```

# Mac OS Manual configs
* Go to Keyboard and set CAPS to CTRL
* On trackpad enable all options
* Configure Touch ID
* Configure Touch ID for iTerm2 by Prefs -> Advanced -> Allow sessions to survive logging out and back in

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false    # For VS Codium

## Multi user setup for Brew

1. Uninstall existing
2. xcode-select --install
3. cd $HOME && mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
4. echo 'export PATH="$HOME/homebrew/bin:$PATH"' >> .zprofile
5. Reopen terminal

# Windows Provisioning (not finalized)
The configure_cygwin script configures cygwin

## Requirements to run
On cygwin setup you need to install WGET

## Softwares for Windows to be used along with cygwin
TODO: Put them in Chocolatey automation
- VirtualBox
- VirtualBox Extension Pack
- Vagrant
- Notepadd++
- SupperPutty
- WinSCP
- GitHub or GitSCM
