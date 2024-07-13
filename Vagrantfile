# Vagrantfile
Vagrant.configure("2") do |config|

    # Define the base box to use for all VMs
    config.vm.box = "debian/bookworm64"
  
    # Define master
    config.vm.define "master" do |master|
      master.vm.hostname = "master"
      master.vm.network "private_network", ip: "192.168.60.4"
      master.vm.provider "virtualbox" do |vb|
        vb.name = "master"
        vb.memory = "2048"
        vb.cpus = 2
      end
    end
  
    # Define worker1
    config.vm.define "worker1" do |worker1|
      worker1.vm.hostname = "worker1"
      worker1.vm.network "private_network", ip: "192.168.60.5"
      worker1.vm.provider "virtualbox" do |vb|
        vb.name = "worker1"
        vb.memory = "2048"
        vb.cpus = 2
      end
    end
  
    # # Define worker2
    # config.vm.define "worker2" do |worker2|
    #   worker2.vm.hostname = "worker2"
    #   worker2.vm.network "private_network", ip: "192.168.60.6"
    #   worker2.vm.provider "virtualbox" do |vb|
    #     vb.name = "worker2"
    #     vb.memory = "2048"
    #     vb.cpus = 2
    #   end
    # end
  
  end