#image used
FROM alpine

#Install Asset-upnp 6.6
RUN \
apt-get update && \
apt-get install -y wget && \
mkdir -p /usr/bin/asset && \
chmod -R 777 /usr/bin/asset && \
cd /usr/bin/asset && \
wget http://nas1.sweetmans.me/www.dbpoweramp.com/install/Asset-Linux-x64.tar.gz && \
tar -zxvf *.gz && \
rm *.gz && \
apt-get purge --remove -y wget && \
apt-get autoremove -y && \
apt-get clean

#RUN  mkdir /data
ENV  _APPDATA_OVERRIDE=/data

#set volumesvolume
VOLUME /root/.dBpoweramp
VOLUME /music

#show ports used
EXPOSE 45537/tcp 26125/tcp 1900/udp
STOPSIGNAL SIGINT

#run command
CMD  asset#Install Asset-upnp 6.6
