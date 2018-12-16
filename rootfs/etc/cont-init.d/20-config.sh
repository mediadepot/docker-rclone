#!/usr/bin/with-contenv bash

# make folders (Original)
mkdir -p \
	/srv/rclone/config


if [[ ! -L /etc/periodic/15min/rclone && ! -f /srv/rclone/config/cron-15mins ]]; then



cat > /srv/rclone/config/cron-15mins <<DELIM
#!/bin/sh
LANG=C.UTF-8 /usr/bin/rclone --config /srv/rclone/config/rclone.conf
DELIM
chmod +x /srv/rclone/config/cron-15mins


ln -s /srv/rclone/config/cron-15mins /etc/periodic/15min/rclone

fi