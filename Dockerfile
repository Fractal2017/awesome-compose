FROM solr
#ADD myconfig/_default  /opt/solr/server/solr/configsets/myconfig
ADD banana /opt/solr/server/solr-webapp/webapp/banana
USER root
RUN sed -i "/<str>yyyy-MM-dd\\['T'\\[HH:mm\\[:ss\\[\\./i \ \ \ \ \ \ <str>EEE MMM d HH:mm:ss Z yyyy</str>" /opt/solr/server/solr/configsets/_default/conf/solrconfig.xml
USER solr