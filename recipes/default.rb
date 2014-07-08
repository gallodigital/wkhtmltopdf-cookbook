cache_dir = Chef::Config[:file_cache_path]

case node['platform']
when "debian", "ubuntu"
  download_destination = File.join(cache_dir, "wkhtmltopdf.tar.bz2")
  binary_destination   = File.join(cache_dir, "wkhtmltopdf-#{node['wkhtmltopdf']['arch']}")

  remote_file download_destination do
    source node['wkhtmltopdf']['static_download_url']
    mode "0644"
    action :create_if_missing
  end

  execute "Extract wkhtmltopdf archive" do
    command "tar jxvf #{download_destination} -C #{cache_dir}"
    creates binary_destination
  end

  execute "Copy wkhtmltopdf binary to search path" do
    command "cp #{binary_destination} /usr/local/bin/wkhtmltopdf"
    creates "/usr/local/bin/wkhtmltopdf"
  end

when "centos", "amazon"
  download_destination = File.join(cache_dir, "wkhtmltox.rpm")

  remote_file download_destination do
    source node['wkhtmltopdf']['static_download_url']
    mode "0644"
    action :create_if_missing
  end

  rpm_package "wkhtmltox" do
    source download_destination
    action :install
  end
end