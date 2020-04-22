# Elasticsearch & Docker with Logstash, JDBC and Magic
Basic Example Using Logstash to import Data from MySQL and modifying Data from 
multiple Tables withhin logstash to a single Object 

# Loading Data from MySQL into Elasticsearch with Logstash and Magic 

A simple Configuration for Logstash


## Usage

docker run --name mysql-server -p 3306:3306 -e MYSQL_ROOT_PASSWORD=codingsolo -d mysql:latest
docker run --name myadmin -d --link mysql-server:db -p 8080:80 phpmyadmin/phpmyadmin

Import Tutorial Codingsolo.sql

docker network create skynet

docker run -d --name elasticsearch --net skynet -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:7.6.2
docker run -d --name kibana --net skynet -p 5601:5601 kibana:7.6.2

docker run -it --rm --name logstash --net="host" -v pathTo\Elasticsearch_Import\pipeline\:/usr/share/logstash/pipeline/ -v pathTo\Elasticsearch_Import\driver\:/driver/  docker.elastic.co/logstash/logstash:7.6.2


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

# schadiet