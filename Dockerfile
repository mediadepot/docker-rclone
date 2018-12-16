FROM mediadepot/base

MAINTAINER Jason Kulatunga <jason@thesparktree.com>

RUN apk add --no-cache bash

# based on https://github.com/bcardiff/docker-rclone/blob/master/Dockerfile
ENV RCLONE_VERSION=current \
    ARCH=amd64 \
    TZ=America/Los_Angeles


RUN apk --no-cache add bash ca-certificates tzdata \
    && cd /tmp \
    && curl -O -L http://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-${ARCH}.zip \
    && unzip /tmp/rclone-${RCLONE_VERSION}-linux-${ARCH}.zip \
    && mv /tmp/rclone-*-linux-${ARCH}/rclone /usr/bin \
    && rm -r /tmp/rclone*

# add local files
COPY rootfs/ /

# ports and volumes
VOLUME ["/srv/rclone/config"]
EXPOSE 8081

CMD ["/init"]
