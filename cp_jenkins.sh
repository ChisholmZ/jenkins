#!/bin/bash
# copy jenkins_home folder out of pod
#~zach

CON=$(docker ps -aqf "ancestor=jenkins")
docker cp $CON:/var/jenkins_home ./
