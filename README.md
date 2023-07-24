# Jellyfin with rar2fs support
For Unraid, privileged mode must be used in docker otherwise rar2fs cannot mount the share.

Point Container Path: /media in Unraid to your folders with rar-media, for example /media = /mnt/user/Movies.
In Jellyfin, simply add /data-unrar/Movies to the library
