FROM gradle:4.10.1-jdk8 as builder

COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN rm -rf /home/gradle/src/build \
 && gradle build

FROM jetty:9.4-jre8
EXPOSE 8080
COPY --from=builder /home/gradle/src/build/libs/graddle-demo-webapp.war /var/lib/jetty/webapps/app.war