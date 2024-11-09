INVENTORY := -i "inventory.yaml"
SSH_CONFIG := --ssh-common-args "-F ssh.config"

init:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) playbooks/k8s.playbook.yaml

ssh:
	ssh -L 8080:localhost:32080 -L 8443:localhost:32443 -F ssh.config master-1

service:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) playbooks/services.playbook.yaml --tags all

service-whoami:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) configs/whoami/playbook.yaml

service-authentik:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) configs/authentik/playbook.yaml

service-traefik:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) configs/traefik/playbook.yaml

service-jellyfin:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) configs/jellyfin/playbook.yaml

service-media-storage:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) configs/media-storage/playbook.yaml

service-radarr:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) configs/radarr/playbook.yaml

service-sonarr:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) configs/sonarr/playbook.yaml

service-transmission:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) configs/transmission/playbook.yaml

service-jackett:
	ansible-playbook $(INVENTORY) $(SSH_CONFIG) configs/jackett/playbook.yaml

deploy-transmission:
	helm upgrade --install \
	transmission oci://tccr.io/truecharts/transmission \
	--values configs/commons/k8s/helm/truecharts-gluetun-values.yaml \
	--values configs/transmission/k8s/helm/transmission-values.yaml
