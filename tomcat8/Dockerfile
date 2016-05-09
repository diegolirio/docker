# ImageName: tomcat8-mysql | description: debian/tomcat8/git/maven/mysql

#FROM diegolirio/openjdk8:1.0
FROM tomcat:8.0
MAINTAINER Diego Lirio <diegolirio.dl@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl

#RUN apt-get install -y tomcat8
#RUN wget http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-8/v8.0.33/bin/apache-tomcat-8.0.33.tar.gz
#RUN curl -fSL http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-8/v8.0.33/bin/apache-tomcat-8.0.33.tar.gz -O apache-tomcat-8.0.33.tar.gz

# git
RUN apt-get install -y git-core

# Maven
RUN cd /root
RUN curl -fSL http://ftp.unicamp.br/pub/apache/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz -O apache-maven-3.1.1-bin.tar.gz
RUN mv apache-maven-3.1.1-bin.tar.gz /root
RUN tar -xvf apache-maven-3.1.1-bin.tar.gz
ENV M2_HOME /root/apache-maven-3.1.1
ENV PATH $M2_HOME/bin:$PATH

# Mysql
#RUN debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
#RUN debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
#RUN apt-get -y install mysql-server

RUN apt-get clean
