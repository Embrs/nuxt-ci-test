FROM node:22.14-alpine as builder
LABEL stage=builder

# Create app directory

WORKDIR /app
COPY . /app/
# COPY package*.json /app/ 
RUN NODE_OPTIONS="--max-old-space-size=8192"
RUN npm cache clean --force
RUN npm i
RUN npm run build

FROM node:22.14-alpine
WORKDIR /app
COPY --from=builder /app/.output .
# COPY --from=builder /app/version.ts .


ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

# 暴露的連接埠
EXPOSE 3000

# 啟動應用程式
CMD ["node", "server/index.mjs"]