sudo apt install dmenu
sudo apt intall bspwm

mkdir -p ~/.config/bspwm
cp ~/.linux_runtime/bspwm/bspwmrc ~/.config/bspwm/bspwmrc

mkdir -p ~/.config/sxhkd
cp ~/.linux_runtime/bspwm/sxhkdrc ~/.config/sxhkd/sxhkdrc




# # Install polybar
# # https://www.reddit.com/r/linux4noobs/comments/9690ia/how_do_i_install_polybar_on_ubuntu_1804/
# sudo apt-get install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2

# cd ~
# git clone https://github.com/jaagr/polybar.git
# cd polybar && ./build.sh
# cp -r ~/.linux_runtime/bspwm/polybar ~/.config/polybar
