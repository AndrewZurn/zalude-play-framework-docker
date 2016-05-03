FROM centos:centos7
MAINTAINER Andrew Zurn <zalude.app@gmail.com>

RUN yum update
RUN yum install wget && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u11-b12/jdk-8u11-linux-x64.rpm
RUN rpm -ivh jdk-8u11-linux-x64.rpm && rm jdk-8u11-linux-x64.rpm

RUN yum update
RUN yum install unzip
RUN curl -O https://dl.bintray.com/sbt/native-packages/sbt/0.13.11/sbt-0.13.11.zip
RUN unzip sbt-0.13.11.zip -d / && rm sbt-0.13.11.zip && chmod a+x /sbt-0.13.11/sbt
ENV PATH $PATH:/sbt-0.13.11

EXPOSE 9000 8080
RUN mkdir /app
WORKDIR /app

CMD ["sbt", "-Dconfig.resource=application.dist.conf", "run"]
