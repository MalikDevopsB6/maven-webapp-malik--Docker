FROM maven:3.8.6-eclipse-temurin-17 as builder

WORKDIR /app

RUN git clone https://github.com/MalikDevopsB6/maven-webapp-malik--Docker.git

WORKDIR /app/maven-webapp-malik-Docker

RUN mvn clean package -DskipTests

FROM tomcat:9.0-jdk17-temurin

WORKDIR /usr/local/tomcat/webapps

COPY --from=builder /app/maven-webapp-malik--Docker/target/maven-web-application.war /usr/local/tomcat/webapps/maven-web-application.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
