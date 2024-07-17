#!/bin/bash

DIR='/raptoreum/.raptoreumcore'
BOOTSTRAP_TAR='https://bootstrap.raptoreum.com/bootstraps/bootstrap.tar.xz'
POWCACHE='https://bootstrap.raptoreum.com/powcaches/powcache.dat'

if [ ! -d $DIR ]; then
  mkdir -p $DIR
  curl -L $BOOTSTRAP_TAR | tar xJ -C $DIR
  curl -L $POWCACHE >$DIR//powcache.dat
else
  echo "Datadir has been detected so bootstrap will not be used..."
fi
