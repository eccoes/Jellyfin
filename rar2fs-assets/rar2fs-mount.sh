#!/bin/sh
rar2fs /media /data-unrar -o allow_other --seek-length=1
exec "$@"
