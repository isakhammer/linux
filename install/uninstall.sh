
NOW=$(date +"%m-%d-%y-%T")
echo "Making backup of your ~/.bashrc at: ~/.bashrc_backup_"$NOW
cp ~/.bashrc ~/.bashrc_backup_$NOW
sed -i "/.linux_runtime/d" ~/.bashrc
source ~/.bashrc

cd ~
rm -Rf ~/.linux_runtime
