# Install ansible

Install ansible with pip

# Linux/Mac Provision
Run te following

```bash
ansible-galaxy install -r requirements.yml
```

```bash
ansible-playbook -kK --ask-vault-pass playbook.yml --extra-vars "ip=<ADD-MACHINE-IP> user_name=ADD-MACHINE-USERNAME"
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

