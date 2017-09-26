znc Container
=============
Branch of the official ZNC container that supplies a default znc.conf
and certificate.

The rational for this branch is for environments that access to a
mounted volume is difficult before the container is started
(i.e. Kubernetes). 

Differences from official ZNC container
---------------------------------------
This container operates exactly like the official ZNC container
(https://hub.docker.com/_/znc/) with the exception that if a configuration
file is not found, a default file will be installed with the following
settings:

    Port: 6697 (IRC) / 443 (HTTPS)
    User: admin
    Pass: admin
    IPv4: true
    IPv6: false
    SSL:  true (self signed cert)

Webadmin is enabled to allow further configurations.
