VAGRANT_API_VERSION = "2"

Vagrant.configure(VAGRANT_API_VERSION) do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.box_version = "1.0.282"

  config.vm.define :db do |db_config|
    db_config.vm.hostname = "db"
    db_config.vm.network :private_network,
                         :ip => "192.168.33.10"
    db_config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provisioning/playbook.yml"
    end
  end

  config.vm.define :web do |web_config|
    web_config.vm.hostname = "web";
    web_config.vm.network :private_network,
                          :ip => "192.168.33.12"
    web_config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provisioning/playbook.yml"
    end
  end

  # Enable shell provisioning to bootstrap ansible
  config.vm.provision :shell, :path => "bootstrap.sh"
end
