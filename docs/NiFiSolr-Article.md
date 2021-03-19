# Tweets sentiment analysis using NiFi and Solr with Docker Containers
(https://blogs.apache.org/nifi/entry/indexing_tweets_with_nifi_and)

(https://community.cloudera.com/t5/Community-Articles/Sample-HDF-NiFi-flow-to-Push-Tweets-into-Solr-Banana-HDFS/ta-p/244454)

This is an example of how we can create a basic sentiment analysis using open source platforms in less than 10 minutes. The idea is to get you a base environment from you which you can further extend and customize to your particular needs. As indicated in the title, we will make use of: NiFi, Solr and Docker

- Apache NiFi (Niagara Files) is a software designed to allow the data flow across systems. It is straight-forward to use: easy installation/configuration, the data flows through configurable components (called processors), and open to extend/customize them. Some processors are: ConsumeKafka, ConvertAvroToJSON, GetMongo, GetTwitter, PutKinesisFirehose, PutSolrContent, PutElasticSearch, etc
![NiFi Flow](https://nifi.apache.org/assets/images/flow.png)

- Apache Solr is a NoSQL search database especialized in full-text and geospatial search and analysis, rich document parsing, highly scalable, fault tolerant, etc.
![Solr](https://solr.apache.org/guide/6_6/images/query-screen/query-top.png)

By using both tools we can stream data from tweeter into a database for sentiment analysis and by using docker containers we can setup a demo environment in no more than 10 minutes.

While creating this demo, I came across some interesting challenges, which i consider worthwhile to understand if you plan to customize or extend this demo. The topics covered are several, such as: tweeter application, networking, date/time format, Solr cores creation in docker, CORS mechanism, ssl security, etc

## The demo
Here we will focus on the environment setup. We will need:
1. Create Twitter account
2.  Create custom Solr image<p>
    a. Create Dockerfile for custom Solr<p>
        i. We need to modify the file: /opt/solr/server/solr/configsets/_default/conf/<b>solrconfig.xml</b>. (Ref : [1]) <p>

                <processor class=”solr.ParseDateFieldUpdateProcessorFactory”>
                <arr name=”format”>
                <str>EEE MMM d HH:mm:ss Z yyyy</str>
                <str>yyyy-MM-dd’T’HH:mm:ss.SSSZ</str>
       ii. Add Banana application for Solr Dashboard<p>
	b. Create custom Solr docker image
3. Create docker-compose script (NiFi and Solr containers)
	a. Create Solr container with two cores: mycore (tweets index core), banana-int(Banana dashboard for tweets)
	b. Create NiFi container
4. Execute docker-compose
5. In Solr:
	a. Import Banana Dashboard
6. In NiFi:
	a. Import NiFi Flow
	b. Enter API Secret / Token details
    c. Execute Nifi Flow(*)

[1] https://bigdataum.wordpress.com/2016/01/24/nifi-solr-and-banana-twitter-streaming/

