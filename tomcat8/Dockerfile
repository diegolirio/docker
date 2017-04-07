# ImageName: tomcat8-mysql | description: debian/tomcat8/git/maven/mysql

#FROM diegolirio/openjdk8:1.0
FROM tomcat:8.0
MAINTAINER Diego Lirio <diegolirio.dl@gmail.com>

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl
RUN apt-get install -y git-core

ENV M2_HOME /root/maven
WORKDIR $M2_HOME
RUN "pwd"
# Maven
RUN curl -fSL "http://ftp.unicamp.br/pub/apache/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz"  -o apache-maven-3.1.1-bin.tar.gz
RUN tar -xvf apache-maven-3.1.1-bin.tar.gz -C /root/maven --strip-components=1
RUN rm apache-maven-3.1.1-bin.tar.gz

# Mysql
#RUN debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
#RUN debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
#RUN apt-get -y install mysql-server

ENV PATH $M2_HOME/bin:$PATH

RUN apt-get clean

WORKDIR $CATALINA_HOME

