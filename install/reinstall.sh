
NOW=$(date +"%m-%d-%y-%T")
echo "Making backup of your ~/.bashrc at: ~/.bashrc_backup_"$NOW
cp ~/.bashrc ~/.bashrc_backup_$NOW
sed -i "/.linux_runtime/d" ~/.bashrc
source ~/.bashrc

cd ~
rm -Rf ~/.linux_runtime
git clone --depth=1 https://github.com/isakhammer/linux.git ~/.linux_runtime
source ~/linux/install/ubuntu/install_ubuntu_setup.sh
