FROM ghcr.io/certmichelin/redscan-nuclei-base/redscan-nuclei-base@sha256:d961d3a1e0799e49786a2c46720af92b12e61ba06b5767e768ca50b9a55991e6

#Copy the war.
ARG JAR_FILE=target/app.jar
COPY ${JAR_FILE} app.jar

#Setup the default log4j2.conf.
ARG LOG4J2_FILE=src/main/resources/log4j2-spring.xml
COPY ${LOG4J2_FILE} /conf/log4j2.xml

CMD ["java", "-Dlogging.config=/conf/log4j2.xml","-jar","/app.jar"]
