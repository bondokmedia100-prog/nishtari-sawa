FROM node:22-alpine
RUN apk add --no-cache unzip
WORKDIR /app
COPY nishtari-sawa-project-v15.zip /tmp/nishtari-sawa-project-v15.zip
RUN unzip -q /tmp/nishtari-sawa-project-v15.zip -d /tmp/source \
    && cp -R /tmp/source/nishtari-sawa-project/server/. /app/ \
    && npm install --omit=dev --no-audit --no-fund \
    && rm -rf /tmp/source /tmp/nishtari-sawa-project-v15.zip
ENV PORT=3000
EXPOSE 3000
CMD ["npm", "start"]
