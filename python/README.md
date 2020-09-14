# Build
Build using the update python script.

# Push 
Push to isakhammer/python
'docker push isakhammer/python'
You also might want to 
'docker login'

# Usage
Run

'''
function run_python()  {
  image_name="isakhammer/python:latest"
  xhost +local:root
  XSOCK=/tmp/.X11-unix
  docker run -it \
     -e DISPLAY=$DISPLAY \
      -v $(pwd)/:/root/src \
      -v $XSOCK:$XSOCK \
      -v $HOME/.ssh:/root/.ssh \
       -v $HOME/.Xauthority:/root/.Xauthority \
       --name python \
        --privileged \
        $image_name "$@"
}
'''
TODO: Looks into if it hurts doing ssh and stuff.

## Run the dockerfile
' bash run-container.sh' will first build the template Dockerfile and install requirements. Second, it will run the image with mounted volume to your source files. You can then open the given link and edit your jupyter file as normal.



