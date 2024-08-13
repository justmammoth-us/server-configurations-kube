export DEPLOY_ACTION="create"

# kubectl $DEPLOY_ACTION  -f services/proxy/traefik.service.yml \
#                 -f services/proxy/traefik-dashboard.service.yml \
#                 -f services/proxy/traefik.deployment.yml \
#                 -f services/proxy/traefik.role.yml \
#                 -f services/proxy/traefik.rolebinding.yml \
#                 -f services/proxy/traefik.account.yml \
#                 -f services/proxy/traefik.ingress.yml

kubectl $DEPLOY_ACTION  -f services/test/test.deployment.yml \
                -f services/test/test.ingress.yml \
                -f services/test/test.service.yml