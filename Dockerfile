FROM asia.gcr.io/sirclo-iii-nonprod/swift-pwa:2.5.12-1666087815
ARG src_dir="/usr/src/app"

# Setting working directory. All the path will be relative to WORKDIR
WORKDIR /usr/src/app

RUN yarn add https://github.com/yosefkurniawan/swift-pwa-custom.git#master && \
    rm -rf ${src_dir}/src && \
    cp -r ${src_dir}/node_modules/swift-pwa-custom/src ${src_dir}/src
COPY swift.config.js /usr/src/app/swift.config.js

# Patch pwa
RUN sh project_patch.sh

# build pwa
RUN yarn build; 

EXPOSE 3000