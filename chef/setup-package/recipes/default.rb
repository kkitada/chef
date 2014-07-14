#
# Cookbook Name:: setup-package
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# install package
%w{gcc make pcre pcre-devel java-1.7.0-openjdk java-1.7.0-openjdk-devel }.each do |pkg|
   package pkg do
      action :install
   end
end
