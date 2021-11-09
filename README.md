# Linux/Mac Provision

## Requirements

Install ansible and

```bash
ansible-galaxy install -r requirements.yml
```

## Run

### If you want to run remotely do:
```bash
ansible-playbook -kK -e ip=someip -e user_name=youruser --ask-vault-pass playbook.yml
```

### To run locally use:
```bash
ansible-playbook --connection=local --limit 127.0.0.1 -kK -e ip=127.0.0.1 -e user_name=youruser --ask-vault-pass playbook.yml
```

### Running specific tags
Select the tags according to playbook and use

```
--tags "tag1,tag2"
```

### Important warnings

* If you already installed manual brew cask packages you have to sadly remove then from the package list otherwise brew will throw an error
* Linux playbooks and conditionals are not tested yet



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
* Configure touch Bar to lock and dnd

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
