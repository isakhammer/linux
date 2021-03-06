#!/bin/bash

export VISUAL=vim;
export EDITOR=vim;
setxkbmap -option caps:swapescape

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
#neofetch

echo "
  ██████   █████  ██ ██   ██    ██ 
  ██   ██ ██   ██ ██ ██    ██  ██  
  ██   ██ ███████ ██ ██     ████  
  ██   ██ ██   ██ ██ ██      ██  
  ██████  ██   ██ ██ ███████ ██ 
                                

  ███████ ████████ ██████  ██    ██  ██████   ██████  ██      ███████ ███████ 
  ██         ██    ██   ██ ██    ██ ██       ██       ██      ██      ██      
  ███████    ██    ██████  ██    ██ ██   ███ ██   ███ ██      █████   ███████ 
       ██    ██    ██   ██ ██    ██ ██    ██ ██    ██ ██      ██           ██ 
  ███████    ██    ██   ██  ██████   ██████   ██████  ███████ ███████ ███████ 
                                                                              



 For a matrix Pij => Probability from state i) to state j)
   ----------> j - columns
   |
   |
   |
  \|/
   i -rows


   Plan:
   - Do control questions for numerical analysis

   - Manage to formulate the task 1bcd in the stochmod project. -> Maybe start the programming part.

"


# vim mode in terminal
set -o vi
alias c="clear"

# cd aliases
alias 4cd="cd ..;cd ..;cd ..;cd ..;"
alias 3cd="cd ..;cd ..;cd ..;"
alias 2cd="cd ..;cd ..;"

# reboot
alias reboot="sudo reboot"
alias log_out="gnome-session-quit"

# Open program and continue in terminal
alias setsid="setsid -f"

# Alias for editing bashrc
alias shrc="vim ~/.bashrc"
alias s="source ~/.bashrc"

# Alias for rescursive grep.
function grep_recursive() {
   arg=$1
   grep -R $arg . -n
}

alias grepr="grep_recursive"

alias sudo_upgrade="sudo apt-get upgrade"
alias sudo_update="sudo apt-get update"
alias update_browser="sudo update-alternatives --config x-www-browser"

alias switch_caps_esc="setxkbmap -option caps:swapescape"

alias bat="acpi -V"


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

# hardware
alias disk_free="df"
alias unmount_device="umount"

# Make bootable usb
# Examples
# device: /dev/sdb1
# iso_path: ~/Downloads/ubuntu-20.04-desktop-amd64.iso
function create_bootable_usb(){
  device=$1
  iso_path=$2

  sudo ddrescue $iso_path $device --force -D

}

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

# Other
alias image_editor="gimp"
alias video_editor="kdenlive"
alias cad_editor="freecad"
alias anydesk="anydesk"
alias termdown="termdown"
alias klavaro="klavaro"

# Pdf managers
alias oku="okular"
alias zat="zathura"
alias mir="mirage"
alias invert_color='xcalib -invert -alter'

# File mangagers
# Stay in directory after quit
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
#alias ran='ranger'

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
alias docker='sudo docker'
alias docker_socket='sudo chmod 777 /var/run/docker.sock'

function run_melodica()  {
  image_name="isakhammer/melodica:latest"
  xhost +local:root
  XSOCK=/tmp/.X11-unix
  docker run -it \
     -e DISPLAY=$DISPLAY \
      -v $XSOCK:$XSOCK \
      -v $HOME/.ssh:/root/.ssh \
      -v $HOME/rdv_pipeline:/root/catkin_rdv/src/rdv_pipeline \
      -v $HOME/.linux_runtime:/root/.linux_runtime \
       -v $HOME/.Xauthority:/root/.Xauthority \
       --name melodica \
        --privileged \
        $image_name "$@"
}

function run_python()  {
  image_name="isakhammer/python:latest"
  xhost +local:root
  XSOCK=/tmp/.X11-unix
  docker run -it --rm \
     -e DISPLAY=$DISPLAY \
      -v $(pwd)/:/root/src \
      -v $XSOCK:$XSOCK \
      -v $HOME/.ssh:/root/.ssh \
       -v $HOME/.Xauthority:/root/.Xauthority \
       --name python \
        --privileged \
        $image_name "$@"
}

