# server-configurations-kube

## network

echo '
--node-ip=10.200.0.4
' | sudo tee -a /var/snap/microk8s/current/args/kubelet
sudo snap restart microk8s.daemon-kubelite

https://stackoverflow.com/questions/63451290/microk8s-devops-unable-to-connect-to-the-server-x509-certificate-is-valid-f

https://github.com/canonical/microk8s/issues/4344

## create persistent volume

created persistent volume

microk8s enable hostpath-storage # not production ready
