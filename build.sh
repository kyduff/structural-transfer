#!/bin/bash

docker build \
  --build-arg UID=$(id -u) \
  --build-arg GID=$(id -g) \
  --build-arg UNAME=$(id -nu) \
  --build-arg WANDB_API_KEY=$WANDB_API_KEY \
  -t kyduff:openNMT .