FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install maven -y
RUN apt-get install tomcat -y
RUN apt-get install git -y
WORKDIR /tmp/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /tmp/boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR /tpm/boxfuse-sample-java-war-hello/target
RUN cp hello-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8080:80