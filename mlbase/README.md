This repository containes executable, scripts, and configuration files to setup a Ubuntu server with Jupyter notebooks and [IVIS](https://github.com/beringresearch/ivis).

It includes an executable [**brave**](https://beringresearch.github.io/bravetools/) - the container management tool. 


# Prerequisites

## Mac OS:

- [Vagrant](https://www.vagrantup.com/downloads)
- [Virtual Box](https://download.virtualbox.org/virtualbox/6.1.12/VirtualBox-6.1.12-139181-OSX.dmg)
- [Multipass](https://multipass.run/)

## Ubuntu server:

- Ubuntu 18.04(20.04)

## Installation

## Mac OS (Vagrant):

Run in terminal from **mlbase** folder

```bash
$ cd mlbase
$ vagrant up
$ vagrant ssh

vagrant@mlbase:~$ cd /vagrant
vagrant@mlbase:~$ bash install.sh
```

## Mac OS (Multipass)

1. Install Multipass

2. Install `Bravetools`

```bash
$ sudo cp bin/darwin/brave  /usr/local/bin/
```

3. Run in Terminal from project folder:

```bash
$ brave init
```

## Ubuntu server:

1. Login into remote server via SSH:

```bash
$ ssh [remote_user_name]@[remote_server]
```

2. Install **git**:

```bash
$ sudo apt install git
```

3. Clone repository:

```bash
$ git clone https://github.com/adrozdov/mlbase
```

4. Run following commands:

```bash
$ cd mlbase
$ bash install.sh
```

Make a note of a token in URL after the line "Currently running servers". 
After setup process complete namvigate to `http://localhost:8888` (if installed on the live server use server name or IP address instead of localhost). Use a token to login into Jupyter Notebooks.

On Mac service is running on `http://[multipass_ip]:8888`. Multipass IP can be found by executing `brave info` command under IPV4.


## Using SSL

To use HTTPS on live server: 

- aquire SSL certificats (free could be aquired from [Let's Encrypt](https://letsencrypt.org/getting-started/));

- amend Bravefile. Include section to copy certificate and key files from project folder into container `\root\` during `brave build` stage;

- make a change to the ExecStart in `jpyter.service`:

```
ExecStart=/bin/bash -c "jupyter-notebook \
    --ip='*' \
    --port=8888 \ 
    --no-browser --allow-root \ 
    --certfile=mycert.pem \
    --keyfile mykey.key \
    --notebook-dir=/root/notebooks"
```

Replace mycert.pem and mykey.key with absulute path and appropriate names of certificate and key files.