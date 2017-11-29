# Frist unzip jdk to This Directory
# No Java
# FROM centos7:7.2.1511
# Java is Exist
FROM registry.cn-hangzhou.aliyuncs.com/edward_liu/registry:1.7.0_79

MAINTAINER edwardliu

LABEL name="CentOS 7.2.1511 Tomcat"
LABEL vendor="Tomcat7"
LABEL license=GPLv2

# ADD jdk1.7.0_79 /software/jdk7
ADD apache-tomcat-7.0.82 /software/tomcat7

#ARG WAE_NAME

RUN rm -rf /software/tomcat7/webapps/*

# ADD ${WAE_NAME:-helloword.war} /software/tomcat7/webapps/
ADD helloword.war /software/tomcat7/webapps/


ENV JAVA_HOME=/software/jdk7
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /software/tomcat7
ENV CATALINA_BASE /software/tomcat7
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin 

EXPOSE 8080

CMD /software/tomcat7/bin/catalina.sh run
