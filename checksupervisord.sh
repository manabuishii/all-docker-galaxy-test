#!/bin/bash
for VERSION in dev latest 15.03 15.05 15.07 15.10 16.01 16.04 16.07 16.10 17.01
do
  echo 
  echo "Version[${VERSION}]"
  docker run -d --name g${VERSION} bgruening/galaxy-stable:${VERSION}
  sleep 60
  docker exec g${VERSION} supervisorctl status
  docker stop g${VERSION}
  docker rm g${VERSION}
done

