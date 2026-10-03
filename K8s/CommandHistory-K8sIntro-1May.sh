yum install -y docker
systemctl start docker
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
sudo rpm -Uvh minikube-latest.x86_64.rpm
minikube start --force
docker ps
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.36.2/2026-07-05/bin/linux/amd64/kubectl
chmod +x kubectl 
ls -l
./kubectl 
cp kubectl /usr/local/bin/
date
which date
./kubectl 
kubectl get pods
kubectl run mypod --image=nginx
kubectl get pods
kubectl describe pod mypod
kubectl exec -it mypod -- /bin/bash
kubectl create deployment gfgdeployment --image=nginx
kubectl delete pod gfgdeployment-7cdd6c774b-kbzg4
kubectl get rs
kubectl get pods
kubectl describe pod gfgdeployment-7cdd6c774b-7c47h
curl 10.244.0.5
docker ps
docker exec -it minikube bash
docker ps
kubectl expose deployment gfgdeployment --port 80 --type=NodePort
kubectl get svc
minikube ip
ping 192.168.49.2
curl 192.168.49.2:31267
history