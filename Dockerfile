## download node image
FROM  node:latest
## install latest version of cli
RUN   npm install -g @angular/cli@latest && yum -y install httpd
