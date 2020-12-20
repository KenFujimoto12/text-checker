FROM node:14-slim

# setting
RUN apt-get update
RUN apt-get -y install vim
RUN { \
        echo 'set encoding=utf-8'; \
        echo 'set fileencodings=utf-8'; \
        echo 'set fileformats=unix,dos,mac'; \
    } > ~/.vimrc
RUN . ~/.vimrc

# copy
COPY package*.json /text-checker/
COPY .textlintrc /text-checker/
COPY textlint-rule-mistaken-ward-check /text-checker/textlint-rule-mistaken-ward-check

WORKDIR /text-checker
RUN npm install

# custom rule setting
WORKDIR /text-checker/textlint-rule-mistaken-ward-check
RUN npm install
RUN npm run build

WORKDIR /text-checker
RUN npm install ./textlint-rule-mistaken-ward-check

# path textlint
WORKDIR /usr/bin
RUN touch textlint
RUN ln -s --force /text-checker/node_modules/.bin/textlint textlint

WORKDIR /
