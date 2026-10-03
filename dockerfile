FROM node:22-alpine
RUN apk add --no-cache unzip
WORKDIR /app
COPY nishtari-sawa-project-v2.zip /tmp/nishtari-sawa-project.zip
RUN unzip -q /tmp/nishtari-sawa-project.zip -d /tmp/source \
    && cp -R /tmp/source/nishtari-sawa-project/server/. /app/ \
    && npm install --omit=dev \
    && node -e 'const fs=require("node:fs");const p="src/server.mjs";const s=fs.readFileSync(p,"utf8");const marker="app.get(\"/health\", async";const route="app.get(\"/\", async (_request, reply) => reply.send({ service: \"Nishtari Sawa API\", status: \"ok\", health: \"/health\", nearbyDeals: \"/api/v1/deals/nearby?lat=30.0444&lng=31.2357&radius_km=2\" }))\n\n";if(!s.includes(marker))throw Error("health route anchor missing");fs.writeFileSync(p,s.replace(marker,route+marker))'
ENV PORT=3000
EXPOSE 3000
CMD ["npm", "start"]
