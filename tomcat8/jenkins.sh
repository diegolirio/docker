container=vsPO
app=purchase-order

if sudo docker ps | awk -v container="container" 'NR>1{  ($(NF) == container )  }'; then
  sudo docker stop "$container" && sudo docker rm -f "$container"
fi

sudo docker run -itd --name $container -p 9001:8080 diegolirio/tomcat8:1.0 /bin/bash

url=https://github.com/diegolirio/$app.git

sudo docker exec -i $container bash -c "java -version"
sudo docker exec -i $container bash -c "maven -version"

sudo docker exec -i $container bash -c "cd /root && git clone $url"
#sudo docker exec -i $container bash -c "cd /root/$app && mvn package"


#sudo docker exec -i $container bash -c "bin/catalina.sh start"
