FROM agiletrailblazers/tomcat:latest
LABEL maintainer="Pranay Prathipati"

# ADD settings.xml /usr/local/tomcat/conf
# ADD tomcat-users.xml /usr/local/tomcat/conf/

ADD target/calculator.war /usr/local/tomcat/webapps/calculator.war

CMD ["catalina.sh", "run"]