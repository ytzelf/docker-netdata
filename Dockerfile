FROM netdata/netdata
RUN apk --update add --no-cache --virtual smartmontools docker
