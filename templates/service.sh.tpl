#!/bin/bash
# @author Michael Wiesendanger <michael.wiesendanger@gmail.com>
# @description Update mangosd.conf.tpl and realmd.conf.tpl then redeploy the configuration

set -euo pipefail

# download configurations from github gists
echo "${operator_password}" | sudo -S su "${operator_user}" -c 'wget https://gist.githubusercontent.com/RagedUnicorn/cc41871747fae654800761f1145bbafb/raw/5df603359963a6dda28c2ab18b5aee02983d30a5/bnetserver.conf.tpl -P /home/"${operator_user}"/config'
echo "${operator_password}" | sudo -S su "${operator_user}" -c 'wget https://gist.githubusercontent.com/RagedUnicorn/169ada1aba19df700f91cbce3a1086fb/raw/9d679c1c37ec33f756a2f09cc94b3fae433f9aab/worldserver.conf.tpl -P /home/"${operator_user}"/config'

# deploy docker stack
echo "${operator_password}" | sudo -S su "${operator_user}" -c 'docker deploy --compose-file=/home/"${operator_user}"/docker-compose.stack.yml wow-legion-server'
