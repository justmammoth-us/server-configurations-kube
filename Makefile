INVENTORY := -i "inventory.yml"
SSH_CONFIG := --ssh-common-args "-F ssh.config"

init:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) playbooks/k8s.playbook.yml

ssh:
	ssh -L 8080:localhost:32080 -L 8443:localhost:32443 -F ssh.config master

service-whoami:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) services/whoami/playbook.yaml

service-authentik:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) services/authentik/playbook.yaml

service-traefik:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) services/traefik/playbook.yaml

service-jellyfin:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) services/jellyfin/playbook.yaml

service-media-storage:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) services/media-storage/playbook.yaml

service-radarr:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) services/radarr/playbook.yaml

service-sonarr:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) services/sonarr/playbook.yaml

service-qbittorrent:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) services/qbittorrent/playbook.yaml
