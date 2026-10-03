FROM node:22-alpine
RUN apk add --no-cache unzip
WORKDIR /app
COPY nishtari-sawa-project-v7.zip.b64 /tmp/nishtari-sawa-project-v7.zip.b64
RUN base64 -d /tmp/nishtari-sawa-project-v7.zip.b64 > /tmp/nishtari-sawa-project-v7.zip && unzip -q /tmp/nishtari-sawa-project-v7.zip -d /tmp/source && cp -R /tmp/source/nishtari-sawa-project/server/. /app/ && npm install --omit=dev --no-audit --no-fund && rm -rf /tmp/source /tmp/nishtari-sawa-project-v7.zip /tmp/nishtari-sawa-project-v7.zip.b64
ENV PORT=3000
EXPOSE 3000
CMD ["npm", "start"]
