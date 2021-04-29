FROM node:14.16-alpine

WORKDIR /action

ENV ACTION_WORKSPACE=/action

COPY scripts/ scripts/

# RUN apt-get update -y
RUN apk add --no-cache git bash docker-cli
# RUN apt-get install docker-cli  -y
# ARG Foo

CMD [ "/bin/bash", "/action/scripts/run.sh" ]