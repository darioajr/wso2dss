#
# WSO2 DSS 3.2.2
#
FROM java:7
MAINTAINER Dario Alves Junior, darioajr@gmail.com

RUN wget -P /opt http://dist.wso2.org/maven2/org/wso2/dss/wso2dss/3.2.2/wso2dss-3.2.2.zip && \
    apt-get update && \ 
    apt-get install -y zip && \
    apt-get clean && \
    unzip /opt/wso2dss-3.2.2.zip -d /opt && \
    rm /opt/wso2dss-3.2.2.zip && \
    wget -P /opt http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.30.tar.gz && \
    tar -xvzf /opt/mysql-connector-java-5.1.30.tar.gz && \
    mv /opt/mysql-connector-java-5.1.30/mysql-connector-java-5.1.30-bin.jar /opt/wso2dss-3.2.2/lib/mysql-connector-java-5.1.30-bin.jar && \
    rm /opt/mysql-connector-java-5.1.30 && \
    rm /opt/mysql-connector-java-5.1.30.tar.gz && \
    wget -P /opt/ http://www.java2s.com/Code/JarDownload/ojdbc6/ojdbc6.jar.zip && \
    unzip /opt/ojdbc6.jar.zip -d /opt && \
    mv /opt/ojdbc6.jar /opt/wso2dss-3.2.2/lib/ojdbc6.jar && \
    rm -f /opt/ojdbc6.jar.zip
    
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
EXPOSE 9443
CMD ["/opt/wso2dss-3.2.2/bin/wso2server.sh"]