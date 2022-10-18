FROM asia.gcr.io/sirclo-iii-nonprod/swift-pwa:2.5.12-1666087815
ARG src_dir="/usr/src/app"

#Install pm2
RUN yarn global add pm2;

# Setting working directory. All the path will be relative to WORKDIR
WORKDIR ${src_dir}

RUN yarn add https://github.com/yosefkurniawan/swift-pwa-custom.git#master && \
    rm -rf src
COPY node_modules/swift-pwa-custom/src src

# Patch pwa
RUN sh project_patch.sh

# build pwa
RUN yarn build; 

EXPOSE 3000