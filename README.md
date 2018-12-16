# Requirements


# Environmental
The following environmental variables must be populated, when running container

# Ports
The following ports must be mapped, when running container

# Volumes
The following volumes must be mapped, when running container

- :/srv/rclone/config
- :/mnt/data

# Config
The config directory inside this container contains 2 files:

- `/srv/rclone/config/rclone.conf` - contains rclone configuration
- `/srv/rclone/config/cron-15mins` - contains a script that is run every 15 minutes by cron. **Must be edited to do what you want**