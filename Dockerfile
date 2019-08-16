FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y apt-transport-https vim
RUN apt-key adv --fetch-keys https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl
#maven java_sdk gradel

RUN mkdir /var/lib/jenkins && ln -s /usr/bin /var/lib/jenkins/bin

USER jenkins

# ADD jenkins_home/ /var/jenkins_home
# ADD android-sdk_r23-linux.tgz /var/jenkins_home

# RUN cd /var/jenkins_home && wget http://dl.google.com/android/android-sdk_r23-linux.tgz && tar xzvf android-sdk_r23-linux.tgz
# RUN cd /var/jenkins_home && tar xzvf android-sdk_r23-linux.tgz
ENV ANDROID_HOME /var/jenkins_home/android-sdk-linux
ENV PATH "$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

# RUN wget https://download.oracle.com/otn/java/jdk/8u221-b11/230deb18db3e4014bb8e3e8324f81b43/jdk-8u221-linux-x64.tar.gz

expose 50000 80 8080
