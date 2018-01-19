
drop table if exists dictionary;
drop table if exists organization;

create table dictionary (
  id int not null auto_increment,
  group_key varchar(100) NOT NULL,
  name varchar(100) NOT NULL,
  description varchar(100),
  data_type varchar(100),
  default_value varchar(100),
  mutability varchar(100),
  primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table organization (
  id bigint auto_increment,
  name varchar(100),
  parent_id bigint,
  parent_ids varchar(100),
  available bool default false,
  constraint pk_organization primary key(id)
) charset=utf8 ENGINE=InnoDB;

insert into organization values(1, '图计算平台', 0, '0/', true);
insert into organization values(2, '图管理平台', 1, '0/1/', true);
insert into organization values(3, '图计算层', 1, '0/1/', true);
insert into organization values(4, 'API', 2, '0/1/2/', true);
insert into organization values(5, '可视化', 2, '0/1/2/', true);
insert into organization values(6, '图查询语言', 2, '0/1/2/', true);
insert into organization values(7, '图项目管理', 2, '0/1/2/', true);
insert into organization values(8, '图建模工具', 2, '0/1/2/', true);
insert into organization values(9, '图数据ETL工具', 2, '0/1/2/', true);
insert into organization values(10, '图计算引擎', 3, '0/1/3/', true);
insert into organization values(11, '内置算法包', 3, '0/1/3/', true);
insert into organization values(12, '图算法API', 3, '0/1/3/', true);
insert into organization values(13, '图存储层', 1, '0/1/', true);
insert into organization values(14, '系统管理', 1, '0/1/', true);
insert into organization values(15, 'API模块1', 4, '0/1/2/15', true);
insert into organization values(16, 'API模块2', 4, '0/1/2/16', true);
insert into organization values(17, '可视化模块1', 5, '0/1/2/17', true);
insert into organization values(18, '可视化模块2', 5, '0/1/2/18', true);

insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('1','cache','cache.db-cache','Whether to enable JanusGraph’s database-level cache, which is shared across all transactions. Enabli','Boolean','false','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('2','cache','cache.db-cache-clean-wait','How long, in milliseconds, database-level cache will keep entries after flushing them. This option i','Integer','50','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('3','cache','cache.db-cache-size','Size of JanusGraph’s database level cache. Values between 0 and 1 are interpreted as a percentage of','Double','0.3','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('4','cache','cache.db-cache-time','Default expiration time, in milliseconds, for entries in the database-level cache. Entries are evict','Long','10000','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('5','cache','cache.tx-cache-size','Maximum size of the transaction-level cache of recently-used vertices.','Integer','20000','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('6','cache','cache.tx-dirty-size','Initial size of the transaction-level cache of uncommitted dirty vertices. This is a performance hin','Integer','(no default value)','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('7','graph','graph.allow-stale-config','Whether to allow the local and storage-backend-hosted copies of the configuration to contain conflic','Boolean','true','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('8','graph','graph.graphname','This config option is an optional configuration setting that you may supply when opening a graph. Th','String','(no default value)','LOCAL');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('9','graph','graph.set-vertex-id','Whether user provided vertex ids should be enabled and JanusGraph’s automatic id allocation be disab','Boolean','false','FIXED');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('10','graph','graph.unique-instance-id-suffix','When this is set and unique-instance-id is not, this JanusGraph instance’s unique identifier is gene','Short','(no default value)','LOCAL');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('11','ids','ids.block-size','Globally reserve graph element IDs in chunks of this size. Setting this too low will make commits fr','Integer','10000','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('12','ids','ids.flush','When true, vertices and edges are assigned IDs immediately upon creation. When false, IDs are assign','Boolean','true','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('13','ids','ids.num-partitions','Number of partition block to allocate for placement of vertices','Integer','10','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('14','ids','ids.placement','Name of the vertex placement strategy or full class name','String','simple','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('18','ids','ids.renew-percentage','When the most-recently-reserved ID block has only this percentage of its total IDs remaining (expres','Double','0.3','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('19','ids','ids.renew-timeout','The number of milliseconds that the JanusGraph id pool manager will wait before giving up on allocat','Duration','120000 ms','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('20','ids','ids.store-name','The name of the ID KCVStore. IDS_STORE_NAME is meant to be used only for backward compatibility with','String','janusgraph_ids','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('21','graph','graph.timestamps','The timestamp resolution to use when writing to storage and indices. Sets the time granularity for t','TimestampProviders','MICRO','FIXED');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('22','graph','graph.unique-instance-id','Unique identifier for this JanusGraph instance. This must be unique among all instances concurrently','String','(no default value)','LOCAL');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('23','gremlin','gremlin.graph','The implementation of graph factory that will be used by gremlin server','String','org.janusgraph.core.JanusGraphFactory','LOCAL');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('24','computer','computer.result-mode','How the graph computer should return the computed results. persist for writing them into the graph, ','String','none','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('25','cluster','cluster.max-partitions','The number of virtual partition blocks created in the partitioned graph. This should be larger than ','Integer','32','FIXED');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('26','attributes','attributes.custom.[X].serializer-class','Class of the custom attribute serializer to be registered','String','(no default value)','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('27','attributes','attributes.custom.[X].attribute-class','Class of the custom attribute to be registered','String','(no default value)','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('28','ids','ids.authority.conflict-avoidance-mode','This setting helps separate JanusGraph instances sharing a single graph storage backend avoid conten','ConflictAvoidanceMode','NONE ','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('29','ids','ids.authority.conflict-avoidance-tag','Conflict avoidance tag to be used by this JanusGraph instance when allocating IDs','Integer','0','LOCAL');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('30','ids','ids.authority.conflict-avoidance-tag-bits','Configures the number of bits of JanusGraph-assigned element IDs that are reserved for the conflict ','Integer','4','FIXED');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('31','ids','ids.authority.randomized-conflict-avoidance-retries','Number of times the system attempts ID block reservations with random conflict avoidance tags before','Integer','5','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('32','ids','ids.authority.wait-time','The number of milliseconds the system waits for an ID block reservation to be acknowledged by the st','Duration','300 ms','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('33','index','index.[X].elasticsearch.bulk-refresh','Elasticsearch bulk API refresh setting used to control when changes made by this request are made vi','String','false','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('34','index','index.[X].elasticsearch.health-request-timeout','When JanusGraph initializes its ES backend, JanusGraph waits up to this duration for the ES cluster ','String','30s','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('35','index','index.[X].elasticsearch.interface','Interface for connecting to Elasticsearch. TRANSPORT_CLIENT and NODE were previously supported, but ','String','REST_CLIENT','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('36','index','index.[X].elasticsearch.scroll-keep-alive','How long (in secondes) elasticsearch should keep alive the scroll context.','Integer','60','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('37','index','index.[X].elasticsearch.use-all-field','Whether JanusGraph should add an \"all\" field mapping. When enabled field mappings will include a \"co','Boolean','true','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('38','index','index.[X].elasticsearch.use-deprecated-multitype-index','Whether JanusGraph should group these indices into a single Elasticsearch index (requires Elasticsea','Boolean','false','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('39','index','index.[X].elasticsearch.create.sleep','How long to sleep, in milliseconds, between the successful completion of a (blocking) index creation','Long','200','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('40','index','index.[X].elasticsearch.create.use-external-mappings','Whether JanusGraph should make use of an external mapping when registering an index.','Boolean','false','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('41','index','index.[X].solr.configset','If specified, the same solr configSet can be resued for each new Collection that is created in SolrC','String','(no default value)','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('42','index','index.[X].solr.dyn-fields','Whether to use dynamic fields (which appends the data type to the field name). If dynamic fields is ','Boolean','true','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('43','index','index.[X].solr.http-compression','Enable/disable compression on the HTTP connections made to Solr.','Boolean','false','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('44','index','index.[X].solr.http-connection-timeout','Solr HTTP connection timeout.','Integer','5000','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('45','index','index.[X].solr.http-max','Maximum number of HTTP connections in total to all Solr servers.','Integer','100','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('46','index','index.[X].solr.http-max-per-host','Maximum number of HTTP connections per Solr host.','Integer','20','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('47','index','index.[X].solr.http-urls','List of URLs to use to connect to Solr Servers (LBHttpSolrClient is used), don’t add core or collect','String[]','http://localhost:8983/solr','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('48','index','index.[X].solr.key-field-names','Field name that uniquely identifies each document in Solr. Must be specified as a list of collection','String[]','(no default value)','GLOBAL');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('49','index','index.[X].solr.max-shards-per-node','Maximum number of shards per node. This applies when creating a new collection which is only support','Integer','1','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('50','index','index.[X].solr.mode','The operation mode for Solr which is either via HTTP (http) or using SolrCloud (cloud)','String','cloud','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('51','index','index.[X].solr.num-shards','Number of shards for a collection. This applies when creating a new collection which is only support','Integer','1','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('52','index','index.[X].solr.replication-factor','Replication factor for a collection. This applies when creating a new collection which is only suppo','Integer','1','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('53','index','index.[X].solr.ttl_field','Name of the TTL field for Solr collections.','String','ttl','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('54','index','index.[X].solr.wait-searcher','When mutating - wait for the index to reflect new mutations before returning. This can have a negati','Boolean','false','LOCAL');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('55','index','index.[X].solr.zookeeper-url','URL of the Zookeeper instance coordinating the SolrCloud cluster','String','localhost:2181','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('66','index','','URL of the Zookeeper instance coordinating the SolrCloud cluster','String','localhost:2181	','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('77','log','log.[X].backend','Define the log backed to use','String',NULL,'GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('78','log','log.[X].fixed-partition','Whether all log entries are written to one fixed partition even if the backend store is partitioned.','Boolean','false','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('79','log','log.[X].key-consistent','Whether to require consistency for log reading and writing messages to the storage backend','Boolean','false','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('80','log','log.[X].max-partitions','The maximum number of partitions to use for logging. Setting up this many actual or virtual partitio','Integer','(no default value)','FIXED');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('81','log','log.[X].max-read-time','Maximum time in ms to try reading log messages from the backend before failing.','Duration','4000 ms','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('82','log','log.[X].max-write-time','Maximum time in ms to try persisting log messages against the backend before failing.','Duration','10000 ms','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('83','log','log.[X].num-buckets','The number of buckets to split log entries into for load balancing','Integer','1','GLOBAL_OFFLINE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('84','log','log.[X].read-batch-size','Maximum number of log messages to read at a time for logging implementations that read messages in b','Integer','1024','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('85','log','log.[X].read-interval','Time in ms between message readings from the backend for this logging implementations that read mess','Duration','5000 ms','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('86','log','log.[X].read-lag-time','Maximum time in ms that it may take for reads to appear in the backend. If a write does not becomevi','Duration','500 ms','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('87','log','log.[X].read-threads','Number of threads to be used in reading and processing log messages','Integer','1','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('88','log','log.[X].send-batch-size','Maximum number of log messages to batch up for sending for logging implementations that support batc','Integer','256','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('89','log','log.[X].send-delay','Maximum time in ms that messages can be buffered locally before sending in batch','Duration','1000 ms','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('90','log','log.[X].ttl','Sets a TTL on all log entries, meaningthat all entries added to this log expire after the configured','Duration','(no default value)','GLOBAL');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('95','metrics','metrics.enabled','Whether to enable basic timing and operation count monitoring on backend','Boolean','false','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('96','metrics','metrics.merge-stores','Whether to aggregate measurements for the edge store, vertex index, edge index, and ID store','Boolean','true','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('97','metrics','metrics.prefix','The default name prefix for Metrics reported by JanusGraph.','String','org.janusgraph','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('98','metrics','metrics.console.interval','Time between Metrics reports printing to the console, in milliseconds','Duration','(no default value)','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('99','metrics','metrics.csv.directory','Metrics CSV output directory','String','(no default value)','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('100','metrics','metrics.csv.interval','Time between dumps of CSV files containing Metrics data, in milliseconds','Duration','(no default value)','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('101','metrics','metrics.ganglia.addressing-mode','Whether to communicate to Ganglia via uni- or multicast','String','unicast','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('102','metrics','metrics.ganglia.hostname','The unicast host or multicast group name to which Metrics will send Ganglia data','String','(no default value)','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('103','metrics','metrics.ganglia.interval','The number of milliseconds to wait between sending Metrics data to Ganglia','Duration','(no default value)','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('104','metrics','metrics.ganglia.port','The port to which Ganglia data are sent','Integer','8649','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('105','metrics','metrics.ganglia.protocol-31','Whether to send data to Ganglia in the 3.1 protocol format','Boolean','true','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('106','metrics','metrics.ganglia.spoof','If non-null, it must be a valid Gmetric spoof string formatted as an IP:hostname pair. See https://g','String','(no default value)','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('107','metrics','metrics.ganglia.ttl','The multicast TTL to set on outgoing Ganglia datagrams','Integer','1','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('108','metrics','metrics.ganglia.uuid','The host UUID to set on outgoing Ganglia datagrams. See https://github.com/ganglia/monitor-core/wiki','String','(no default value)','LOCAL');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('109','metrics','metrics.graphite.hostname','The hostname to receive Graphite plaintext protocol metric data','String','(no default value)','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('110','metrics','metrics.graphite.interval','The number of milliseconds to wait between sending Metrics data','Duration','(no default value)','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('111','metrics','metrics.graphite.port','The port to which Graphite data are sent','Integer','2003','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('112','metrics','metrics.graphite.prefix','A Graphite-specific prefix for reported metrics','String','(no default value)','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('113','metrics','metrics.jmx.agentid','The JMX agentId used by Metrics','String','(no default value)','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('114','metrics','metrics.jmx.domain','The JMX domain in which to report Metrics','String','(no default value)','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('115','metrics','metrics.jmx.enabled','Whether to report Metrics through a JMX MBean','Boolean','false','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('116','metrics','metrics.slf4j.interval','Time between slf4j logging reports of Metrics data, in milliseconds','Duration','(no default value)','MASKABLE');
insert into `dictionary` (`id`, `group_key`, `name`, `description`, `data_type`, `default_value`, `mutability`) values('117','metrics','metrics.slf4j.logger','The complete name of the Logger through which Metrics will report via Slf4j','String','(no default value)','MASKABLE');



