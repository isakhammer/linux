# Usage

## Why
Because python and jupyter-notebook has bloated environment and I did not get virtualenv to work properly.

## Make an requirements.txt file for your python script.

## Build the jupyter-image
Run 'bash update-jupyter.sh' to make a jupyter docker image and push it to the docker hub.

## Copy the template to your directory
bash 'cp ~/.linux_runtime/jupyter/Dockerfile-src ~/.linux_runtime/jupyter/run-container.sh .'

## Run the dockerfile
' bash run-container.sh' will first build the template Dockerfile and install requirements. Second, it will run the image with mounted volume to your source files. You can then open the given link and edit your jupyter file as normal.



