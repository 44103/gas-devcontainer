FROM node:slim

RUN export DEBIAN_FRONTEND="noninteractive" && \
    apt-get update && apt-get -y install --no-install-recommends \
    git \
    zsh \
    vim \
    curl ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN yarn global add @google/clasp
RUN yarn add -D \
    eslint prettier @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-config-prettier eslint-plugin-import \
    @types/jest jest ts-jest

ENV TZ=Asia/Tokyo
RUN zsh -c "`curl -L raw.github.com/44103/dotfiles/main/install.sh`"
