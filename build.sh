#!/bin/bash
set -e;
set -u;

echo -e '\n\033[1m[Build tf2:blindfrag]\033[0m'
docker build . --pull -f linux.Dockerfile --rm -t lacledeslan/gamesvr-tf2-blindfrag:latest --build-arg BUILDNODE="$(cat /proc/sys/kernel/hostname)";
docker run -it --rm lacledeslan/gamesvr-tf2-blindfrag:latest ./ll-tests/gamesvr-tf2-blindfrag.sh;
docker push lacledeslan/gamesvr-tf2-blindfrag:latest
