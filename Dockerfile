FROM debian
RUN apt-get update  
RUN apt-get -y upgrade  
RUN apt-get install -yq apt-utils dialog 
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -yq build-essential software-properties-common  
RUN apt-get update  

# Python
RUN apt-get -y install python3
RUN apt-get -y install python3-pip
RUN apt-get install -yq python3-tk
RUN pip3 install --upgrade pip

# Tools
RUN apt-get install -y zathura
RUN apt-get install -y ranger
RUN apt-get install -y vim


RUN mkdir /root/src/
WORKDIR /root/
COPY ./requirements.txt .
RUN pip3 install -r requirements.txt
WORKDIR /root/src




