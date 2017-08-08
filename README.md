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

### chef-tdab::default

Include `chef-tdab` in your node's `run_list`:

```
{
  "run_list": [
    "recipe[chef-tdab::default]"
  ]
}
```

## License and Authors

Author:: Shoba Gowda (<shobashiva17@gmail.com>)
