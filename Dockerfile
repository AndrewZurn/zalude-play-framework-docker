FROM openjdk:8u111-jre
MAINTAINER Andrew Zurn <zalude.app@gmail.com>

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
		wget \
		unzip
RUN wget https://dl.bintray.com/sbt/native-packages/sbt/0.13.11/sbt-0.13.11.zip
RUN unzip sbt-0.13.11.zip -d / && rm sbt-0.13.11.zip && chmod a+x /sbt
ENV PATH $PATH:/sbt/bin

EXPOSE 9000 8080
RUN mkdir /app
WORKDIR /app

CMD ["sbt", "run"]
