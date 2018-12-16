#!/usr/bin/with-contenv bash

# make folders (Original)
mkdir -p \
	/srv/rclone/config


ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

if [[ ! -L /etc/periodic/daily/rclone && ! -f /srv/rclone/config/cron-daily ]]; then

cat > /srv/rclone/config/cron-daily <<DELIM
#!/bin/sh
# GLOBAL OPTS
RCLONE_OPTS="--config /srv/rclone/config/rclone.conf"
SYNC_OPTS=""

# SYNC ENTRY OPTS
#SRC="/opt/mediadepot/apps/couchpotato"
#DEST="gdrive:/depot_backup/couchpotato"

#/usr/bin/rclone mkdir \$DEST \$RCLONE_OPTS
#echo "INFO: Starting rclone sync \$SRC \$DEST \$RCLONE_OPTS \$SYNC_OPTS"
#/usr/bin/rclone sync \$SRC \$DEST \$RCLONE_OPTS \$SYNC_OPTS > /dev/stdout
DELIM
chmod +x /srv/rclone/config/cron-daily

ln -s /srv/rclone/config/cron-daily /etc/periodic/daily/rclone

fi