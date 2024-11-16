services := all
state := present

INVENTORY := -i "inventory.yaml"
SSH_CONFIG := --ssh-common-args "-F ssh.config"

init:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) playbooks/k8s.playbook.yaml

ssh:
	ssh -L 8080:localhost:32080 -L 8443:localhost:32443 -F ssh.config master-1

service:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) \
		-e @secrets.yaml \
		-e "service_state=$(state)" \
		--tags $(services) \
		playbooks/services.playbook.yaml 
