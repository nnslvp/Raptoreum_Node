#!/bin/bash

EXECUTABLE='raptoreumd'
DIR='/raptoreum/.raptoreumcore'
CONF_FILE='raptoreum.conf'
FILE=$DIR/$CONF_FILE

if [ -n "$CONF" ] && [ -e "$FILE" ]; then
  rm $FILE
fi

if [ "$FORCE_BOOTSTRAP" == "true" ] && [ -d $DIR ]; then
    rm -rf $DIR
    bootstrap.sh
fi

# Create directory and config file if it does not exist yet
mkdir -p $DIR
cat <<EOF >$FILE
rpcuser=${RPC_USER}
rpcpassword=${RPC_PASSWORD}
rpcallowip=172.0.0.0/8
rpcbind=0.0.0.0
server=1
listen=1
testnet=${TESTNET}
externalip=${EXTERNALIP}
addnode=lbdn.raptoreum.com
addnode=explorer.raptoreum.com
printtoconsole=1
EOF

# Setup logrotate for debug log
touch /etc/logrotate.d/rtmdebuglog
cat <<EOF >/etc/logrotate.d/rtmdebuglog
/raptoreum/.raptoreumcore/debug.log {
  compress
  copytruncate
  missingok
  daily
  rotate 7
}
EOF

exec $EXECUTABLE -datadir=$DIR -conf=$FILE
