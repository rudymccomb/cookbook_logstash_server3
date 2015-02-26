#
# Cookbook Name:: cookbook_logstash_server3
# Recipe:: default
#
# Copyright 2014, , Inc.
#
# All rights reserved - Do Not Redistribute
#

#https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash-contrib_1.4.2-1-efd53ef_all.deb

execute "apt-get update" do
  command "apt-get update"
end

include_recipe 'java'

remote_file "/tmp/logstash_1.4.2-1-2c0f5a1_all.deb" do
  source "https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_1.4.2-1-2c0f5a1_all.deb"
  mode 0644
  #checksum "34ef38af7e934611f2915b2d4603945630bd7a53" # PUT THE SHA256 CHECKSUM HERE
end

remote_file "/tmp/logstash-contrib_1.4.2-1-efd53ef_all.deb" do
  source "https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash-contrib_1.4.2-1-efd53ef_all.deb"
  mode 0644
  #checksum "34ef38af7e934611f2915b2d4603945630bd7a53" # PUT THE SHA256 CHECKSUM HERE
end

dpkg_package "logstash" do
  source "/tmp/logstash_1.4.2-1-2c0f5a1_all.deb"
  action :install
end

dpkg_package "logstash-contrib" do
  source "/tmp/logstash-contrib_1.4.2-1-efd53ef_all.deb"
  action :install
end

include_recipe 'elasticsearch'
#include_recipe 'kibana'

puts "file_cache_path = #{Chef::Config[:file_cache_path]}"

#installs with ark


#execute "untar" do
#  command "tar xzf /tmp/kibana-4.0.0-linux-x64.tar.gz"
  #not_if "ls /opt/logstash"
#end

include_recipe 'nginx'
#include_recipe 'kibana::nginx'
directory "/var/www" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


template "/etc/nginx/sites-available/default" do
  action :create
  source "nginx.conf.erb"
  mode "0644"
  user "root"
  group "root"
end

ark "kibana" do
   url 'https://download.elasticsearch.org/kibana/kibana/kibana-3.0.1.tar.gz'
   path "/var/www/"
   action :put
end

template "/var/www/kibana/config.js" do
  action :create
  source "config.js.erb"
  mode "0644"
  user "root"
  group "root"
end

package 'git' do
  action :install
end

service 'nginx' do
  action :start
end

service 'elasticsearch' do
  action :start
end

service 'logstash' do
  action :start
end
# user access for logstash
#things left to be done
#usermod -a -G adm logstash
#



# install logstash 'server'
