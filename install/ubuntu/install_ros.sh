
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

