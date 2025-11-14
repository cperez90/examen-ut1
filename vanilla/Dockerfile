FROM node:20.19
LABEL authors="riku"

RUN apt update
COPY ./vanilla/template-ssr-vanilla/package.json .
WORKDIR /app
RUN npm install