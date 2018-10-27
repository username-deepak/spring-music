#!/usr/bin/env bash
set -e

cd repo
./gradlew -v
./gradlew test
