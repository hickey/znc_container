# If no znc configuraiton can be found (i.e. brand new container) then
# copy in the default configuration and generate a certificate

if [ ! -f "$DATADIR/configs/znc.conf" ]; then
    [ ! -d "$DATADIR/configs" ] && mkdir -p "$DATADIR/configs"

    cp /opt/znc/share/default-znc.conf "$DATADIR/configs/znc.conf"

    /opt/znc/bin/znc --allow-root --makepem --datadir "$DATADIR"
fi
