FROM ubuntu:20.04
RUN apt update
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install tomcat9 -y
RUN apt install git -y
RUN mkdir /home/app
WORKDIR /home/app
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd ./boxfuse-sample-java-war-hello && mvn package
RUN cp ./boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/ROOT.war
#RUN export JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
#RUN export CATALINA_BASE=/usr/share/tomcat9/
#RUN export CATALINA_HOME=/usr/share/tomcat9/
RUN mkdir /usr/share/tomcat9/temp
RUN cp -r /usr/share/tomcat9/etc/ /usr/share/tomcat9/conf/
EXPOSE 8080
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]