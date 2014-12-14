# Dockerfile for Kibana v4

This Dockerfile runs the default kibana dashboard on the default port 5601.  
You'll need a separate elasticsearch on a different host to run this image.  

Configuration variables can be set using environment variables.  
To connect to an elasticsearch server on the docker host, run this:

```bash
docker run -e ELASTICSEARCH=http://172.17.42.1:9200 marcbachmann/kibana4
```