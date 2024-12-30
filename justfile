inventory_file := "inventory.yaml"
ssh_file := "ssh.config"

ssh_config := "-F " + ssh_file
ansible_config := "-i " + inventory_file + " --ssh-common-args '" + ssh_config + "'"

test:
	echo "{{ansible_config}}"

init:
	ansible-playbook {{ansible_config}} playbooks/k8s.playbook.yaml

ssh:
	ssh {{ssh_config}} -L 8080:localhost:32080 -L 8443:localhost:32443 master-1

service name state="present":
	ansible-playbook {{ansible_config}} \
		-e @secrets.yaml \
		-e "service_state={{state}}" \
		--tags {{name}} \
		playbooks/services.playbook.yaml 

ping:
	ansible {{ansible_config}} -m ping all
