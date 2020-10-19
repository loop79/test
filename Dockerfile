FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift

USER root
RUN echo "original date `date`" && ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime && echo "Europe/Berlin" > /etc/timezone  && echo "new date `date`"
ENV TZ=Europe/Berlin
USER jboss

COPY target/*.jar /app.jar

ENTRYPOINT ["sh", "-c", "java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=1 ${JAVA_OPTS} ${JAVA_PROXY_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /app.jar "]

EXPOSE 8080
