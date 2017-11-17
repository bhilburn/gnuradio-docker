### Dockerfile

This Dockerfile builds an Ubuntu 16.04 container with a working GNU Radio install. There are a number of other GNU Radio Dockerfiles that work fine for most people, but I couldn't seem to make any of them work on OSX.

Build the container:
```
docker build . -t gnuradio:basic
```

Running the container with a bunch of magic parameters that make X applications work in OSX.
```
docker run -i -t -e XAUTHORITY=/tmp/xauth -v ~/.Xauthority:/tmp/xauth -v /tmp/.X11-unix/:/tmp/ -e DISPLAY=$IP:0 --net host gnuradio:basic
```

Note that you need to replace `$IP` with the IP address of your active NIC. Also, in order for X to work, you need to have XQuartz installed on OSX.
