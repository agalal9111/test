## download node image
FROM  node:latest
## install latest version of cli
RUN   npm install -g @angular/cli@latest
ENV CHROME_BIN="/usr/bin/google-chrome"
