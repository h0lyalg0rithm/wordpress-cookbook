#
# Cookbook Name:: wordpress
# Recipe:: default
#
# Copyright 2014, 
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apache2"
include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2::mod_php5"
include_recipe "database::mysql"

apache_site "default" do
  enable true
end

mysql_database node['wordpress']['database'] do
  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
  action :create
end

wordpress_latest = Chef::Config[:file_cache_path] + "/wordpress-latest.tar.gz"

remote_file wordpress_latest do
  source "http://wordpress.org/latest.tar.gz"
  mode "0644"
end

file '/var/www/index.html' do
  action :delete 
end

directory node['wordpress']['path'] do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

execute "untar-wordpress" do
  cwd node['wordpress']['path']
  command "tar --strip-components 1 -xzf " + wordpress_latest
  creates node['wordpress']['path'] + "/wp-settings.php"
end

template node['wordpress']['path'] + '/wp-config.php' do
  source 'wp-config.php.erb'
  mode 0755
  owner 'root'
  group 'root' 
  variables(
    :database        => node['wordpress']['database'],
    :user            => 'root',
    :password        => node['mysql']['server_root_password'],
  )
  not_if do
    File.exists?(node['wordpress']['path'] + '/wp-config.php')
  end
end
