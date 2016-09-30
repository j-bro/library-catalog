FROM tomcat:8-jre8
MAINTAINER Jeremy Brown <jj.brown@hotmail.com>
ADD settings.xml /usr/local/tomcat/conf
ADD tomcat-users.xml /usr/local/tomcat/conf
ADD build/libs/library-catalog.war $CATALINA_HOME/webapps/
