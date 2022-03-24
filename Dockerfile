FROM openjdk:8-jdk-alpine
COPY ./classes/ /tmp/classes/
COPY ./source/ /tmp/source/
RUN javac -d /tmp/classes/ /tmp/source/HTTPServer.java && \
	cd /tmp/classes/ && \
	jar cvfm HTTPServer.jar manifest.txt *.class
WORKDIR /
Run cp /tmp/classes/HTTPServer.jar /HTTPServer.jar
ENTRYPOINT ["java", "-Xmx256m", "-jar", "./HTTPServer.jar"]
EXPOSE 8000