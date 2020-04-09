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

function git_credential() {
    # Avoid passwords and stuff.
    # Setup git credential
    sudo apt-get install libsecret-1-0 libsecret-1-dev
    sudo mkdir /usr/share/doc/git/contrib/credential/libsecret
    cd ~/ubuntu16_setup
    sudo cp Makefile /usr/share/doc/git/contrib/credential/libsecret/
    sudo cp git-credential-libsecret.c /usr/share/doc/git/contrib/credential/libsecret
    cd /usr/share/doc/git/contrib/credential/libsecret
    git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
    sudo make
}

function install_ros() {
	# Setup your sources.list
	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

	# Set up your keys
	sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

	# Desktop Full install
	sudo apt-get install ros-kinetic-desktop-full
	echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
	source ~/.bashrc

	# Init rosdep
	sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
	sudo rosdep init
	rosdep update
}

function install_setup() {
	git clone --depth=1 https://github.com/isakhammer/vimrc.git ~/.vim_runtime
	bash ~/.vim_runtime/install/install_awesome_setup.sh
	cd ~ && git clone git@github.com:isakhammer/research.git
}

function install_pipeline() {
	mkdir -p ~/catkin_rdv/src
	cd ~/catkin_rdv && catkin_make

	cd ~/catkin_rdv/src; git clone git@github.com:RevolveNTNU/rdv_pipeline.git

    cd rdv_pipeline
	#git checkout dev
	git checkout origin/feature/missions
	git submodule update --init --recursive
	chmod +x scripts/install_dependencies.sh && ./scripts/install_dependencies.sh
}


sudo apt update
sudo apt upgrade

# Install essentials
sudo apt install -y vim git chromium-browser
sudo apt install snapd
sudo snap install slack --classic
snap install spotify


EMAIL="isakhammer@gmail.com"
git config --global user.email $EMAIL
#generate_ssh_key $EMAIL
install_ros
install_pipeline
install_setup
