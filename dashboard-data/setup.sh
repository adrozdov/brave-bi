#!/bin/bash

set -x

function errHandle() {
echo ">>${PROGNAME}: " 1>&2
echo ">>ERROR at line $1 error $2"
exit
}
trap 'errHandle ${LINENO} $? ' ERR

echo "Building database image .."
brave build
brave images

echo "Deploying database .."
brave deploy
brave units