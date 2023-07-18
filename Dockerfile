FROM openjdk:11
EXPOSE 8050
ADD target/springboot-sample.jar springboot-sample.jar
ENTRYPOINT ["java","-jar","/springboot-sample.jar"]
