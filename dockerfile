FROM tomcat
RUN cd webapps.dist && cp -R * ../webapps/
RUN apt-get update -y && apt-get install vim -y
RUN cd /usr/local/tomcat && rm -f conf/tomcat-users.xml
COPY tomcat-users.xml /usr/local/tomcat/conf/
RUN cd /usr/local/tomcat && rm -f webapps/manager/META-INF/context.xml
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
COPY wwp-1.0.0.war /usr/local/tomcat/webapps/
