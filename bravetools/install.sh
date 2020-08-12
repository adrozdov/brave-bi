#/bin/bash

sudo cp ubuntu/brave /usr/bin/

var="$(which lxc)" 

if [[ $var =~ "/usr/bin/lxc" ]]; then
    echo "Deleteing LXD"
    sudo apt remove -y lxd
    sudo apt autoremove -y
else
    echo "Installing Bravetools ..."
fi

brave init