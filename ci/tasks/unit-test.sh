#!/usr/bin/env bash
set -e

cd git-repo
export TERM=${TERM:-dumb} && ./gradlew clean test