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




########################
#### LINUX          ####
########################

# welcome text
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
function grep_recursive() {
   arg=$1
   grep -R $arg . -n
}
alias grepr="grep_recursive"

# Alias for executing in background
alias p3="python3"

alias sudo_upgrade="sudo apt-get upgrade"
alias sudo_update="sudo apt-get update"

# executing and killing processes
function execute_cmd_in_background()  {
    array="${@}"
    eval $array 1> /dev/null &
}

function kill_running_cmds() {
    for i in $(jobs -pr); do kill -9 $i; done;
}

alias ex="execute_cmd_in_background"
alias kex="kill_running_cmds; echo jobs"

# ssh
alias ssh_local='ssh localhost'
alias ifc='ifconfig'

# cd aliases
alias 4cd="cd ..;cd ..;cd ..;cd ..;"
alias 3cd="cd ..;cd ..;cd ..;"
alias 2cd="cd ..;cd ..;"

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

########################
#### PROGRAMS       ####
########################

# Pdf managers
alias oku="okular"
alias zat="zathura"
alias mir="mirage"
alias invert_color='xcalib -invert -alter'

# File mangagers
alias ran='ranger'
alias ran_custom='ranger --copy-config=all'
alias ran_config='cd ~/.config/ranger'

# Open google chrome
function reddit(){
  news="https://www.reddit.com/r/news/"
  physics="https://www.reddit.com/r/Physics/"
  memes="https://www.reddit.com/r/memes/"
  public_f="https://www.reddit.com/r/PublicFreakOut/"
  chromium-browser $news $physics $memes $public_f
}
alias chrome="chromium-browser"

# docker
alias docker_socket="sudo chmod 777 docker.sock"


# git
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

function get_file_from_commit() {
    commit_id=$1
    file_path=$2
    git checkout $commit_id -- $file_path
}

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
alias gce="git commit -a --allow-empty-message -m ''"
alias gp="git push origin HEAD"

########################
#### PERSONAL       ####
########################

# revolve shortcuts
alias cm="cd ~/catkin_rdv && catkin_make; cd -"
alias cm_test="cd ~/catkin_rdv && catkin_make run_tests_rdv_launch; cd -"
alias catkin="cd ~/catkin_rdv"
alias pipeline="cd ~/catkin_rdv/src/rdv_pipeline"
alias traj="cd ~/trajectory_optimization"

alias control_td_pre="roslaunch rdv_launch simulator_control.launch TD_PRE:=1 rviz:=1"
alias control_td="roslaunch rdv_launch simulator_control.launch TD:=1 rviz:=1"
alias control_skidpad="roslaunch rdv_launch simulator_control.launch SKIDPAD:=1 rviz:=1"

# hypertrophy project
alias hyp="cd ~/hypertrophy_project"

# research shortcuts
alias research="cd ~/research"
alias math="cd ~/research/mathematics"
alias mathc="cd ~/research/mathematics/complex_analysis"
alias mathd="cd ~/research/mathematics/dynamic_systems"

# idea shortcuts
alias ideas="cd ~/ideas"
alias chords="mirage ~/ideas/guitar/chords.png"
alias note="vim ~/ideas/note.txt"
alias jokes="cd ~/ideas/jokes"
alias revolve="cd ~/ideas/revolve"
alias tind="cd ~/ideas/tinder"

# Linux runtime shortcuts
alias mysh="vim ~/.linux_runtime/bashrc/my_bash_configs.sh"
alias myprgms="vim ~/.linux_runtime/install/ubuntu/install_programs.sh"
alias lrt="cd ~/.linux_runtime/"

# Vim runtime shortcuts
alias vrt="cd ~/.vim_runtime/"
alias myvim="vim ~/.vim_runtime/custom/my_vim_configs.vim"


