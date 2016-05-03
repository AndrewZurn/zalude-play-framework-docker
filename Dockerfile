FROM ingensi/play-framework
MAINTAINER Andrew Zurn <zalude.app@gmail.com>

EXPOSE 9000 8080

CMD ["activator", "run", "-Dconfig.resource=dist"]
