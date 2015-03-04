# FIXME: Make this support other platforms better.
default['wkhtmltopdf']['arch'] = "amd64"
default['wkhtmltopdf']['platform'] = "centos6"
default['wkhtmltopdf']['version'] = "0.12.2.1"
default['wkhtmltopdf']['static_download_url'] = "http://downloads.sourceforge.net/project/wkhtmltopdf/#{node['wkhtmltopdf']['version']}/wkhtmltox-#{node['wkhtmltopdf']['version']}_linux-#{node['wkhtmltopdf']['platform']}-#{node['wkhtmltopdf']['arch']}.rpm"
