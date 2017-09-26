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

Kubernetes ConfigMap Support
----------------------------
The initial configuration of the container can now be done with a
Kubernetes ConfigMap. The ConfigMap should be mounted to /znc-defaults.

The ConfigMap can be generated with the following command

    kubectl create configmap znc-defaults znc.conf --from-file=znc.conf znc.pem --from-file=znc.pem

When the ZNC container is started, it will check for a znc.conf and a
znc.pem files in their normal locations. If one or both are not found,
then the missing files will be copied from the ConfigMap and placed in
the proper locations. This allows a new instance of ZNC to be pre-
configured under Kubernetes.

At the next restart of the Pod the default files from the ConfigMap
will be ignored (unless EmptyDir is used for the /znc-data directory)
due to the configuration and cert already existing. If it is desired
to reset the configuraiton or cert on each restart of the Pod, then
setting the "override" key in the ConfigMap to any value will cause
the default files to be moved in to place during a restart. Even if
the configuraiton and cert already exist.
