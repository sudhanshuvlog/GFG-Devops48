[root@ip-172-31-32-211 /]# history
    1  cd /
    2  yum install docker -y
    3  systemctl start docker
    4  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
    5  sudo rpm -Uvh minikube-latest.x86_64.rpm
    6  minikube start --force
    7  curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.32.0/2024-12-20/bin/linux/amd64/kubectl
    8  chmod +x ./kubectl
    9  cp ./kubectl /usr/bin/
   10  sudo iptables -t nat -A DOCKER -p tcp --dport 80 -j DNAT --to-destination $(minikube ip):80
   11  sudo iptables -t nat -A DOCKER -p tcp --dport 443 -j DNAT --to-destination $(minikube ip):443
   12  vi /etc/host
   13  vi /etc/hosts
   14  curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
   15  helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
   16  helm repo update
   17  helm install nginx-ingress ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace
   18  kubectl create deployment example-app --image=gcr.io/google-samples/hello-app:1.0
   19  kubectl expose deployment example-app --port=8080 --target-port=8080 --name=example-service
   20  kubectl get pods
   21  kubectl get svc
   22  vi ingress.yml
   23  kubectl apply -f ingress.yml 
   24  helm repo add jetstack https://charts.jetstack.io
   25  helm repo update
   26  kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.10.1/cert-manager.crds.yaml
   27  kubectl create namespace cert-manager
   28  helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.10.1
   29  kubectl get pods --namespace cert-manager
   30  vi cert.yml
   31  kubectl apply -f cert.yml 
   32  kubectl get svc
   33  curl https://example.local -k
   34  cat /etc/hosts 
   35  vi self-sign-cluster-issuer.yaml
   36  kubectl apply -f self-sign-cluster-issuer.yaml 
   37  cat /etc/hosts 
   38  curl https://example.local -k
   39  curl https://example.local
   40  vi /etc/hosts 
   41  curl https://example.local
   42  curl https://example.local
   43  curl https://example.local
   44  curl https://example.local
   45  sudo iptables -t nat -A DOCKER -p tcp --dport 443 -j DNAT --to-destination $(minikube ip):443
   46  curl https://example.local
   47  curl http://example.local
   48  kubectl get pods
   49  kubectl get svc
   50  cat /etc/hosts 
   51  vi /etc/hosts 
   52  helm install nginx-ingress ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace
   53  minikube addons enable ingress
   54  curl http://example.local
   55  curl http://example.local
   56  curl https://example.local
   57  curl https://example.local -k
   58  history
   59  cd /
   60  cat /etc/hosts 
   61  cd /
   62  ls
   63  history
[root@ip-172-31-32-211 /]# curl https://example.local -k
Hello, world!
Version: 1.0.0
Hostname: example-app-78ddff8b9f-r98xl