#!/bin/bash

if ["$1" = "" ]; then
   echo "Param name CONTAINER required"
   exit 1
fi

if [ "$2" = "" ]; then
    echo "Param name APP required"
    exit 1
fi

if [ "$3" = "" ]; then
    echo "Param name PORT required"
    exit 1
fi

container=$1
app=$2
port=$3

echo 123456 | sudo -S docker -v

if sudo docker ps | awk -v container="container" 'NR>1{  ($(NF) == container )  }'; then
  echo "Stop and destroy $container"
  sudo docker stop "$container" && sudo docker rm -f "$container"
fi

echo "Creating $container"
sudo docker run -itd --name $container -p $port:8080 diegolirio/tomcat-maven:1.0 /bin/bash

url=https://github.com/diegolirio/$app.git

#original_string='i love Suzi and Marry'
#string_to_replace_Suzi_with=Sara
#app_deploy="${original_string/Suzi/$string_to_replace_Suzi_with}"
#app_deploy="${$app/$app/ci-jenkins-}"
app_deploy="cijenkinsdocker"

sudo docker exec -i $container bash -c "java -version"
sudo docker exec -i $container bash -c "mvn -version"
sudo docker exec -i $container bash -c "cd /root && git clone $url"
sudo docker exec -i $container bash -c "cd /root/$app && mvn package -Dmaven.test.skip=true"
sudo docker exec -i $container bash -c "mv /root/$app/target/$app_deploy.war webapps/"
sudo docker exec -i $container bash -c "bin/catalina.sh start"


