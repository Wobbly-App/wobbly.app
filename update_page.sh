#!/bin/bash

set -eu

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

cd /var/wobbly.app
git pull
jekyll build
service nginx reload
