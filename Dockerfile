FROM tomcat:8.5.37-jre8
MAINTAINER maha@gmail.com
RUN apt-get update
ADD https://s3.amazonaws.com/maha4iac/mahaLogin.war /usr/local/tomcat/webapps/
WORKDIR /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
