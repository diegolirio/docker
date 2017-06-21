container=vsFenix
app=fenix

if sudo docker ps | awk -v container="container" 'NR>1{  ($(NF) == container )  }'; then
  sudo docker stop "$container" && sudo docker rm -f "$container"
fi

sudo docker run -itd --name $container -p 7003:8080 diegolirio/tomcat-maven:1.0 /bin/bash

url=https://github.com/santaniello/$app.git

sudo docker exec -i $container bash -c "java -version"
sudo docker exec -i $container bash -c "mvn -version"
sudo docker exec -i $container bash -c "cd /root && git clone $url"
sudo docker exec -i $container bash -c "cd /root/$app/src/main/webapp/ && npm install"
sudo docker exec -i $container bash -c "cd /root/$app && mvn package -Dmaven.test.skip=true"
sudo docker exec -i $container bash -c "mv /root/$app/target/pedido.war webapps/"
sudo docker exec -i $container bash -c "bin/catalina.sh start"
