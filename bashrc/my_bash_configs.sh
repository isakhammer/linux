#!/bin/bash

# Changing delimiter of csv file
# $1: file with , delimiter
# $2: new filename with ; delimiter
function remove_semicolon_at_end(){
    file=$1
    new_file=$2
    sed 's/;\+$//' $file > $new_file
}

# Changing delimiter of csv file
# $1: file with , delimiter
# $2: new filename with ; delimiter
function change_delimiter(){
    file=$1
    new_file=$2
    sed 's/,/;/g' $file > $new_file
}



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



# function git_add()  {
#     array="${@}"
#     [ -z "$array"] && array="."

#     echo "$array"
#     git add $array
# }

function git_clone_recursive()  {
    arg=$1
    git clone $arg --recurse-submodules
}

function git_commit()  {
    array="${@}"
    git commit -m"$array"
}

function git_stash_pop()  {
    arg=$1
    git stash pop stash@{$arg}
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
alias grepr="grep_recursive"

# Alias for executing in background
alias p3="python3"

alias sudo_upgrade="sudo apt-get upgrade"
alias sudo_update="sudo apt-get update"

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
alias gl="git log"
alias gd="git diff"
alias gqp="git stash pop"
alias gq="git stash"
alias gs="git status"
alias gb="git branch"
alias gch="git checkout"
alias gchb="git checkout -b"
alias ga="git add"
alias gap="git add -p"
alias gc="git_commit" # custom function
alias gp="git push origin HEAD"

# Personal aliases
alias sensitivities="mkdir sensitivities && cp sensitivity_*/*.png sensitivities/"
alias cm="cd ~/catkin_rdv && catkin_make; cd -"
alias cm_test="cd ~/catkin_rdv && catkin_make run_tests_rdv_launch; cd -"

alias traj="cd ~/rdv_trajectory"
alias research="cd ~/research"
alias lrt="cd ~/.linux_runtime/"
alias vrt="cd ~/.vim_runtime/"

alias myvim="vim ~/.vim_runtime/custom/my_vim_configs.vim"
alias mysh="vim ~/.linux_runtime/bashrc/my_bash_configs.sh"
alias myprgms="vim ~/.linux_runtime/install/ubuntu/install_programs.sh"

alias update="sudo apt-get update"

