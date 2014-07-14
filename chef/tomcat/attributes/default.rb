####
### Install Settings
#####
#
### Version
default['tomcat']['tomcat_version']    = "apache-tomcat-7.0.54"

#
### SourceFile
default['tomcat']['tomcat_src_file'] = "#{default['tomcat']['tomcat_version']}.tar.gz"
#default['tomcat']['remote_uri'] = "http://ftp.meisei-u.ac.jp/mirror/tomcat/dist//httpd/#{default['tomcat']['file_name']}"
#
### Directory
default['tomcat']['dir']     = "/opt/"
default['tomcat']['tomcat_dir'] = "tomcat"

#
### User
default['tomcat']['user']  = "root"
default['tomcat']['group'] = "root"
default['tomcat']['mode']  = "00744"

#
### AppDirectory
default['tomcat']['apahce_file_name']   = "tomcat"
#default['tomcat']['configure']  = "--prefix=#{default['tomcat']['dir']} --enable-ssl --with-ssl --enable-rewrite=shared --enable-headers=shared --enable-so --with-mpm=prefork"
#
### Include files
#default['tomcat']['include_files']  = [
#  "httpd-mpm",
#  "httpd-vhosts",
#  "httpd-ssl"
#]
#
### Include library
#include_attribute "tomcat::lib"
#
#
####
## Conf Settings
####
#
## General
#default['tomcat']['port']            = 80
#default['tomcat']['port_ssl']        = 443
#default['tomcat']['directory_index'] = "index.php index.html"
#
## User
#default['tomcat']['user']         = "www"
#default['tomcat']['group']        = "www"
#default['tomcat']['server_admin'] = "you@example.com"
#
## Server
#default['tomcat']['server_name']   = "locaohost"
#default['tomcat']['document_root'] = "/usr/local/tomcat2/htdocs"
#
## Logs
#default['tomcat']['access_log'] = "#{default['tomcat']['dir']}/logs/access_log"
#default['tomcat']['error_log']  = "#{default['tomcat']['dir']}/logs/error_log"
#
## Prefork
#default['tomcat']['prefork']['start_servers']         = 5
#default['tomcat']['prefork']['min_spare_servers']     = 5
#default['tomcat']['prefork']['max_spare_servers']     = 10
#default['tomcat']['prefork']['max_clients']           = 150
#default['tomcat']['prefork']['max_requests_perchild'] = 0
#
## Worker
#default['tomcat']['worker']['start_servers']         = 2
#default['tomcat']['worker']['min_spare_threads']     = 25
#default['tomcat']['worker']['max_spare_threads']     = 75
#default['tomcat']['worker']['max_clients']           = 150
#default['tomcat']['worker']['max_requests_perchild'] = 0
#default['tomcat']['worker']['threads_perchild']      = 25
#
## SSL
#default['tomcat']['ssl']['session_cache_timeout']  = 300
#default['tomcat']['ssl']['certificate_file']       = "tom-1.5.1"
#default['tomcat']['ssl']['certificate_key_file']   = "tom-util-1.5.3"
#default['tomcat']['ssl']['certificate_chain_file'] = "tomcat-tomcat-7.0.54"
