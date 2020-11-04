# Linux/Mac Provision
## Run

```bash
ansible-galaxy install -r requirements.yml
```

### If you want to run remotely do:
```bash
ansible-playbook -kK -e ip=someip -e user_name=youruser --ask-vault-pass playbook.yml
```

### To run locally use:
```bash
ansible-playbook --connection=local --limit 127.0.0.1 -kK -e ip=127.0.0.1 -e user_name=youruser --ask-vault-pass playbook.yml
```

### Important warnings

If you already installed manual brew cask packages you have to sadly remove then from the package list otherwise brew will throw an error

Linux playbooks and conditionals are not tested yet

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
