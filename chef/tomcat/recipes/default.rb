#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# Install library
# include_recipe "tomcat::lib"

# install tomcat
cookbook_file "#{node['tomcat']['dir']}#{node['tomcat']['tomcat_src_file']}" do
  source node['tomcat']['tomcat_src_file']
  not_if   "ls #{node['tomcat']['dir']}#{node['tomcat']['tomcat_dir']}"
  notifies :run, 'bash[install tomcat]', :immediately
  owner node['tomcat']['user']
  group node['tomcat']['group']
#  mode "#node['tomcat']['mode']"
  mode 00744
end

bash "install tomcat" do
#  user     node['tomcat']['user']
  action :nothing
  cwd      node['tomcat']['dir']
  notifies :run, 'bash[start tomcat]', :immediately
  code   <<-EOH
    tar xzf #{node['tomcat']['tomcat_src_file']}
    mv -f #{node['tomcat']['tomcat_version']} #{node['tomcat']['tomcat_dir']}
  EOH
end



## Modify conf
template "#{node['tomcat']['dir']}#{node['tomcat']['tomcat_dir']}/conf/server.xml" do
  source   "server.xml.erb"
  owner    node['tomcat']['install_user']
  group    node['tomcat']['install_group']
  mode     00644
  notifies :run, 'bash[restart tomcat]', :immediately
end

# Delete pakage
bash "Delete pkg file" do
  only_if "ls #node['tomcat']['dir']*.tar.gz"
  code   <<-EOH
    rm -f #{node['tomcat']['dir']}*.tar.gz
  EOH
end

# AutoStart
template "/etc/init.d/tomcat" do
  source   "tomcat.erb"
  owner    node['tomcat']['user']
  group    node['tomcat']['group']
  mode     00755
  not_if "ls /etc/init.d/tomcat"
  notifies :run, 'bash[add service tomcat]', :immediately
end
bash "add service tomcat" do
  action :nothing
  user   node['tomcat']['user']
  code   <<-EOH
    chkconfig --add tomcat
    chkconfig tomcat on
  EOH
  notifies :run, 'bash[start tomcat]', :immediately
end

# Bashs
bash "start tomcat" do
  action :nothing
  flags  '-ex'
  user   node['tomcat']['install_user']
  code   <<-EOH
    #{node['tomcat']['dir']}#{node['tomcat']['tomcat_dir']}/bin/startup.sh
  EOH
end

bash "restart tomcat" do
  action :nothing
  flags  '-ex'
  user   node['tomcat']['install_user']
  code   <<-EOH
    #{node['tomcat']['dir']}#{node['tomcat']['tomcat_dir']}/bin/shutdown.sh
    #{node['tomcat']['dir']}#{node['tomcat']['tomcat_dir']}/bin/startup.sh
  EOH
end
