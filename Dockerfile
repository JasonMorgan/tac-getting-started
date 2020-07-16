FROM gcr.io/sys-2b0109it/demo/bitnami/git:2-centos-7
WORKDIR /app
RUN git clone https://github.com/spring-projects/spring-petclinic.git 

FROM gcr.io/sys-2b0109it/demo/bitnami/java:14-centos-7
WORKDIR /app
COPY --from=0 /app/spring-petclinic /app 
RUN ./mvnw clean package
CMD ["java","-jar","/app/target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar"] 
