FROM node:16.17.0-alpine as builder
WORKDIR /app
COPY package.json ./
COPY yarn.lock ./
RUN yarn install
COPY ..
ARG TMDB_V3_API_KEY
ENV VITE_APP_TMDB_V3_API_KEY=${TMDB_V3_API_KEY}
ENV VITE_APP_API_ENDPOINT_URL="https://api.themoviedb.org/3"
RUN yarn build

FROM nginx:stable-alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /app/dist .
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]

#API Key = 29e2ed70682113dffcc1d526a820eac4
#docker build --build-arg TMDB_V3_API_KEY=29e2ed70682113dffcc1d526a820eac4 -t netflix .
# docker run -d --name netflix -p 8081:80 netflix:latest
#29e2ed70682113dffcc1d526a820eac4
