node.default['java']['jdk_version'] = '7'
node.default['java']['install_flavor'] = 'openjdk'
node.default[:elasticsearch][:cluster][:name] = 'my-cluster'
default.elasticsearch[:path][:conf] = "/etc/elasticsearch"
default.elasticsearch[:path][:logs] = "/var/log/elasticsearch"
#node.default['kibana']['version'] = '3'
#node.default['kibana']['base_dir'] = '/var/www/kibana'
#node.default['kibana']['elasticsearch']['port'] = 80
#node.default['kibana']['nginx']['server_name'] = 'default-ubuntu-1404'
#override[:java][:openjdk_packages] = [
#  "openjdk-7-jdk", "openjdk-7-jre-headless"
#  ]
