# Jellyfin
For Unraid, privileged mode must be used in docker otherwise rar2fs cannot mount.

Point /media to your folders with rar-media, for example /media = /mnt/user/Movies
After the docker is started, open console and run "rar2fs /media /data-unrar -o allow_other --seek-length=1" without quotes.
