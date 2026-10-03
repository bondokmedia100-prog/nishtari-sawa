FROM node:22-alpine
RUN apk add --no-cache unzip
WORKDIR /app
COPY nishtari-sawa-project-v5.zip /tmp/nishtari-sawa-project-v5.zip
RUN unzip -q /tmp/nishtari-sawa-project-v5.zip -d /tmp/source && cp -R /tmp/source/nishtari-sawa-project/server/. /app/ && npm install --omit=dev --no-audit --no-fund
ENV PORT=3000
EXPOSE 3000
CMD ["npm", "start"]
