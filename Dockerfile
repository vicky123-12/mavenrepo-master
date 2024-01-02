FROM tomcat:9
# Download the .war file from Nexus using wget and save as ROOT.war
RUN  wget -O /usr/local/tomcat/webapps/ROOT.war  http://admin:admin@175.41.216.133:8081/repository/snapshoyt/com/jdevs/studentapp/2.5-SNAPSHOT/studentapp-2.5-20240102.050418-1.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
