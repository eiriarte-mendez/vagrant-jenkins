#!/bin/sh

if [ -d /opt/box ]; then
    echo ">> flags: initialized"
else
    echo ">> flags: initialize"
    mkdir /opt/box
fi