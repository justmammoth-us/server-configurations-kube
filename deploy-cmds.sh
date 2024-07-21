kubectl create  -f services/proxy/traefik.service.yml \
                -f services/proxy/traefik-dashboard.service.yml \
                -f services/proxy/traefik.deployment.yml \
                -f services/proxy/traefik.role.yml \
                -f services/proxy/traefik.rolebinding.yml \
                -f services/proxy/traefik.account.yml

kubectl create  -f services/test/test.deployment.yml \
                -f services/test/test.ingress.yml \
                -f services/test/test.service.yml