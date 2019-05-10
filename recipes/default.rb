#
# Cookbook:: app-deploy
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'java-1.8.0-openjdk' do
  action :install
end
package 'java-1.8.0-openjdk-devel' do
  action :install
end

remote_file '/opt/tomcat8-8.5.40.tar.gz' do
  source 'http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz'
  owner 'root'
  group 'root'
  action :create
  not_if { File.exist?('/opt/tomcat8-8.5.40.tar.gz') }
# notifies :run, 'execute[extract_tar]', :immediately
end

directory '/opt/tomcat' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'extract_tar' do
  command 'tar -xvf /opt/tomcat8*.tar.gz -C /opt/tomcat --strip-components=1'
  action :nothing
end

cookbook_file '/etc/systemd/system/tomcat.service' do
  source 'tomcat.service'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

execute 'daemon-reload' do
  command 'systemctl daemon-reload'
end

service 'tomcat' do
  action [:start, :enable]
end

cookbook_file '/opt/tomcat/conf/tomcat-users.xml' do
  source 'tomcat-users.xml'
  owner 'root'
  group 'root'
  mode '0600'
  action :create
end

cookbook_file '/opt/tomcat/webapps/manager/META-INF/context.xml' do
  source 'context.xml'
  owner 'root'
  group 'root'
  mode '0600'
  action :create
end

cookbook_file '/opt/tomcat/webapps/SampleApp.war' do
  source 'SampleApp.war'
  action :create
  owner 'root'
  group 'root'
end
