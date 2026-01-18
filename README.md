# Install ansible

Install ansible with pip

# Linux/Mac Provision
Run

```bash
ansible-playbook -kK -i inventory --ask-vault-pass playbook.yml
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
