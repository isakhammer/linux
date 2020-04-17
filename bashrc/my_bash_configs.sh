#!/bin/bash

 function install_plugin()  {
    cd ~/.vim_runtime/my_plugins
    ssh_key=$1

    # Get name from ssh key
    echo "$ssh_key">tmp_ssh_key.txt
    vim -s ~/.vim_runtime/custom/get_ssh_name.txt tmp_ssh_key.txt
    read -r ssh_name<tmp_ssh_key.txt
    rm -Rf tmp_ssh_key.txt

    # clone plugin
    git clone $ssh_key $ssh_name
 }

 function execute_cmd_in_background()  {
     array="${@}"
     eval $array 1> /dev/null &
 }

 function grep_recursive() {
    arg=$1
    grep -R $arg . -n
 }

 function kill_running_cmds() {
     for i in $(jobs -pr); do kill -9 $i; done;
 }

 function git_commit()  {
     array="${@}"
     git commit -m"$array"
 }

# Welcome text
cowsay Get started $(whoami)

# Starting vim mode in terminal
set -o vi

# Alias for editing bashrc
alias shrc="vim ~/.bashrc"

# Alias for cleaning terminal.
alias c="clear"

# Alias for sourcing bashrc
alias s="source ~/.bashrc"

# Alias for rescursive grep.
alias gr="grep_recursive"

# Alias for executing in background
alias p3="python3"

# Alias for executing in background
alias ex="execute_cmd_in_background"

# Kill running cmnds
alias kex="kill_running_cmds; echo jobs"

# Pdf managers
alias oku="okular"
alias zat="zathura"

# Open google chrome
alias chrome="chromium-browser"

# Git aliases
alias gd="git diff"
alias gqp="git stash pop"
alias gq="git stash"
alias gs="git status"
alias ga="git add ."
alias gap="git add -p"
alias gc="git_commit" # custom function
alias gp="git push origin HEAD"

# Personal aliases
alias cm="cd ~/catkin_rdv && catkin_make; cd -"

alias traj="cd ~/rdv_trajectory"
alias research="cd ~/research"
alias lrt="cd ~/.linux_runtime/"
alias vrt="cd ~/.vim_runtime/"

alias myvim="vim ~/.vim_runtime/custom/my_vim_configs.vim"
alias mysh="vim ~/.linux_runtime/bashrc/my_bash_configs.sh"
alias myprgms="vim ~/.linux_runtime/install/ubuntu/install_programs.sh"

alias update="sudo apt-get update"

