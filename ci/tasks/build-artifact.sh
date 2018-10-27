#!/usr/bin/env bash
set -e

version=`cat version/number`
#echo $version

cd git-repo
export TERM=${TERM:-dumb} && ./gradlew assemble -PVersion=$version
#ls build/libs/
mv build/libs/spring-music-*.war ../build/