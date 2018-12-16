#!/usr/bin/with-contenv bash

# make folders (Original)
mkdir -p \
	/srv/rclone/config


ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

if [[ ! -L /etc/periodic/15min/rclone && ! -f /srv/rclone/config/cron-15mins ]]; then

cat > /srv/rclone/config/cron-15mins <<DELIM
#!/bin/sh
# GLOBAL OPTS
RCLONE_OPTS="--config /srv/rclone/config/rclone.conf"
SYNC_OPTS=""

# SYNC ENTRY OPTS
#SRC="/opt/mediadepot/apps/couchpotato"
#DEST="gdrive:/depot_backup/couchpotato"
#echo "INFO: Starting rclone sync \$SRC \$DEST \$RCLONE_OPTS \$SYNC_OPTS"
#LANG=C.UTF-8 /usr/bin/rclone sync \$SRC \$DEST \$RCLONE_OPTS \$SYNC_OPTS
DELIM
chmod +x /srv/rclone/config/cron-15mins

ln -s /srv/rclone/config/cron-15mins /etc/periodic/15min/rclone

fi