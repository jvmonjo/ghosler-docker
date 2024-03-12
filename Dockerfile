FROM node:20-alpine3.17

# Create app directory
WORKDIR /ghosler

VOLUME [ "/ghosler" ]

RUN npm i -g ghosler-cli pm2

RUN ghosler install

# Expose port 2369
EXPOSE 2369

RUN ghosler update --name ghosler-app

# Bundle app source
COPY . .

# Run the app
CMD [ "ghosler", "restart --name ghosler-app" ]