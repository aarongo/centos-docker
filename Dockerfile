# Frist unzip jdk to This Directory
# No Java
# FROM centos7:7.2.1511
# Java is Exist
FROM registry.cn-qingdao.aliyuncs.com/edward_liu/java:1.8

MAINTAINER edwardliu

LABEL name="CentOS 7.2.1511 Tomcat"
LABEL vendor="Tomcat7"
LABEL license=GPLv2

ADD apache-tomcat-8.0.46.tar.gz /software/tomcat8

#ARG WAE_NAME

RUN rm -rf /software/tomcat8/webapps/*

# ADD ${WAE_NAME:-helloword.war} /software/tomcat7/webapps/
ADD ./helloworld.war /software/tomcat8/webapps/


ENV JAVA_HOME=/software/jdk8
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /software/tomcat8
ENV CATALINA_BASE /software/tomcat8
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin 

EXPOSE 8080

CMD /software/tomcat8/bin/catalina.sh run
