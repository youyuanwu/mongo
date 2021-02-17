FROM thevlang/vlang:latest

RUN apt-get update && apt-get install pkg-config libssl-dev libsasl2-dev cmake wget -y

WORKDIR /mongoc

RUN apt-get install cmake libssl-dev libsasl2-dev && \
    wget https://github.com/mongodb/mongo-c-driver/releases/download/1.17.4/mongo-c-driver-1.17.4.tar.gz && \
    tar xzf mongo-c-driver-1.17.4.tar.gz

WORKDIR /mongoc/mongo-c-driver-1.17.4/cmake-build
RUN cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF .. && \
    make && make install

