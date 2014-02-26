# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "verify_skeleton-berkshelf"
  config.vm.box = "saucy-server-cloudimg-amd64-vagrant-disk1"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.boot_timeout = 120

  config.vm.network :private_network, ip: "33.33.33.10"
  # example: config.vm.network "forwarded_port", guest: 80, host: 8000
  config.ssh.forward_agent = true

  # enable cachier if it is installed
  if Vagrant.has_plugin?("vagrant-cachier")
    puts 'INFO:  Vagrant-cachier plugin detected.'
    config.cache.auto_detect = true
  else
    puts 'WARN:  Vagrant-cachier plugin not detected. Continuing unoptimized.'
  end

  # Detects vagrant-omnibus plugin
  if Vagrant.has_plugin?('Omnibus') || Vagrant.has_plugin?('vagrant-omnibus')
    puts 'INFO:  Vagrant-omnibus plugin detected.'
    config.omnibus.chef_version = :latest
  else
    puts "FATAL: Vagrant-omnibus plugin not detected. Please install the plugin with\n       'vagrant plugin install vagrant-omnibus' from any other directory\n       before continuing."
    exit
  end

  # Detects vagrant-berkshelf plugin
  if Vagrant.has_plugin?('berkshelf')
    # The path to the Berksfile to use with Vagrant Berkshelf
    puts 'INFO:  Vagrant-berkshelf plugin detected.'
    config.berkshelf.berksfile_path = './Berksfile'
  else
    puts "FATAL: Vagrant-berkshelf plugin not detected. Please install the plugin with\n       'vagrant plugin install vagrant-berkshelf' from any other directory\n       before continuing."
    exit
  end

  # Detects chef_zero plugin
  if Vagrant.has_plugin?('chef_zero')
    puts 'INFO:  vagrant-chef-zero plugin detected.'
  else
    puts "FATAL: vagrant-chef-zero plugin not detected. Please install the plugin with\n       'vagrant plugin install vagrant-chef-zero' from any other directory\n       before continuing."
    exit
  end

  config.vm.provision :chef_client do |chef|
	chef.arguments = '--force-formatter' # pretty output
    chef.json = {}
    chef.run_list = [
        "recipe[verify_skeleton::default]"
    ]
  end

  # give the VM a bit of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
end
