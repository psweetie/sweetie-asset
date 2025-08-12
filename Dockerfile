#image used
FROM alpine

#Install Asset-upnp 
RUN wget -q -O - "http://nas1.sweetmans.me/Asset-Linux-x64.tar.gz" | tar -C /opt/ -xz && \
     ln -s "$(find /opt/ -mindepth 1 -maxdepth 1 -type d | head -n 1)/bin/AssetUPnP" /usr/bin/asset
RUN  mkdir /data

#env variables
ENV  _APPDATA_OVERRIDE=/data

#set volumesvolume
VOLUME /root/.dBpoweramp
VOLUME /music

#show ports used
EXPOSE 45537/tcp 26125/tcp 1900/udp
STOPSIGNAL SIGINT

#run command
CMD  asset
