default['java']['jdk_version'] = '7'
default['java']['install_flavor'] = 'openjdk'
default['elasticsearch']['cluster']['name'] = 'my-cluster'
default['elasticsearch']['path']['conf'] = "/etc/elasticsearch"
default['elasticsearch']['path']['logs'] = "/var/log/elasticsearch"
#default['elasticsearch']['pid_path']  = "/var/run"
#default['elasticsearch']['path']['data'] = "/var/data/elasticsearch"
#default['elasticsearch']['version'] = '1.4.3'
default['elasticsearch']['version'] = '1.3.9'
#default['elasticsearch']['custom_config']['http.cors.allow-origin'] = '"/.*/"'
default['elasticsearch']['custom_config']['http.cors.allow-origin'] = '"*"'
default['elasticsearch']['custom_config']['http.cors.enabled']  = 'true'

#node.default['kibana']['version'] = '3'
#node.default['kibana']['base_dir'] = '/var/www/kibana'
#node.default['kibana']['elasticsearch']['port'] = 80
#node.default['kibana']['nginx']['server_name'] = 'default-ubuntu-1404'
#override[:java][:openjdk_packages] = [
#  "openjdk-7-jdk", "openjdk-7-jre-headless"
#  ]

##tries to override elasticsearch default version
#default.elasticsearch[:version]       = "1.4.3"
#default.elasticsearch[:filename]      = "elasticsearch-#{node.elasticsearch[:version]}.tar.gz"
#default.elasticsearch[:download_url]  = [node.elasticsearch[:host], node.elasticsearch[:repository], node.elasticsearch[:filename]].join('/')

##another try
#node.override["elasticsearch"]["download_url"] = "http://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.8.tar.gz"
