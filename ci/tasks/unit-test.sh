#!/usr/bin/env bash
set -e

cd git-repo
./gradlew -v
./gradlew test
