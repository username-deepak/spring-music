#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
version=`cat version/number`
cd music-repo
#echo $version
gradle assemble -PVersion=$version
mv build/libs/spring-music-*.war ../build/
#ls build/libs/
