from debian:stable-slim

RUN npm install -g sonos-web-cli
RUN sonos-web install

EXPOSE 5050

HEALTHCHECK --interval=1m --timeout=2s CMD curl -LSs http://localhost:5050 || exit 1

CMD cd /root/.sonos-web && node src/server.js
