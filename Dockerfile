# Specify the image we want to build from.
# Check out the Docker Hub for additional information and to browse the list of available images:
# https://hub.docker.com/

# Using an appropriate base image (carbon for dev, alpine for production)
FROM node:10.15

# Set up entrypoint
ENTRYPOINT ["sh", "/server/docker-entrypoint.sh"]
EXPOSE 8080

# Create app directory
WORKDIR /server

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
# Copy the current directory contents into the container at /boilerplate-back-end-webdo
COPY . /server

RUN chmod +x docker-entrypoint.sh
