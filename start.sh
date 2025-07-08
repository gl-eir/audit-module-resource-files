#!/bin/bash
source ~/.bash_profile
VAR=""
build_path="/u01/eirapp/audit"
build="eir-audit.jar"
cd $build_path
status=`ps -ef | grep $build | grep java`

if [ "$status" == "$VAR" ]
then
 echo "Starting Process"
java -Dlog4j.configurationFile=file:./log4j2.xml -Dspring.config.location=file:/u01/eirapp/configuration/configuration.properties,file:./application.properties -jar $build $1 1>${DATA_HOME}/logs/audit/log.txt 2>${DATA_HOME}/logs/audit/error.txt &
else
 echo "Process already Running"
fi

