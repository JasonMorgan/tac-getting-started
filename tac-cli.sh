#!/bin/bash
. demo-magic.sh
clear

p "Get the cli here: https://tac.bitnami.com/cli"
wait
clear

pe "tac get apps | bat -l json"
wait
clear

pe "tac get app ed7020c3afa6d4309f2275611442f8cf06f24cfe | jq"
wait
clear

pe "tac get artifact 2a75c0f1f01e2b0b09abef78a4cd7c24819751bc402fd56e800f8a1869cfad38 --dest /tmp"
wait
clear

pe "bat -l json /tmp/asset-spec.json"
wait
clear

pe "tac get apps --asset-type container | jq '.[] | select(.assets[0].name == \"Redis\")'"
wait
clear

pe 'ASSET_ID=$(tac get apps --asset-type container | jq '\''.[] | select(.assets[0].name == "Redis").assets[0].id'\'' -r)'

pe 'tac get app "$ASSET_ID" | jq'
wait
clear

pe 'tac get app "$ASSET_ID" | jq ".releases[0].artifact.image_reference[0].tags"'
wait
clear

pe 'REPORT_ID=$(tac get app $ASSET_ID | jq ".releases[0].artifact.antivirus_scan_result.id" -r)'

pe 'tac get artifact "$REPORT_ID" --dest /tmp'

pe "bat /tmp/clamav-antivirus-scan.log"