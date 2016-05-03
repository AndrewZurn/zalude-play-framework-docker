FROM ingensi/oracle-jdk
MAINTAINER Andrew Zurn <zalude.app@gmail.com>

RUN yum update -y && yum install -y unzip
RUN curl -O http://downloads.typesafe.com/typesafe-activator/1.3.6/typesafe-activator-1.3.6.zip 
RUN unzip typesafe-activator-1.3.6.zip -d / && rm typesafe-activator-1.3.6.zip && chmod a+x /activator-1.3.6/activator
ENV PATH $PATH:/activator-1.3.6

EXPOSE 9000 8080
RUN mkdir /app
WORKDIR /app

CMD ["activator", "run" "-Dconfig.resource=dist"]