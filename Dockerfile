FROM znc:1.6.5
MAINTAINER "Gerard Hickey <hickey@kinetic-compute.com>"

ADD default-znc.conf /opt/znc/share/
ADD 10-makeconf.sh /startup-sequence/
