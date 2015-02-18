#!/bin/bash

export ELASTICSEARCH=${ELASTICSEARCH:-http://172.17.42.1:9200}
export KIBANA_INDEX=${KIBANA_INDEX:-.kibana}
export DEFAULT_APP_ID=${DEFAULT_APP_ID:-discover}
export REQUEST_TIMEOUT=${REQUEST_TIMEOUT:-60}
export SHARD_TIMEOUT=${SHARD_TIMEOUT:-30000}
export VERIFY_SSL=${VERIFY_SSL:-true}

REPLACE=(
 "s|^elasticsearch_url:.*$|elasticsearch_url: \"$ELASTICSEARCH\"|;"
 "s|^kibana_index:.*$|kibana_index: \"$KIBANA_INDEX\"|;"
 "s|^default_app_id:.*$|default_app_id: \"$DEFAULT_APP_ID\"|;"
 "s|^request_timeout:.*$|request_timeout: $REQUEST_TIMEOUT|;"
 "s|^shard_timeout:.*$|shard_timeout: $SHARD_TIMEOUT|;"
 "s|^verify_ssl:.*$|verify_ssl: $VERIFY_SSL|;"
)

sed -i.bak -e "${REPLACE[*]}" /app/config/kibana.yml
/app/bin/kibana
