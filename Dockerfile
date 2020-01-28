FROM phusion/baseimage:0.11

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update \
    && apt-get --assume-yes install libipmimonitoring-dev wget \
    && wget https://my-netdata.io/kickstart.sh \
    && chmod u+x kickstart.sh \
    && ./kickstart.sh --dont-wait --disable-telemetry --no-updates

ADD run.sh /etc/my_init.d/
RUN chmod +x /etc/my_init.d/run.sh

# Clean up APT when done.
RUN apt-get --assume-yes purge wget && apt-get --assume-yes autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
