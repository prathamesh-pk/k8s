FROM maven:3-jdk-8 as maven
LABEL author='tgr'
LABEL purpose='practice'
RUN git clone https://github.com/openmrs/openmrs-core.git && cd openmrs-core && mvn clean package
 
FROM tomcat:8
LABEL author='tgr'
LABEL purpose='practice'
COPY --from=maven /openmrs-core/webapp/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
