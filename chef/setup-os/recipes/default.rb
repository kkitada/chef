#
# Cookbook Name:: setup-os
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# hosts
file "/opt/chef/chef-repo/cookbooks/setup-os/templates/backup/hosts.bk" do
  content IO.read( "/etc/hosts" )
end
template "/etc/hosts" do
  source "hosts.conf.erb"
end

# network
file "/opt/chef/chef-repo/cookbooks/setup-os/templates/backup/network.bk" do
  content IO.read( "/etc/sysconfig/network" )
end
template "/etc/sysconfig/network" do
  source "network.conf.erb"
end

#localtime
file "/opt/chef/chef-repo/cookbooks/setup-os/templates/backup/localtime.bk" do
  content IO.read( "/etc/localtime" )
end
template "/etc/localtime" do
  source "localtime.Japan.erb"
end

# selinux
file "/opt/chef/chef-repo/cookbooks/setup-os/templates/backup/config.bk" do
  content IO.read( "/etc/selinux/config" )
end
template "/etc/selinux/config" do
  source "selinax.conf.erb"
end

#sshd
file "/opt/chef/chef-repo/cookbooks/setup-os/templates/backup/sshd_config.bk" do
  content IO.read( "/etc/ssh/sshd_config" )
end
template "/etc/ssh/sshd_config" do
  source "sshd_config.erb"
end

#rc.local
file "/opt/chef/chef-repo/cookbooks/setup-os/templates/backup/rc.local.bk" do
  content IO.read( "/etc/rc.d/rc.local" )
end
template "/etc/rc.d/rc.local" do
  source "rc.local.erb"
end

#fstab
file "/opt/chef/chef-repo/cookbooks/setup-os/templates/backup/fstab.bk" do
  content IO.read( "/etc/fstab" )
end
template "/etc/fstab" do
  source "fstab.erb"
end

# deny ipv6
#file "/opt/chef/chef-repo/cookbooks/setup-os/templates/backup/dist.conf.bk" do
#  content IO.read( "/etc/modprobe.d/dist.conf" )
#end
#template "/etc/modprobe.d/dist.conf" do
#  source "dist.conf.erb"
#end

# cloud.cfg
file "/opt/chef/chef-repo/cookbooks/setup-os/templates/backup/cloud.cfg.bk" do
  content IO.read( "/etc/cloud/cloud.cfg" )
end
template "/etc/cloud/cloud.cfg" do
  source "cloud.cfg.erb"
end
