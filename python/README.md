# Usage

## Why
Because python and jupyter-notebook has bloated environment and I did not get virtualenv to work properly.

## How
Go to your project folder and run these commands.

### For jupyter notebook
```
image_name="isakhammer/jupyter-notebook:latest"
docker run -p 8888:8888\
 -v $(pwd)/:/root/src \
 $image_name
```

### For normal python environment
```
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
```

### To update images
Run jupyter and python update scripts.
Push your stuff to isakhammer/jupyter-notebook and isakhammer/python
