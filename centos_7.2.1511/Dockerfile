FROM scratch
ADD centos-7.2.1511-docker.tar.xz /

LABEL name="CentOS Base Image"
LABEL vendor="CentOS"
LABEL license=GPLv2

# Volumes for systemd
# VOLUME ["/run", "/tmp"]

# Environment for systemd
# ENV container=docker

# Create directory
RUN mkdir /software

# For systemd usage this changes to /usr/sbin/init
# Keeping it as /bin/bash for compatability with previous
CMD ["/bin/bash"]
