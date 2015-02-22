#
# Cookbook Name:: _logstash_server3_rm
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
include_recipe 'kibana'

package 'git' do
  action :install
end

# install logstash 'server'
