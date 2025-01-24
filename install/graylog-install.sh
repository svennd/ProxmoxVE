#!/usr/bin/env bash

# Copyright (c) 2021-2025 community-scripts ORG
# Author: SvennD
# License: MIT
# https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE


source /dev/stdin <<<"$FUNCTIONS_FILE_PATH"
color
verb_ip6
catch_errors
setting_up_container
network_check
update_os

msg_info "Installing mongodb"
        $STD timedatectl set-timezone UTC
        $STD apt-get install -y \
        gnupg\
        curl
        
        curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
        $STD echo "deb [signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg] https://repo.mongodb.org/apt/debian bookworm/mongodb-org/7.0 main" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list
        $STD apt-get update
        $STD apt-get install -y mongodb-org
        $STD systemctl daemon-reload
        $STD systemctl enable mongod.service
        $STD systemctl restart mongod.service

        # set a hold
        $STD apt-mark hold mongodb-org
msg_ok "Installed Dependencies"

msg_info "install Data Node"
        $STD wget https://packages.graylog2.org/repo/packages/graylog-6.1-repository_latest.deb
        $STD dpkg -i graylog-6.1-repository_latest.deb
        $STD apt-get update
        $STD apt-get install graylog-datanode -y

        SECRET=$(< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c${1:-96};echo;)
        PASSWORD=$(openssl rand -base64 18 | tr -dc 'a-zA-Z0-9' | head -c13)
        HASH=$(echo -n $PASSWORD | sha256sum | awk '{print $1}')
        sed -i -e "s/password_secret =.*/password_secret = $SECRET/" /etc/graylog/datanode/datanode.conf
        sed -i -e "s/root_password_sha2 =.*/root_password_sha2 = $HASH/" /etc/graylog/datanode/datanode.conf
        $STD systemctl enable graylog-datanode.service
        $STD systemctl start graylog-datanode
msg_ok "Installed Graylog Data Node"

msg_info "Installed Graylog"
        $STD apt-get install graylog-enterprise

        sed -i -e "s/password_secret =.*/password_secret = $SECRET/" /etc/graylog/server/server.conf
        sed -i -e "s/root_password_sha2 =.*/root_password_sha2 = $HASH/" /etc/graylog/server/server.conf
        sed -i 's/#http_bind_address = 127.0.0.1.*/http_bind_address = 0.0.0.0:9000/g' /etc/graylog/server/server.conf

        $STD systemctl daemon-reload
        $STD systemctl enable graylog-server.service
        $STD systemctl start graylog-server
msg_ok "Installed Graylog"

motd_ssh
customize

msg_info "Cleaning up"
        $STD apt-get -y autoremove
        $STD apt-get -y autoclean
msg_ok "Cleaned"
