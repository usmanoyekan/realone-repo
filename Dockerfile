FROM nginx
COPY /SampleWebApp/target/SampleWebApp.war /usr/share/nginx/html
EXPOSE 80
