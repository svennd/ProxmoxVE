#!/usr/bin/env bash
# source <(curl -s https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/build.func)
source <(curl -s https://raw.githubusercontent.com/svennd/ProxmoxVE/refs/heads/graylog/misc/build.func)
# Copyright (c) 2021-2025 community-scripts ORG
# Author: SvennD
# License: MIT | https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE
# Source: https://graylog.org/

# App Default Values
APP="Graylog"
var_tags="logging"
var_cpu="2"
var_ram="4096"
var_disk="10"
var_os="debian"
var_version="12"
var_unprivileged="1"

# App Output & Base Settings
header_info "$APP"
base_settings

# Core
variables
color
catch_errors

function update_script() {
  header_info
  check_container_storage
  check_container_resources
  msg_ok "not implemented yet"
  exit
}

start
build_container
description

msg_ok "Completed Successfully!\n"
echo -e "${CREATING}${GN}${APP} setup has been successfully initialized!${CL}"
echo -e "${INFO}${YW} Access it using the following URL:${CL}"
echo -e "${TAB}${GATEWAY}${BGN}http://${IP}${CL}"