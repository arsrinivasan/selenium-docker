FROM openjdk:8u191-jre-alpine3.8

#Workspace
WORKDIR /usr/share/udemy

#Add .jar under target into this image
ADD target/selenium-docker.jar             	selenium-docker.jar
ADD target/selenium-docker-tests.jar        selenium-docker-tests.jar
ADD target/libs                             libs

#Add suite files
ADD BookFlight-module.xml                   BookFlight-module.xml
ADD search-module.xml                       search-module.xml

ENTRYPOINT java -cp "selenium-docker.jar:selenium-docker-tests.jar:libs/*" -DBROWSER=$BROWSER -DHUB_HOST=$HUB_HOST org.testng.TestNG $MODULE