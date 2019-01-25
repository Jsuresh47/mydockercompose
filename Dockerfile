FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget

Run groupadd tomcat
Run useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
Run cd /tmp
Run wget http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.37/bin/apache-tomcat-8.5.37.tar.gz
Run mkdir /opt/tomcat
Run tar xzvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1
Run cd /opt/tomcat
Run chgrp -R tomcat /opt/tomcat
Run chmod -R g+r /opt/tomcat/conf
Run chmod g+x /opt/tomcat/conf
Run chown -R tomcat /opt/tomcat/webapps /opt/tomcat/work /opt/tomcat/temp opt/tomcat/logs

Run cd /opt/tomcat/bin

Expose 8080
CMD /opt/tomcat/bin/catalina.sh run && tail -f /opt/tomcat/logs/catalina.out
