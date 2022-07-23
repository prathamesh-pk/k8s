FROM maven:3.8-jdk-11
LABEL author="project"
LABEL  author="openmrs"
RUN https://github.com/openmrs/openmrs-core.git && cd openmrs-core && mvn package
WORKDIR openmrs/webapp
EXPOSE 8080
CMD [ "mvn", "jetty:run"]
