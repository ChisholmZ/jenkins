#!/bin/bash
# copy jenkins_home folder out of pod
#~zach

CON=$(docker ps -aqf "ancestor=jenkins")
docker cp  ./jenkins_home/ $CON:/var/
# docker cp  ./android-sdk_r23-linux.tgz $CON:/var/jenkins_home/
# docker cp /c/Users/SNDRDEV/AppData/Local/Android/Sdk/licenses $CON:/var/jenkins_home/android-sdk-linux/licenses
