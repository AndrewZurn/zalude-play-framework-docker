FROM ingensi/oracle-jdk
MAINTAINER Andrew Zurn <zalude.app@gmail.com>

RUN yum update -y && yum install unzip
RUN curl -O https://dl.bintray.com/sbt/native-packages/sbt/0.13.11/sbt-0.13.11.zip
RUN unzip sbt-0.13.11.zip -d / && rm sbt-0.13.11.zip && chmod a+x /sbt-0.13.11/sbt
ENV PATH $PATH:/sbt-0.13.11

EXPOSE 9000 8080
RUN mkdir /app
WORKDIR /app

CMD ["sbt", "-Dconfig.resource=application.dist.conf", "run"]
