FROM ubuntu:15.10
MAINTAINER Diego Lirio <diegolirio.dl@gmail.com>
RUN apt-get update && apt-get -y upgrade 

# Install java 8
RUN apt-get install -y openjdk-8-jdk

# add var JAVA_HOME in bash.bashrc
#RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /etc/bash.bashrc
#RUN echo "export PATH=/usr/lib/jvm/java-8-openjdk-amd64/bin:$PATH" >> /etc/bash.bashrc
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

RUN apt-get clean
