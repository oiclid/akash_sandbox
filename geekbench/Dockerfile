FROM ubuntu:18.04

WORKDIR /app
RUN sed -i -e 's%http://archive.ubuntu.com/ubuntu%mirror://mirrors.ubuntu.com/mirrors.txt%' -e 's/^deb-src/#deb-src/' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install curl -y

RUN curl http://cdn.geekbench.com/Geekbench-4.4.3-Linux.tar.gz | tar -xz
RUN curl https://cdn.geekbench.com/Geekbench-5.4.4-Linux.tar.gz | tar -xz

RUN mkdir bin

RUN mv Geekbench-4.4.3-Linux/* ./bin
RUN mv Geekbench-5.4.4-Linux/* ./bin
ENV VERSION=
ENV email=
ENV key=
RUN rm -rf Geekbench-4.4.3-Linux
RUN rm -rf Geekbench-5.4.4-Linux

COPY entrypoint.sh ./

ENTRYPOINT ["/app/entrypoint.sh"]
