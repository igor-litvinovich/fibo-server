# Using an appropriate base image
FROM node:10.15

#The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime.
EXPOSE 8080

# Create app directory
WORKDIR /server

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# Copy the current directory contents into the container at /server
COPY . /server

RUN chmod +x docker-entrypoint.sh

CMD ["sh", "/server/docker-entrypoint.sh"]
