# Setting Up

ssh-keygen -t rsa -b 4096 -C "[Machine] - Work/Personal"

# Manage Passphrase

To avoid having to type this passphrase every time you need to use a key, most operating systems have a concept of a key agent. This key agent stores SSH keys securely between uses, typically the first time a key is needed in a given time period, the SSH agent will load the key, prompt you for your passphrase and then the key agent will remember the key for a certain amount of time (on OSX it tends to be indefinite, on linux this can vary from 15 minutes upwards.)


# Manage Passphrase

To avoid having to type this passphrase every time you need to use a key, most operating systems have a concept of a key agent. This key agent stores SSH keys securely between uses, typically the first time a key is needed in a given time period, the SSH agent will load the key, prompt you for your passphrase and then the key agent will remember the key for a certain amount of time (on OSX it tends to be indefinite, on linux this can vary from 15 minutes upwards.)

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

# Run configure.sh
