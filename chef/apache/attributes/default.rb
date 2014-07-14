####
### Install Settings
#####
#
### Version
default['apache']['apr_version']    = "apr-1.5.1"
default['apache']['apr-util_version']    = "apr-util-1.5.3"
default['apache']['apache_version']    = "httpd-2.4.9"

#
### SourceFile
default['apache']['apr_src_file'] = "#{default['apache']['apr_version']}.tar.gz"
default['apache']['apr-util_src_file'] = "#{default['apache']['apr-util_version']}.tar.gz"
default['apache']['apache_src_file'] = "#{default['apache']['apache_version']}.tar.gz"

#
### Directory
default['apache']['dir']     = "/opt/"
default['apache']['apr_dir'] = "apr"
default['apache']['apr-util_dir'] = "apr-util"
default['apache']['apache_dir'] = "apache"
default['apache']['httpd_dir'] = "httpd"

#
### User
default['apache']['user']  = "root"
default['apache']['group'] = "root"
default['apache']['mode']  = "00744"

#
### Include files
default['apache']['include_files']  = [
   "httpd-proxy"
#  "httpd-mpm",
#  "httpd-vhosts",
#  "httpd-ssl"
]
#
### Include library
#include_attribute "apache::lib"
#
#
####
## Conf Settings
####
#
## General
#default['apache']['port']            = 80
#default['apache']['port_ssl']        = 443
#default['apache']['directory_index'] = "index.php index.html"
#
## User
#default['apache']['user']         = "www"
#default['apache']['group']        = "www"
#default['apache']['server_admin'] = "you@example.com"
#
## Server
#default['apache']['server_name']   = "locaohost"
#default['apache']['document_root'] = "/usr/local/apache2/htdocs"
#
## Logs
#default['apache']['access_log'] = "#{default['apache']['dir']}/logs/access_log"
#default['apache']['error_log']  = "#{default['apache']['dir']}/logs/error_log"
#
## Prefork
#default['apache']['prefork']['start_servers']         = 5
#default['apache']['prefork']['min_spare_servers']     = 5
#default['apache']['prefork']['max_spare_servers']     = 10
#default['apache']['prefork']['max_clients']           = 150
#default['apache']['prefork']['max_requests_perchild'] = 0
#
## Worker
#default['apache']['worker']['start_servers']         = 2
#default['apache']['worker']['min_spare_threads']     = 25
#default['apache']['worker']['max_spare_threads']     = 75
#default['apache']['worker']['max_clients']           = 150
#default['apache']['worker']['max_requests_perchild'] = 0
#default['apache']['worker']['threads_perchild']      = 25
#
## SSL
#default['apache']['ssl']['session_cache_timeout']  = 300
#default['apache']['ssl']['certificate_file']       = "apr-1.5.1"
#default['apache']['ssl']['certificate_key_file']   = "apr-util-1.5.3"
#default['apache']['ssl']['certificate_chain_file'] = "apache-tomcat-7.0.54"
