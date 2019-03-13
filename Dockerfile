FROM node:latest

WORKDIR /usr/src/app

# Install dependencies
COPY app/package*.json /usr/src/app/
RUN npm install
RUN npm install -g react-native-cli
RUN npm install -g expo-cli

# Tell packager that expo is ready on the hosts IP
ENV HOST_IP ip -4 route get 8.8.8.8 | awk {'print $7'} | tr -d '\n'
ENV REACT_NATIVE_PACKAGER_HOSTNAME=${HOST_IP}

EXPOSE 19000
EXPOSE 19001
EXPOSE 19002

ENV EXPO_DEBUG=true

CMD [ "npm", "start" ]
