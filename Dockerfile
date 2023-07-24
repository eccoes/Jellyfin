FROM jellyfin/jellyfin

# Install rar2fs
COPY rar2fs-assets/install_rar2fs.sh /tmp/
RUN /bin/sh /tmp/install_rar2fs.sh
RUN mkdir /data-unrar

# Add start script
COPY rar2fs-assets/30-rar2fs-mount /etc/cont-init.d/

EXPOSE 8096 8920

# Add startup script
COPY rar2fs-assets/rar2fs-mount.sh /tmp/
RUN ["chmod", "+x", "/tmp/rar2fs-mount.sh"]
ENTRYPOINT ["/tmp/rar2fs-mount.sh"]
CMD ["/jellyfin/jellyfin"]
