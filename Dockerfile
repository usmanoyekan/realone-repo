FROM tomcat:9
WORKDIR webapps
COPY ./target/SampleWebApp.war /usr/local/tomcat/webapps
RUN cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
EXPOSE 8080
