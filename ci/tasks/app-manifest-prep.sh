#!/bin/bash

set -xe

version=`cat version/number`
#echo $version

cat > app-manifest-output/manifest.yml << EOF
applications:
- name: Spring-Music-CIDemo
  memory: 1G
  random-route: true
  buildpacks:
  - java_buildpack
EOF

# path: /tmp/build/put/music-release/spring-music-${version}.war