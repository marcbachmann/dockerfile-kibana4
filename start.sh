#!/bin/bash

export ELASTICSEARCH=${ELASTICSEARCH:-http://localhost:9200}
sed -i.bak -e "s|elasticsearch:.*$|elasticsearch: \"$ELASTICSEARCH\"|" /app/config/kibana.yml
/app/bin/kibana
