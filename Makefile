services := all
state := present

INVENTORY := inventory.yaml
SSH_CONFIG := -F ssh.config

ANSIBLE_CONFIG := -i "$(INVENTORY)" --ssh-common-args "$(SSH_CONFIG)"

init:
	ansible-playbook $(ANSIBLE_CONFIG) playbooks/k8s.playbook.yaml

ssh:
	ssh $(SSH_CONFIG) -L 8080:localhost:32080 -L 8443:localhost:32443 master-1

service:
	ansible-playbook $(ANSIBLE_CONFIG) \
		-e @secrets.yaml \
		-e "service_state=$(state)" \
		--tags $(services) \
		playbooks/services.playbook.yaml 

ping:
	ansible $(ANSIBLE_CONFIG) -m ping all
