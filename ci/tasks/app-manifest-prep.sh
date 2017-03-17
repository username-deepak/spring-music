#!/bin/bash

set -xe
Version=`cat version/number`


echo -e "applications: \n- name: Spring-Music-CIDemo \n  memory: 512M \n  host: VZW-Spring-Music-CICD-Demo \n  path: /tmp/build/put/music-release/spring-music-$Version.war" > app-manifest-output/manifest.yml
