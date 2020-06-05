# Introduction to dockermachine
# https://www.macadamian.com/learn/docker-machine-basic-examples/

# Installation:
# https://stackoverflow.com/questions/47301434/sudo-docker-machine-command-not-found
sudo apt install curl

curl -L https://github.com/docker/machine/releases/download/v0.16.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && chmod +x /tmp/docker-machine && sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
