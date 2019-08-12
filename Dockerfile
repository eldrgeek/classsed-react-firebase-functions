FROM gitpod/workspace-full:latest
USER root
RUN wget https://dl.pstmn.io/download/latest/linux64 -O postman-linux-x64.tar.gz \
    && sudo tar -xvzf postman-linux-x64.tar.gz -C /opt \
    && sudo ln -s /opt/Postman/Postman /usr/bin/postman \
    && rm postman-linux-x64.tar.gz

RUN apt-get update && apt-get install -y \
        libgtk-3-0 \
        libx11-6 libx11-xcb1 libxcb1 \
        postgresql-contrib \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# Setup postgres server for user gitpod
USER gitpod
# RUN npm install -g firebase-tools
# ENV PATH="/usr/lib/postgresql/10/bin:$PATH"
# RUN mkdir -p ~/pg/data; mkdir -p ~/pg/scripts; mkdir -p ~/pg/logs; mkdir -p ~/pg/sockets; initdb -D pg/data/
# RUN echo '#!/bin/bash\n\
# pg_ctl -D ~/pg/data/ -l ~/pg/logs/log -o "-k ~/pg/sockets" start' > ~/pg/scripts/pg_start.sh
# RUN echo '#!/bin/bash\n\
# pg_ctl -D ~/pg/data/ -l ~/pg/logs/log -o "-k ~/pg/sockets" stop' > ~/pg/scripts/pg_stop.sh
# RUN chmod +x ~/pg/scripts/*
# ENV PATH="$HOME/pg/scripts:$PATH"

# Project specifics
# Setup diesel_cli

# Give back control
USER root