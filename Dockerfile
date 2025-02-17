FROM jellyfin/jellyfin
USER root

# Add libs & tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends libfuse-dev autoconf autopoint automake wget build-essential git  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
# Install rar2fs
COPY rar2fs-assets/install_rar2fs.sh /tmp/
RUN /bin/sh /tmp/install_rar2fs.sh
RUN mkdir /data-unrar
RUN mkdir /cache-unrar
# CLEAN Image
RUN apt-get remove -y autoconf autopoint build-essential git automake && \
    apt autoremove -y
RUN rm -rf /tmp/* /var/tmp/*

# Add start script
COPY rar2fs-assets/30-rar2fs-mount /etc/cont-init.d/

EXPOSE 8096 8920
VOLUME /config

# Add startup script
COPY rar2fs-assets/rar2fs-mount.sh /tmp/
RUN ["chmod", "+x", "/tmp/rar2fs-mount.sh"]
ENTRYPOINT ["/tmp/rar2fs-mount.sh"]
CMD ["/jellyfin/jellyfin"]
