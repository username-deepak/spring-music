#!/usr/bin/env bash
set -e

get_code="curl -I $MUSIC_URL 2>/dev/null | head -n 1 | cut -d$' ' -f2"
status_code=`eval $get_code`
echo "Making Curl request to $MUSIC_URL"
if [ "$status_code" != "200" ]
then
  echo "Expect status code from $MUSIC_URL as 200, but got $status_code"
  exit 1
fi
echo "$MUSIC_URL Reteruned a 200 response"
