FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y apt-transport-https vim
RUN apt-key adv --fetch-keys https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl

RUN mkdir /var/lib/jenkins && ln -s /usr/bin /var/lib/jenkins/bin

USER jenkins

# COPY jenkins_home/ /var/jenkins_home

expose 50000 80 8080
