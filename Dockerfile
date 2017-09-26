FROM znc:1.6.5
MAINTAINER "Gerard Hickey <hickey@kinetic-compute.com>"

ADD default-znc.conf /opt/znc/share/
ADD 20-makeconf.sh /startup-sequence/
ADD 10-k8s-defaults.sh /startup-sequence/

