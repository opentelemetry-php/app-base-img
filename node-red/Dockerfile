FROM nodered/node-red

ARG IMAGE_SOURCE=https://github.com/opentelemetry-php/app-base-img

LABEL org.opencontainers.image.source=${IMAGE_SOURCE}

RUN npm install --save @node-red-contrib-themes/theme-collection
RUN npm install --save @opentelemetry/api
RUN npm install --save @opentelemetry/sdk-node
RUN npm install --save @opentelemetry/auto-instrumentations-node
