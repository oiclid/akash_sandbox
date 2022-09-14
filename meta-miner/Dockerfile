FROM ubuntu:22.04
RUN apt-get update ; apt-get install -y nodejs wget libhwloc15 bc

ENV POOL=localhost:3333
ENV WALLET=4AbG74FRUHYXBLkvqM1f7QH3UXGkhLetKdxS7U7BHkyfMF4nfx99GvN1REwYQHAeVLLy4Qa5gXXkfS4pSHHUWwdVFifDo5K
ENV WORKER=akash
ENV RANDOMX_MODE=fast
ENV AKASH_CLUSTER_PUBLIC_HOSTNAME=local

RUN wget https://raw.githubusercontent.com/MoneroOcean/meta-miner/master/mm.js ; chmod +x mm.js

#Use moneroocean xmrig / testing
#RUN wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb
#RUN dpkg -i libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb
#RUN wget https://github.com/MoneroOcean/xmrig/releases/download/v6.18.0-mo1/xmrig-v6.18.0-mo1-lin64.tar.gz ; tar -zxvf xmrig-v6.18.0-mo1-lin64.tar.gz ; mv xmrig /usr/local/bin 

#Original
#RUN wget https://github.com/xmrig/xmrig/releases/download/v6.18.0/xmrig-6.18.0-bionic-x64.tar.gz ; tar xf xmrig-6.18.0-bionic-x64.tar.gz ; cd xmrig-6.18.0 ; cp xmrig /usr/local/bin ; cp config.json .. ; cd ..
RUN wget https://github.com/xmrig/xmrig/releases/download/v6.18.0/xmrig-6.18.0-linux-static-x64.tar.gz ; tar xf xmrig-6.18.0-linux-static-x64.tar.gz ; cd xmrig-6.18.0 ; cp xmrig /usr/local/bin ; cp config.json .. ; cd ..
RUN sed -i 's/"url": *"[^"]*",/"url": "localhost:3333",/' /config.json
RUN sed -i 's/"user": *"[^"]*",/"user": "4AbG74FRUHYXBLkvqM1f7QH3UXGkhLetKdxS7U7BHkyfMF4nfx99GvN1REwYQHAeVLLy4Qa5gXXkfS4pSHHUWwdVFifDo5K",/' /config.json

COPY run.sh /
ENTRYPOINT ["/bin/bash", "run.sh"]
