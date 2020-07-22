sudo apt install vim

sudo apt install cowsay
sudo apt install neofetch
sudo apt install freecad
sudo apt install snapd
sudo apt install okular
sudo apt install gddrescue
sudo apt install i3

snap install googler discord spotify htop gimp kdenlive
snap install slack --classic
snap install gitkraken --classic
snap install kdekden

function install_mirage(){
  mkdir ~/tmp_mirage
  cd ~/tmp_mirage
  wget http://security.ubuntu.com/ubuntu/pool/main/e/exiv2/libexiv2-14_0.25-4ubuntu2.2_amd64.deb
  wget http://archive.ubuntu.com/ubuntu/pool/universe/p/pyexiv2/python-pyexiv2_0.3.2-9_amd64.deb
  wget http://archive.ubuntu.com/ubuntu/pool/universe/p/pygtk/python-gtk2_2.24.0-6_amd64.deb
  wget http://archive.ubuntu.com/ubuntu/pool/universe/m/mirage/mirage_0.9.5.2-1_amd64.deb

  sudo apt-get install ./*.deb
  rm -Rf ~/tmp_mirage
}

function install_vscode(){
  sudo apt install software-properties-common apt-transport-https wget
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  sudo apt update
  sudo apt install code
}

function install_anydesk(){
  wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
  echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list

  sudo apt update
  sudo apt install anydesk
}



install_mirage
install_vscode

sudo apt-get install -y zathura
sudo apt-get install -y xdotool
sudo apt-get install -y latexmk
sudo apt-get install -y ranger
sudo apt-get install -y i3
sudo apt-get install -y python3
sudo apt-get install -y python3-pip
sudo apt-get install -y xcalib
pip install --upgrade pip
sudo apt install docker.io
# According to some sources said that this was necessary to install docker
#sudo usermod -aG docker ${USER}
#su - ${USER}


# ssh connection
sudo apt-get install openssh-client
sudo apt-get install openssh-server


function install_npm(){
  curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt-get install -y nodejs
  npm install --save-dev electron
}

install_npm
