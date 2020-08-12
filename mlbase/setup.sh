#!/bin/bash

set -x

function errHandle() {
echo ">>${PROGNAME}: " 1>&2
echo ">>ERROR at line $1 error $2"
exit
}
trap 'errHandle ${LINENO} $? ' ERR

echo "Building Jupyter Notebooks image .."
brave build
brave images

echo "Deploying Jupyter Notebooks .."
brave deploy
brave units

echo "Jupyter Notebooks are running on http://[instance_ip]:8888"