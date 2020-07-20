FROM gcr.io/sys-2b0109it/demo/bitnami/git:2-centos-7
WORKDIR /app
RUN git clone https://github.com/spring-projects/spring-petclinic.git 

FROM gcr.io/sys-2b0109it/demo/bitnami/java:14-centos-7
WORKDIR /app
COPY --from=0 /app/spring-petclinic /app 
COPY application-mysql.properties /app/spring-petclinic/src/main/resources/application-mysql.properties
RUN ./mvnw clean package && mv /app/target/spring-petclinic-*.jar /app/target/spring-petclinic.jar
CMD ["java","-jar","/app/target/spring-petclinic.jar"]
