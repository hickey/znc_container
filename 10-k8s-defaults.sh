# Check for a k8s ConfigMap at /znc-defaults and use
# config and cert files there to initialize $DATADIR

if [ -d "/znc-defaults" ]; then
    [ ! -d "${DATADIR}/configs" ] && mkdir -p "${DATADIR}/configs"

    # Override any existing files with the defaults if override is declared
    if [ -f "/znc-defaults/override" ]; then
        # it is quite possible that /znc-defaults only has the config
        # or the cert. So we can remove both without checking for the
        # replacement in /znc-defaults
        if [ -f "/znc-defaults/znc.conf" ]; then
            rm ${DATADIR}/configs/znc.conf
        fi

        if [ -f "/znc-defaults/znc.pem" ]; then
            rm ${DATADIR}/znc.pem
        fi
    fi

    # if no config then copy it from the ConfigMap
    if [ ! -f "${DATADIR}/configs/znc.conf" -a -f "/znc-defaults/znc.conf" ]; then
        cp /znc-defaults/znc.conf ${DATADIR}/configs
    fi

    # if no cert then copy it from the ConfigMap
    if [ ! -f "${DATADIR}/znc.pem" -a -f "/znc-defaults/znc.pem" ]; then
        cp /znc-defaults/znc.pem ${DATADIR}
    fi
fi
