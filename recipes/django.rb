#
# Cookbook Name:: chef-mobileserve
# Recipe:: django
#
# Copyright (C) 2016 Chris Allen
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'python'
include_recipe "python::pip"
include_recipe "nodejs::npm"

if Dir.exists? "/home/vagrant"
  user = "vagrant"
else
  user = "ubuntu"
end
virtualenv = "/home/#{user}/env"

python_pip "--exists-action w -r /home/#{user}/thinkster-django-angular-boilerplate/requirements.txt" do
    virtualenv "#{virtualenv}"
    user "#{user}"
    group "#{user}"
end

bash "syncdb" do
  code "#{virtualenv}/bin/python manage.py syncdb --noinput"
  cwd "/home/#{user}/thinkster-django-angular-boilerplate"
end


service "apache2" do
  ignore_failure true
  action [ :restart ]
  notifies :run, 'bash[collectstatic]', :immediately
end

bash "collectstatic" do
  code "echo 'yes' | #{virtualenv}/bin/python manage.py collectstatic"
  cwd "/home/#{user}/mobileserve-web-app/mobileserve"
  only_if { ::Dir.exists?("/home/#{user}/mobileserve-web-app/mobileserve") }
  action :nothing
end