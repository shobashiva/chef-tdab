#
# Cookbook Name:: chef-mobileserve
# Recipe:: gulp
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

# Windows doesn't support symlinks due to NTFS.  This creates a shortcut to
# a directory outside the shared folder.  When npm installs dependencies,
# it funnels the files to a safe place outside of the shared file system.
if Dir.exists? "/home/vagrant"
    directory "/home/#{user}/node_modules/webapp/node_modules" do
      owner "#{user}"
      group "#{user}"
      recursive true
      only_if { node['vagrant']['symlink_npm'] }
    end

    link "/home/#{user}/thinkster-django-angular-boilerplate/node_modules" do
      owner "#{user}"
      group "#{user}"
      to "/home/#{user}/node_modules/webapp/node_modules"
      only_if { node['vagrant']['symlink_npm'] }
    end
end

nodejs_npm "django-npm-install" do
  path "/home/#{user}/thinkster-django-angular-boilerplate"
  user "#{user}"
  json true
end


# execute "gulp-webapp" do
#   cwd "/home/#{user}/mobileserve-web-app/mobileserve/base/static"
#   command "gulp less"
#   user "#{user}"
#   group "#{user}"
#   environment "HOME" => "/home/#{user}"
#   action :run
# end
