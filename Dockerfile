FROM node:latest

ARG   DIR="/usr/src/app"
RUN   npm install -g @angular/cli@latest
RUN   apt-get update
RUN   apt-get install sudo
RUN   wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN   sudo apt install ./google-chrome-stable_current_amd64.deb -y

ENV CHROME_BIN="/usr/bin/google-chrome"

WORKDIR $DIR
