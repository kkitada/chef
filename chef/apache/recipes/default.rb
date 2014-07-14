#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# Install library
# include_recipe "apache::lib"

#APR install
cookbook_file "#{node['apache']['dir']}#{node['apache']['apr_src_file']}" do
  source node['apache']['apr_src_file']
  owner node['apache']['user']
  group node['apache']['group']
#  mode node['apache']['mode']
  mode 00744
end

bash "install APR" do
#  user     node['apache']['user']
  cwd      node['apache']['dir']
  not_if   "ls #{node['apache']['dir']}#{node['apache']['apr_dir']}"
  code   <<-EOH
    tar xzf #{node['apache']['apr_src_file']}
    cd #{node['apache']['apr_version']}
    ./configure --prefix=#{node['apache']['dir']}#{node['apache']['apr_dir']}
    make
    make install
    cd
    rm -rf #{node['apache']['dir']}#{node['apache']['apr_version']}
  EOH
end


#APR-util install
cookbook_file "#{node['apache']['dir']}#{node['apache']['apr-util_src_file']}" do
  source node['apache']['apr-util_src_file']
  owner node['apache']['user']
  group node['apache']['group']
#  mode "#node['apache']['mode']"
  mode 00744
end

bash "install APR-Util" do
 # user     node['apache']['user']
  cwd      node['apache']['dir']
  not_if   "ls #{node['apache']['dir']}#{node['apache']['apr-util_dir']}"
  code   <<-EOH
    tar -xzf #{node['apache']['apr-util_src_file']}
    cd #{node['apache']['apr-util_version']}
    ./configure --prefix=#{node['apache']['dir']}#{node['apache']['apr-util_dir']}  --with-apr=#{node['apache']['dir']}#{node['apache']['apr_dir']}
    make
    make install
    cd
    rm -rf #{node['apache']['dir']}#{node['apache']['apr-util_version']}
  EOH
end


# install apache
cookbook_file "#{node['apache']['dir']}#{node['apache']['apache_src_file']}" do
  source node['apache']['apache_src_file']
  owner node['apache']['user']
  group node['apache']['group']
#  mode "#node['apache']['mode']"
  mode 00744
end

bash "install apache" do
  user     node['apache']['user']
  cwd      node['apache']['dir']
  not_if   "ls #{node['apache']['dir']}#{node['apache']['apache_dir']}"
  notifies :run, 'bash[start apache]', :immediately
  code   <<-EOH
    tar xzf #{node['apache']['apache_src_file']}
    cd #{node['apache']['apache_version']}
    ./configure --prefix=#{node['apache']['dir']}#{node['apache']['apache_dir']} --with-apr-util=#{node['apache']['dir']}#{node['apache']['apr-util_dir']}  --with-apr=#{node['apache']['dir']}#{node['apache']['apr_dir']}
    make
    make install
    cd
    rm -rf #{node['apache']['dir']}#{node['apache']['apache_version']}
  EOH
end

# Modify conf
template "#{node['apache']['dir']}#{node['apache']['apache_dir']}/conf/httpd.conf" do
  source   "httpd.conf.erb"
  owner    node['apache']['user']
  group    node['apache']['group']
  mode     00644
  notifies :run, 'bash[restart apache]', :immediately
end

#
# Modify extra conf
for include_file in node['apache']['include_files']
  template "#{node['apache']['dir']}#{node['apache']['apache_dir']}/conf/extra/#{include_file}.conf" do
    source   "#{include_file}.conf.erb"
    owner    node['apache']['user']
    group    node['apache']['group']
    mode     00644
    notifies :run, 'bash[restart apache]', :immediately
  end
end

# Delete pakage
bash "Delete pkg file" do
  only_if "ls #node['apache']['dir']*.tar.gz"
  code   <<-EOH
    rm -f #{node['apache']['dir']}*.tar.gz
  EOH
end

# AutoStart
template "/etc/init.d/httpd" do
  source   "httpd.erb"
  owner    node['apache']['user']
  group    node['apache']['group']
  mode     00755
  not_if "ls /etc/init.d/httpd"
  notifies :run, 'bash[add service apache]', :immediately
end
bash "add service apache" do
  action :nothing
  user   node['apache']['user']
  code   <<-EOH
    chkconfig --add httpd
    chkconfig httpd on 
  EOH
  notifies :run, 'bash[start apache]', :immediately
end

# Bashs
bash "start apache" do
  action :nothing
#  flags  '-ex'
  user   node['apache']['install_user']
  code   <<-EOH
    #{node['apache']['dir']}#{node['apache']['apache_dir']}/bin/apachectl start
  EOH
end

bash "restart apache" do
  action :nothing
#  flags  '-ex'
  user   node['apache']['install_user']
  code   <<-EOH
    #{node['apache']['dir']}#{node['apache']['apache_dir']}/bin/apachectl restart
  EOH
end
