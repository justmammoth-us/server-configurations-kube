vagrant:
	ansible-playbook -i inventory init.playbook.yml -e "network_interface=eth1"

vagrant-recreate:
	vagrant destroy --force && vagrant up