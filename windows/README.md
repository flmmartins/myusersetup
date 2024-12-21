# How to run ansible on WSL targeting your local windows

I am running ansible on WSL and I am targeting the underlying windows machine from it. 

WSL is actually a virtual machoine so you now you have 2 machines:

1. Your Linux WSL machine
2. Your Windows machine where WSL is installed

You can run ansible with: `ansible-playbook -i inventory.yml -k playbook.yml` 

Check the steps below with further instructions on how setup

# Setup

## Setup inventory file

In order to run ansible you will need the IP address of your Windows machine. You can do this by running this command from your WSL machine:

```
ip route show | grep -i default | awk '{ print $3}'
```

Now put the IP in your inventory file. In this example my Windows IP is 172.29.112.1. Add the IP on the inventory file.

Replace ansible_user by your windows machine user

**Important: IP will change on every reboot**


## Enable SSH on Windows

You will need to run ansible with ssh. Here's an [article](https://www.hanselman.com/blog/how-to-ssh-into-a-windows-10-machine-from-linux-or-windows-or-anywhere) on how to configure Windows to accept SSH

Make sure to reboot your machine. Afterwards open WSL and fetch the IP of Windows:  `ip route show | grep -i default | awk '{ print $3}'`

Now test by going to WSL and doing: ssh <ansible_user>@IP


## Install sshpass

`-k` flag will prompt for your ansible_password. In order for it to work sshpass is required. Install in **WSL** with: `apt-get install sshpass`


# Installing ansible on WSL

## Enable virtualization
* Enable virtualization on windows
* Go to Windows Features on or off > Enable Virtual Machine Platform and Windows Hypervisor Platform
* Install WSL by openin powershell as administrator and running: `wsl --install -d <distro>`
* On WSL install:

```
sudo apt install openssh-client
sudo apt install python3 python3-pip ipython3
```

## Install pipenv for virtualenv (optional)
Install pipenv for virtualenv:

Had to use --break flag because there was a warning


```
pip install pipenv --break-system-packages --user
```

Add pipenv to PATH by going to vim ~/.bashrc and adding: `PATH="$PATH:/root/.local/bin"`

Source your bashrc: `source ~/.bashrc` and `echo $PATH` to check. 

## Install ansible

If you install pipenv do `pipenv install ansible` else use pip.

Access this project by entering folder /mnt/c/Users/<windows-user>...
