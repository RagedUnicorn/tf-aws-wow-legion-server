#!/bin/bash
# @author Michael Wiesendanger <michael.wiesendanger@gmail.com>
# @description Update mangosd.conf.tpl and realmd.conf.tpl then redeploy the configuration

set -euo pipefail

# download configurations from github gists
echo "${operator_password}" | sudo -S su "${operator_user}" -c 'wget -O /home/"${operator_user}"/config/bnetserver.conf.tpl https://gist.githubusercontent.com/RagedUnicorn/cc41871747fae654800761f1145bbafb/raw/bnetserver.conf.tpl'
echo "${operator_password}" | sudo -S su "${operator_user}" -c 'wget -O /home/"${operator_user}"/config/worldserver.conf.tpl https://gist.githubusercontent.com/RagedUnicorn/169ada1aba19df700f91cbce3a1086fb/raw/worldserver.conf.tpl'

# deploy docker stack
echo "${operator_password}" | sudo -S su "${operator_user}" -c 'docker deploy --compose-file=/home/"${operator_user}"/docker-compose.stack.yml wow-legion-server'
