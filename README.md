# Skill-project
Uni project

## Back-end:
- what technologies 
how to run
how to build 
what not to change 
and how to put it on server 

### Technologies used:

* Embedded Apache Tomcat 8.x
* REST
* Spring Boot 1.5x
* H2 Database
* JPA + Hibernate

### How to build

Run

`mvn clean install`

### How to run

In the project root directory run:

`java -jar target/web-1.0-SNAPSHOT.war`

or alternatively you may run

`mvn spring-boot:run`

### How to put it on server

Simply copy `web-1.0-SNAPSHOT.war` to any directory of interest on the server and run `java -jar web-1.0-SNAPSHOT.war`, that should start the server.

## Frontend

* Front-end: Java Script + BootStrap https://getbootstrap.com for css
* TimeLine https://timeline.knightlab.com, web/src/main/webapp/WEB-INF/jsp/timeline.jsp, data from people.json
* For creating small graphs\nodes http://graphalchemist.github.io/Alchemy/#/ (Have to be rework, as now all nodes 
and connections are made manually. Should be done in authomatic way)
* math-achieves-viewer-src/utils/src/main/java/com/github/juls/av/utils/CsvToJson.java
   math-achieves-viewer-src/utils/src/main/java/com/github/juls/av/utils/CsvToSql.java
   to convert data, json for timeline.jsp, sql for view.jsp
