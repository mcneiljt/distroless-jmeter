FROM alpine
ADD https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.4.1.tgz .
ADD https://www.apache.org/dist/jmeter/binaries/apache-jmeter-5.4.1.tgz.sha512 .
RUN sha512sum -c apache-jmeter-5.4.1.tgz.sha512
RUN tar xf apache-jmeter-5.4.1.tgz

FROM gcr.io/distroless/java:8-debug
COPY --from=0 apache-jmeter-5.4.1/ apache-jmeter-5.4.1/
ENTRYPOINT ["java", "-jar", "apache-jmeter-5.4.1/bin/ApacheJMeter.jar"]
