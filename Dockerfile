FROM node:14.16.0-alpine

WORKDIR /action

ENV ACTION_WORKSPACE=/action

COPY scripts/ scripts/

CMD [ "/bin/bash", "/action/scripts/run.sh" ]