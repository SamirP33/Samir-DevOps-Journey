#!/bin/bash

APPNAME="Docker"

if pgrep -x "$APPNAME" > /dev/null
then

    echo "$APPNAME is RUNNING"

else
    echo "$APPNAME is NOT RUNNING"
fi

