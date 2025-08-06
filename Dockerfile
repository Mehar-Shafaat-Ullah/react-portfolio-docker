# --------------------------
# 1. Build stage
# --------------------------
FROM node:18-alpine AS build

WORKDIR /app

# Copy package.json and lock file first (better caching)
COPY package*.json ./

RUN npm install

# Copy all source code
COPY . .

# Build the React app
RUN npm run build

# --------------------------
# 2. Production stage
# --------------------------
FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy React build output to nginx webroot
COPY --from=build /app/build /usr/share/nginx/html

# Copy custom nginx config (we’ll write next)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
