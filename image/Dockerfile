FROM alpine
ARG TARGETARCH
RUN case "${TARGETARCH}" in \
       arm*)  file='Asset-RaspberryPi'   ;; \
       amd64) file='AssetUPnP-Linux-x64' ;; \
       386)   file='AssetUPnP-Linux-x86' ;; \
       *) >&2 echo "Unsupported architecture: ${TARGETARCH}" && exit 1 ;; \
     esac && \
     wget -q -O - "http://www.dbpoweramp.com/install/${file}.tar.gz" | tar -C /opt/ -xz && \
     ln -s "$(find /opt/ -mindepth 1 -maxdepth 1 -type d | head -n 1)/bin/AssetUPnP" /usr/bin/asset
RUN  mkdir /data
ENV  _APPDATA_OVERRIDE=/data
STOPSIGNAL SIGINT
CMD  asset
