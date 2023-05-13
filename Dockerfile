# Use the official Nginx image as the base image
FROM nginx:latest

# Remove the default webapps that come with Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copy the .war file into the Nginx deployment directory
COPY /SampleWebApp/target/SampleWebApp.war /usr/share/nginx/html/ROOT.war

# Expose port 8080 (the default Nginx port)
EXPOSE 80

# set the default application that will start when the container start
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
