# Linux/Mac Provision
Run te following

```bash
ansible-galaxy install -r requirements.yml
```

```bash
ansible-playbook -kK --ask-vault-pass playbook.yml
```

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
