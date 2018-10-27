#!/usr/bin/env bash
set -e

version=`cat version/number`

cd git-repo
#echo $version
export TERM=${TERM:-dumb} && ./gradlew assemble -PVersion=$version
mv build/libs/spring-music-*.war ../build/
#ls build/libs/