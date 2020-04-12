#!/bin/bash

function generate_ssh_key() {
	local email=$1
	# Make ssh permissions
	mkdir ~/.ssh
	chmod 700 ~/.ssh

	# Generate key.
	ssh-keygen -t rsa -b 4096 -C "$email"
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa

	# Get sshkey to clipboard
	sudo apt-get install xclip
	xclip -sel clip < ~/.ssh/id_rsa.pub

	# Opens up ssh key settings
	chromium-browser https://github.com/settings/ssh/new
}

function set_git_credential() {
    # Avoid passwords and stuff.
    # Setup git credential
    sudo apt-get install libsecret-1-0 libsecret-1-dev
    sudo mkdir /usr/share/doc/git/contrib/credential/libsecret
    sudo cp ~/.linux_runtime/install/ubuntu/Makefile /usr/share/doc/git/contrib/credential/libsecret/
    sudo cp ~/.linux_runtime/install/ubuntu/git-credential-libsecret.c /usr/share/doc/git/contrib/credential/libsecret
    cd /usr/share/doc/git/contrib/credential/libsecret
    git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
    sudo make
}


sudo apt update
sudo apt upgrade

# Install essentials
sudo apt install -y vim git chromium-browser

EMAIL="isakhammer@gmail.com"
git config --global user.email $EMAIL
generate_ssh_key $EMAIL
set_git_credential

bash ~/.linux_runtime/install/ubuntu/install_programs.sh
bash ~/.linux_runtime/install/install_bashrc.sh
#bash ~/.linux_runtime/install/install_ros.sh

# Vimrc
git clone --depth=1 https://github.com/isakhammer/vimrc.git ~/.vim_runtime
bash ~/.vim_runtime/install/install_awesome_vimrc.sh
