#!/usr/bin/env bash
set -e
if [ "$EUID" -ne "0" ] ; then
        echo "Script must be run as root." >&2
        exit 1
fi
if which ansible > /dev/null ; then
        echo "Ansible is already installed"
        exit 0
fi
echo "Installing Ansible for Ubuntu 18.04 LTS"
apt-get update
echo Installing Ansible
apt-get install -y ansible
echo "Ansible installed!"
