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
    ssh-add
}


sudo apt update
sudo apt upgrade

# Install essentials
sudo apt install -y vim git chromium-browser

EMAIL="isakhammer@gmail.com"
generate_ssh_key $EMAIL
git config --global user.email $EMAIL
git config credential.helper store


