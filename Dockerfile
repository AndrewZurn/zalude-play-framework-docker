FROM webdizz/centos-java8
MAINTAINER Andrew Zurn <zalude.app@gmail.com>

RUN yum update -y
RUN yum install -y unzip
RUN yum install -y wget
RUN wget https://dl.bintray.com/sbt/native-packages/sbt/0.13.11/sbt-0.13.11.zip
RUN unzip sbt-0.13.11.zip -d / && rm sbt-0.13.11.zip && chmod a+x /sbt
ENV PATH $PATH:/sbt/bin

EXPOSE 9000 8080
RUN mkdir /app
WORKDIR /app

CMD ["sbt", "run"]
