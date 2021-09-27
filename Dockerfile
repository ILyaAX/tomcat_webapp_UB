FROM ubuntu:20.04
RUN apt update
RUN apt install tomcat9 -y
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install git -y
RUN mkdir /home/app
WORKDIR /home/app
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd ./boxfuse-sample-java-war-hello && mvn package
RUN cp ./boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/hello-1.0.war
EXPOSE 8080
CMD ["catalina.sh", "run"]