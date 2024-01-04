FROM tomcat:9
# Download the .war file from Nexus using wget and save as ROOT.war
RUN  wget -O /usr/local/tomcat/webapps/ROOT.war  http://admin:admin@3.89.155.214:8081/repository/snapshot/com/jdevs/studentapp/2.5-SNAPSHOT/studentapp-2.5-20240104.052243-1.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
