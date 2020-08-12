#!/bin/bash

set -x

function errHandle() {
echo ">>${PROGNAME}: " 1>&2
echo ">>ERROR at line $1 error $2"
exit
}
trap 'errHandle ${LINENO} $? ' ERR

repo="brave-dashboard-release"
[ -d "$repo" ] && rm -rf brave-dashboard-release
echo "Cloning dashboard .."
git clone https://github.com/beringresearch/brave-dashboard-release

echo "Building dashboard image .."
brave build
brave images

echo "Deploying dashboard .."
brave deploy
brave units

rm -rf brave-dashboard-release

echo "Dashboard is running on http://[instance_ip]:8088"