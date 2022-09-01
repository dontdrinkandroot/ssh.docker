#!/bin/sh
if [ -z "$PRIVATE_KEY" ]; then
  echo "Container failed to start, please pass -e PRIVATE_KEY=sometest"
  exit 1
fi
if [ -z "$KNOWN_HOSTS" ]; then
  echo "Container failed to start, please pass -e KNOWN_HOSTS=sometest"
  exit 1
fi

eval $(ssh-agent -s)
echo "$PRIVATE_KEY" | tr -d '\r' | ssh-add -
echo "$KNOWN_HOSTS" >> ~/.ssh/known_hosts

/bin/sh
