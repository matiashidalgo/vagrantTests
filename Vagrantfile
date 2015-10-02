# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
VAGRANTFILE_API_VERSION = "2"
#Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  #config.vm.box = "base"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
#end

    # Vagrant for host with Nginx proxy (LB SERVER)
    Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
        config.vm.box = "debian7"
        config.vm.box_url = "http://vagrant.summasolutions.net/debian7.box"

        config.vm.provision :shell, :inline => "echo 'export LC_CTYPE=\"en_US.UTF-8\"' >> /home/vagrant/.bashrc"
        config.vm.provision :shell, :path => "bin/lbserver/bootstrap.sh"
        config.vm.provision :shell, :path => "bin/lbserver/init.sh", :privileged => false

        config.ssh.shell = "bash -l"

        config.ssh.username = "vagrant"
        config.ssh.keep_alive = true
        config.ssh.forward_agent = false
        config.ssh.forward_x11 = false
        config.vagrant.host = :detect

        require 'ffi'
        if FFI::Platform::IS_WINDOWS
            print "\n\n ===> win\n\n"
            config.vm.synced_folder ".", "/vagrant", type: "smb"
        else
            print "\n\n ===> not win\n\n"
            config.vm.synced_folder ".", "/vagrant", type: "nfs"
        end

        config.vm.network "private_network", ip: "33.33.33.100"
        config.vm.network "public_network", ip: "192.168.10.250" , bridge: 'eth0'

        # load local customizations if available
        _local = File.dirname(__FILE__) + '/Vagrantfile.debian.local'
        if File.exists?(_local) and File.readable?(_local)
            eval(IO.read(_local))
        end
    end


    # Vagrant for host with Nginx HTTP server + PHP FPM 5.4
    Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
        config.vm.box = "debian7"
        config.vm.box_url = "http://vagrant.summasolutions.net/debian7.box"

        config.vm.provision :shell, :inline => "echo 'export LC_CTYPE=\"en_US.UTF-8\"' >> /home/vagrant/.bashrc"
        config.vm.provision :shell, :path => "bin/debian7/nginx/bootstrap.sh"
        config.vm.provision :shell, :path => "bin/debian7/nginx/init.sh", :privileged => false

        config.ssh.shell = "bash -l"

        config.ssh.username = "vagrant"
        config.ssh.keep_alive = true
        config.ssh.forward_agent = false
        config.ssh.forward_x11 = false
        config.vagrant.host = :detect

        require 'ffi'
        if FFI::Platform::IS_WINDOWS
            print "\n\n ===> win\n\n"
            config.vm.synced_folder ".", "/vagrant", type: "smb"
        else
            print "\n\n ===> not win\n\n"
            config.vm.synced_folder ".", "/vagrant", type: "nfs"
        end

        config.vm.network "private_network", ip: "33.33.33.102"
        # config.vm.network "public_network", ip: "192.168.10.251" , bridge: 'eth0'

        # load local customizations if available
        _local = File.dirname(__FILE__) + '/Vagrantfile.debian.local'
        if File.exists?(_local) and File.readable?(_local)
            eval(IO.read(_local))
        end
    end

    # Vagrant for host with Apache 2.4 + PHP 5.5
    Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
        config.vm.box = "ubuntu14.04"
        config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

        config.vm.provision :shell, :inline => "echo 'export LC_CTYPE=\"en_US.UTF-8\"' >> /home/vagrant/.bashrc"
        config.vm.provision :shell, :path => "bin/ubuntu1404/bootstrap.sh"
        config.vm.provision :shell, :path => "bin/ubuntu1404/init.sh", :privileged => false

        config.ssh.shell = "bash -l"

        config.ssh.username = "vagrant"
        config.ssh.keep_alive = true
        config.ssh.forward_agent = false
        config.ssh.forward_x11 = false
        config.vagrant.host = :detect


        require 'ffi'
        if FFI::Platform::IS_WINDOWS
            print "\n\n ===> win\n\n"
            config.vm.synced_folder ".", "/vagrant", type: "smb"
        else
            print "\n\n ===> not win\n\n"
            config.vm.synced_folder ".", "/vagrant", type: "nfs"
        end

        config.vm.network "private_network", ip: "33.33.33.101"
        # config.vm.network "public_network", ip: "192.168.10.251" , bridge: 'eth0'

        # load local customizations if available
        _local = File.dirname(__FILE__) + '/Vagrantfile.ubuntu.local'
        if File.exists?(_local) and File.readable?(_local)
            eval(IO.read(_local))
        end
    end

    # Vagrant for host with MySQL (DB SERVER)
    Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
        config.vm.box = "debian7"
        config.vm.box_url = "http://vagrant.summasolutions.net/debian7.box"

        config.vm.provision :shell, :inline => "echo 'export LC_CTYPE=\"en_US.UTF-8\"' >> /home/vagrant/.bashrc"
        config.vm.provision :shell, :path => "bin/dbserver/bootstrap.sh"
        config.vm.provision :shell, :path => "bin/dbserver/init.sh", :privileged => false

        config.ssh.shell = "bash -l"

        config.ssh.username = "vagrant"
        config.ssh.keep_alive = true
        config.ssh.forward_agent = false
        config.ssh.forward_x11 = false
        config.vagrant.host = :detect

        require 'ffi'
        if FFI::Platform::IS_WINDOWS
            print "\n\n ===> win\n\n"
            config.vm.synced_folder ".", "/vagrant", type: "smb"
        else
            print "\n\n ===> not win\n\n"
            config.vm.synced_folder ".", "/vagrant", type: "nfs"
        end

        config.vm.network "private_network", ip: "33.33.33.150"

    end