function run_jupyter(){
  image_name="isakhammer/jupyter-notebook:latest"
  docker run -p 8888:8888\
    -v $(pwd)/:/root/src \
    $image_name
}

function cp_jupyter_docker(){
  cp ~/.linux_runtime/jupyter/Dockerfile-src ~/.linux_runtime/jupyter/run-container.sh .
}



function push_melodica()  {
  docker push isakhammer/melodica:latest
}

function commit_melodica()  {
  docker commit melodica isakhammer/melodica:latest
}

function rm_melodica() {
  docker rm melodica
}



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
function set_git_global_user() {
    email=$1
    git config --global user.email "$email"
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
alias gpu="git pull"
alias sgg="set_git_global_user"

# python
alias p3="python3"

# i3
#!/bin/sh
lock() {
    i3lock
}

function i3exit(){
	case "$1" in
	    lock)
	        lock
	        ;;
	    logout)
	        i3-msg exit
	        ;;
	    suspend)
	        lock && systemctl suspend
	        ;;
	    hibernate)
	        lock && systemctl hibernate
	        ;;
	    reboot)
	        systemctl reboot
	        ;;
	    shutdown)
	        systemctl poweroff
	        ;;
	    *)
	        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
	        exit 2
	esac

	exit 0
}

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
alias rr="cd ~/research; ranger"
alias math="cd ~/research/mathematics"
alias stat="cd ~/research/mathematics/statistics"
alias dyn="cd ~/research/mathematics/dynamic-systems"
alias cs="cd ~/research/computer-science"
alias func="cd ~/research/mathematics/functional-analysis"
alias num="cd ~/research/mathematics/numerical-analysis"

# idea shortcuts
alias ideas="cd ~/ideas"
alias chords="mirage ~/ideas/guitar/chords.png"
alias notes="vim ~/ideas/notes"
alias todo="vim ~/ideas/todo/day2day"
alias todo_list="vim ~/ideas/todo"
alias jokes="cd ~/ideas/jokes"
alias revolve="cd ~/ideas/revolve"
alias tind="cd ~/ideas/tinder"

# Linux runtime shortcuts
alias ~="cd ~"
alias mysh="vim ~/.linux_runtime/bashrc/my_bash_configs.sh"
alias myprgms="vim ~/.linux_runtime/install/ubuntu/install_programs.sh"
alias lrt="cd ~/.linux_runtime/"
alias docker_notes="vim ~/.linux_runtime/docker/notes"

# Vim runtime shortcuts
alias vrt="cd ~/.vim_runtime/"
alias myvim="vim ~/.vim_runtime/custom/my_vim_configs.vim"
alias ohana="ssh ohana@129.241.64.225"

alias unreal="cd ~/UnrealEngine/Engine/Binaries/Linux && ./UE4Editor"

# vim
alias texsnip='vim ~/.vim_runtime/sources_non_forked/vim-snippets/UltiSnips/tex.snippets'
alias tex_template='cp ~/.linux_runtime/tex/template.tex .'

#javascript
alias npm_init="npm init"

#pi
alias ssh_pi="ssh pi@10.0.0.16"
alias tex_ignore="cp ~/.linux_runtime/tex/gitignore .gitignore"

#alias
alias sim_planning="roslaunch rdv_launch simulator_planning.launch TD:=1 "



# SCRIPTS

function inside_time_interval(){
  #$1: current time
  #$2: lower limit
  #$3: upper limit
  if [[ "$1" -ge "$2" ]] && [[ "$3" -gt "$1" ]]; then
    INSIDE=0
  fi
}

# Turn off internet between 10-12, 13-15, 15-17, 18-20
# Recall 1 is false in bash
INSIDE=1
t=$(date +%H)
t=18
inside_time_interval t 10 12
inside_time_interval t 13 15
inside_time_interval t 16 18
inside_time_interval t 19 21
if [ "$INSIDE" -eq "0" ]
then
  echo "WIFI IS OFF"
  nmcli radio wifi off
else
  echo "WIFI IS ON"
  nmcli radio wifi on
fi

