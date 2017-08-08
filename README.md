# chef-tdab-cookbook

Chef recipes that will get the Thinkster Django Angular tutorial up and running on Vagrant

### Requirements

#### ChefDK

ChefDK includes several utilities for creating and managing chef
resources.  To install it, navigate
[here](https://docs.chef.io/install_dk.html#get-package-run-installer)
and complete the ___Get Package, Run Installer___ and ___Set System
Ruby___ sections.

#### VirtualBox / Vagrant

VirtualBox and Vagrant will provide you with a virtual machine to
provision using this cookbook.  You can download VirtualBox
[here](https://www.virtualbox.org/wiki/Downloads) and Vagrant
[here](https://www.vagrantup.com/downloads.html).

Once those are installed, install a couple of vagrant chef plugins:

```bash
$ vagrant plugin install vagrant-berkshelf
$ vagrant plugin install vagrant-omnibus
```

## Attributes

## Usage

Install the requirements listed above.  Clone this repo so that both the Thinkster Django Angular Boilerplate and this repo are directly under the same parent folder.  The file structure so look like:
```
tree -L 1 .
.
├── chef-tdab
└── <thinkster-django-angular-repo>
```
Change directories into chef-tdab then run vagrant up

```
cd chef-tdab
vagrant up
```

## License and Authors

Author:: Shoba Gowda (<shobashiva17@gmail.com>)
