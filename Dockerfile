FROM node:14-slim

COPY package*.json ./textlint
COPY .textlintrc ./textlint

RUN npm install
