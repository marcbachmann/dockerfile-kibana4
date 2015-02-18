# Dockerfile for Kibana v4

This Dockerfile contains the [Kibana](https://github.com/elasticsearch/kibana) Dashboard. The default Kibana port 5601 is exposed.

To run this container you'll need a separate elasticsearch server.
Kibana automatically proxies all requests from the dashboard to the elasticsearch server. So the ES server doesn't need to be accessible from the internet.

## Tags

Available Kibana Versions:

`4.0.0-BETA2`
`4.0.0-BETA3`
`4.0.0-RC1`, `latest`

## Run
To connect to an elasticsearch server on the docker host, run this:

```bash
docker run -e ELASTICSEARCH=http://172.17.42.1:9200 -P marcbachmann/kibana4
```

## Options
Most configuration variables can be set using environment variables.

```
ENV VAR         - default value
---------------------------------------
ELASTICSEARCH   = http://172.17.42.1:9200
KIBANA_INDEX    = .kibana
DEFAULT_APP_ID  = discover
REQUEST_TIMEOUT = 60
SHARD_TIMEOUT   = 30000
VERIFY_SSL      = true
```