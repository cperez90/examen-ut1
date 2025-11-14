FROM debian:stable-slim
LABEL authors="riku"
RUN apt update
RUN apt install -y ffmpeg
RUN apt install -y imagemagick
COPY ./optimizator/optimize.sh /usr/local/bin/optimize.sh
RUN chmod +x /usr/local/bin/optimize.sh
WORKDIR /app