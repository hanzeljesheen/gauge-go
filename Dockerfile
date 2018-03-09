FROM golang

RUN apt-get update && apt-get install -q -y \
    default-jdk \
    sudo \
    apt-transport-https

RUN apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-keys 023EDB0B && \
    echo deb https://dl.bintray.com/gauge/gauge-deb stable main | sudo tee -a /etc/apt/sources.list

RUN apt-get update && apt-get install gauge
RUN gauge install go && gauge install html-report && gauge install screenshot && gauge install xml-report

ENV PATH=$HOME/.gauge:$PATH