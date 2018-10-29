#!/bin/bash

set -xe

version=`cat version/number`
#echo $version

cat > app-manifest-output/manifest.yml << EOF
name: Spring-Music-CIDemo
memory: 1G
random-route: true
EOF

# path: /tmp/build/put/music-release/spring-music-${version}.war