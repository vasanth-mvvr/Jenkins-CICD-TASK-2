FROM node:20-alpine
EXPOSE 3000
RUN addgroup -S expense && adduser -S expense -G expense \
    && mkdir /opt/server \ 
    && chown expense:expense -R /opt/server

WORKDIR /opt/server

COPY package.json /opt/server/
COPY *.js /opt/server/

RUN npm install

USER expense

CMD [ "node","app.js" ]

