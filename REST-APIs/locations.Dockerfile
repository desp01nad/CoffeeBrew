# 1. Base image
FROM node:24.21.0-alpine

# 2. Set work directory
WORKDIR /app

# 3. Install the specific stable version of json-server
RUN npm install -g json-server@0.17.4

# 4. Copy your data
COPY ./REST-APIs/locations-json-server.json .

# 5. Expose the port
EXPOSE 3000

# 6. Start the server
CMD ["json-server", "--watch", "locations-json-server.json", "--host", "0.0.0.0", "--port", "3000"]