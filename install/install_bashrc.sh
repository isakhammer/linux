#!/bin/sh

echo "Making backup of your ~/.bashrc at: ~/.bashrc_backup_"$NOW
cp ~/.bashrc ~/.bashrc_backup_$NOW
echo "Writing into your ~/.bashrc."
echo "Starts writing"
sleep 0.5
echo "====="
echo "" |& tee -a ~/.bashrc
echo 'source ~/.linux_runtime/bashrc/my_bash_configs.sh' |& tee -a ~/.bashrc
echo "" |& tee -a ~/.bashrc
echo "====="
sleep 0.5
echo "Finished writing"

source ~/.bashrc
echo "Installed the Ultimate Isak Bash configuration successfully! Enjoy :-)"
