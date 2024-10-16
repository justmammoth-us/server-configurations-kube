inventory := -i "inventory.yml"
ssh_config := --ssh-common-args "-F ssh.config"

init:
	ansible-playbook $(inventory) $(ssh_config) playbooks/k8s.playbook.yml

ssh:
	ssh -L 8080:localhost:32080 -L 8443:localhost:32443 -F ssh.config master

service-whoami:
	ansible-playbook $(inventory) $(ssh_config) services/whoami/playbook.yaml

service-authentik:
	ansible-playbook $(inventory) $(ssh_config) services/authentik/playbook.yaml

service-traefik:
	ansible-playbook $(inventory) $(ssh_config) services/traefik/playbook.yaml

service-jellyfin:
	ansible-playbook $(inventory) $(ssh_config) services/jellyfin/playbook.yaml