FROM node:8.9.1

RUN apt-get update && apt-get install -y --no-install-recommends apt-transport-https && \
      curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
      apt-get update && apt-get install -y --no-install-recommends yarn

RUN yarn global add \
      polymer-cli \
      bower \
      browser-sync \
      standard \
      eslint-plugin-html \
      snazzy \
      http-server
      # --unsafe-perm=true --allow-root

ENV HOME=/home/node
RUN echo 'root:root' | chpasswd
USER node
WORKDIR "$HOME"/

CMD ["/bin/bash"]
