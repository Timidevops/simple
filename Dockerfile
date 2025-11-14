# Build a Tomcat image that deploys this WAR as ROOT
FROM tomcat:9.0.74-jdk17

# Clean default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy compiled WAR at runtime (expect target/devops-userportal.war after mvn package)
COPY target/devops-userportal.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

# Healthcheck (optional)
HEALTHCHECK --interval=30s --timeout=3s CMD curl -fsS http://localhost:8080/ || exit 1
