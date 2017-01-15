#
# Cookbook Name:: chef-mobileserve
# Recipe:: system
#
# Copyright (C) 2016 Shoba Gowda
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'python'
include_recipe "python::pip"
python_pip "virtualenv" do
  action :install
end

if Dir.exists? "/home/vagrant"
    user = "vagrant"
else
  user = "ubuntu"
end
virtualenv = "/home/#{user}/env"

package "my packages" do
  package_name [
    # Django
    "git",
    "python3",
    "python3-dev",
    "libpq-dev",
    "libffi-dev",
    "libjpeg-dev"
  ]
  action :install
end

include_recipe "nodejs::npm"
execute "first_npm" do
  command "sudo npm -g install npm@latest"
  action :run
end

execute "second_npm" do
  command "sudo npm install -g bower"
  action :run
end

execute "third_npm" do
  command "sudo npm install"
  action :run
end

execute "bower_npm" do
  command "bower install cache clean --allow-root"
  action :run
end

# NOTE: This will fail with SSL errors if owner/group isn't specified
python_virtualenv "#{virtualenv}" do
    interpreter "/usr/bin/python3"
    owner "#{user}"
    group "#{user}"
    action :create
end