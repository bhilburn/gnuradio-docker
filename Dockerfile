FROM bistromath/uhd:3.10.2

ENV gr_ver 3.7.11
ENV num_threads 10
MAINTAINER bistromath@gmail.com version: 0.5

#i could just do apt-get install gnuradio
#but then it'd use the older UHD, and part of the
#reason to do this is to get latest releases.
#no offense to maitland.
RUN apt-get install -y libboost-dev libfftw3-3 libfftw3-dev libcppunit-1.13-0v5 \
    swig3.0 libgsl-dev libasound2-dev python-cheetah python-numpy python-lxml \
    python-gtk2 python-cairo-dev python-qt4 libqwt5-qt4 libqwt-dev python-qwt5-qt4 \
    liblog4cpp5-dev libzmq3-dev python-zmq

WORKDIR /opt
RUN git clone https://github.com/gnuradio/gnuradio.git
WORKDIR /opt/gnuradio
RUN git checkout v${gr_ver}
RUN git submodule init && git submodule update
RUN mkdir build && cd build && cmake ../ && make -j${num_threads} && make install && ldconfig
