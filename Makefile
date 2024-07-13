vagrant:
	ansible-playbook -i inventory playbook.yml -e "network_interface=eth1"