   ,     #_
   ~\_  ####_        Amazon Linux 2023
  ~~  \_#####\
  ~~     \###|
  ~~       \#/ ___   https://aws.amazon.com/linux/amazon-linux-2023
   ~~       V~' '->
    ~~~         /
      ~~._.   _/
         _/ _/
       _/m/'
[ec2-user@ip-172-31-9-35 ~]$ sudo su root
[root@ip-172-31-9-35 ec2-user]# cd /
[root@ip-172-31-9-35 /]# 
[root@ip-172-31-9-35 /]# 
[root@ip-172-31-9-35 /]# 
[root@ip-172-31-9-35 /]# yum install docker -y
systemctl start docker
Amazon Linux 2023 Kernel Livepatch repository                                                                                                              945 kB/s |  97 kB     00:00    
Dependencies resolved.
===========================================================================================================================================================================================
 Package                                            Architecture                       Version                                               Repository                               Size
===========================================================================================================================================================================================
Installing:
 docker                                             x86_64                             25.0.18-1.amzn2023.0.3                                amazonlinux                              49 M
Installing dependencies:
 container-selinux                                  noarch                             4:2.245.0-1.amzn2023                                  amazonlinux                              58 k
 containerd                                         x86_64                             2.3.7-1.amzn2023.0.3                                  amazonlinux                              24 M
 iptables-libs                                      x86_64                             1.8.8-3.amzn2023.0.2                                  amazonlinux                             401 k
 iptables-nft                                       x86_64                             1.8.8-3.amzn2023.0.2                                  amazonlinux                             183 k
 libcgroup                                          x86_64                             3.0-1.amzn2023.0.1                                    amazonlinux                              75 k
 libnetfilter_conntrack                             x86_64                             1.0.8-2.amzn2023.0.2                                  amazonlinux                              58 k
 libnfnetlink                                       x86_64                             1.0.1-19.amzn2023.0.2                                 amazonlinux                              30 k
 libnftnl                                           x86_64                             1.2.2-2.amzn2023.0.2                                  amazonlinux                              84 k
 pigz                                               x86_64                             2.5-1.amzn2023.0.4                                    amazonlinux                              83 k
 runc                                               x86_64                             1.4.3-1.amzn2023.0.3                                  amazonlinux                             3.7 M

Transaction Summary
===========================================================================================================================================================================================
Install  11 Packages

Total download size: 77 M
Installed size: 290 M
Downloading Packages:
(1/11): container-selinux-2.245.0-1.amzn2023.noarch.rpm                                                                                                    2.3 MB/s |  58 kB     00:00    
(2/11): iptables-libs-1.8.8-3.amzn2023.0.2.x86_64.rpm                                                                                                       12 MB/s | 401 kB     00:00    
(3/11): iptables-nft-1.8.8-3.amzn2023.0.2.x86_64.rpm                                                                                                       6.9 MB/s | 183 kB     00:00    
(4/11): libcgroup-3.0-1.amzn2023.0.1.x86_64.rpm                                                                                                            2.7 MB/s |  75 kB     00:00    
(5/11): libnetfilter_conntrack-1.0.8-2.amzn2023.0.2.x86_64.rpm                                                                                             2.1 MB/s |  58 kB     00:00    
(6/11): libnfnetlink-1.0.1-19.amzn2023.0.2.x86_64.rpm                                                                                                      1.2 MB/s |  30 kB     00:00    
(7/11): libnftnl-1.2.2-2.amzn2023.0.2.x86_64.rpm                                                                                                           3.3 MB/s |  84 kB     00:00    
(8/11): pigz-2.5-1.amzn2023.0.4.x86_64.rpm                                                                                                                 2.6 MB/s |  83 kB     00:00    
(9/11): runc-1.4.3-1.amzn2023.0.3.x86_64.rpm                                                                                                                30 MB/s | 3.7 MB     00:00    
(10/11): containerd-2.3.7-1.amzn2023.0.3.x86_64.rpm                                                                                                         41 MB/s |  24 MB     00:00    
(11/11): docker-25.0.18-1.amzn2023.0.3.x86_64.rpm                                                                                                           48 MB/s |  49 MB     00:01    
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                                       73 MB/s |  77 MB     00:01     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                                                   1/1 
  Installing       : runc-1.4.3-1.amzn2023.0.3.x86_64                                                                                                                                 1/11 
  Installing       : containerd-2.3.7-1.amzn2023.0.3.x86_64                                                                                                                           2/11 
  Running scriptlet: containerd-2.3.7-1.amzn2023.0.3.x86_64                                                                                                                           2/11 
  Installing       : pigz-2.5-1.amzn2023.0.4.x86_64                                                                                                                                   3/11 
  Installing       : libnftnl-1.2.2-2.amzn2023.0.2.x86_64                                                                                                                             4/11 
  Installing       : libnfnetlink-1.0.1-19.amzn2023.0.2.x86_64                                                                                                                        5/11 
  Installing       : libnetfilter_conntrack-1.0.8-2.amzn2023.0.2.x86_64                                                                                                               6/11 
  Installing       : iptables-libs-1.8.8-3.amzn2023.0.2.x86_64                                                                                                                        7/11 
  Installing       : iptables-nft-1.8.8-3.amzn2023.0.2.x86_64                                                                                                                         8/11 
  Running scriptlet: iptables-nft-1.8.8-3.amzn2023.0.2.x86_64                                                                                                                         8/11 
  Installing       : libcgroup-3.0-1.amzn2023.0.1.x86_64                                                                                                                              9/11 
  Running scriptlet: container-selinux-4:2.245.0-1.amzn2023.noarch                                                                                                                   10/11 
  Installing       : container-selinux-4:2.245.0-1.amzn2023.noarch                                                                                                                   10/11 
  Running scriptlet: container-selinux-4:2.245.0-1.amzn2023.noarch                                                                                                                   10/11 
  Running scriptlet: docker-25.0.18-1.amzn2023.0.3.x86_64                                                                                                                            11/11 
  Installing       : docker-25.0.18-1.amzn2023.0.3.x86_64                                                                                                                            11/11 
  Running scriptlet: docker-25.0.18-1.amzn2023.0.3.x86_64                                                                                                                            11/11 
Created symlink /etc/systemd/system/sockets.target.wants/docker.socket → /usr/lib/systemd/system/docker.socket.

  Running scriptlet: container-selinux-4:2.245.0-1.amzn2023.noarch                                                                                                                   11/11 
  Running scriptlet: docker-25.0.18-1.amzn2023.0.3.x86_64                                                                                                                            11/11 
  Verifying        : container-selinux-4:2.245.0-1.amzn2023.noarch                                                                                                                    1/11 
  Verifying        : containerd-2.3.7-1.amzn2023.0.3.x86_64                                                                                                                           2/11 
  Verifying        : docker-25.0.18-1.amzn2023.0.3.x86_64                                                                                                                             3/11 
  Verifying        : iptables-libs-1.8.8-3.amzn2023.0.2.x86_64                                                                                                                        4/11 
  Verifying        : iptables-nft-1.8.8-3.amzn2023.0.2.x86_64                                                                                                                         5/11 
  Verifying        : libcgroup-3.0-1.amzn2023.0.1.x86_64                                                                                                                              6/11 
  Verifying        : libnetfilter_conntrack-1.0.8-2.amzn2023.0.2.x86_64                                                                                                               7/11 
  Verifying        : libnfnetlink-1.0.1-19.amzn2023.0.2.x86_64                                                                                                                        8/11 
  Verifying        : libnftnl-1.2.2-2.amzn2023.0.2.x86_64                                                                                                                             9/11 
  Verifying        : pigz-2.5-1.amzn2023.0.4.x86_64                                                                                                                                  10/11 
  Verifying        : runc-1.4.3-1.amzn2023.0.3.x86_64                                                                                                                                11/11 

Installed:
  container-selinux-4:2.245.0-1.amzn2023.noarch   containerd-2.3.7-1.amzn2023.0.3.x86_64   docker-25.0.18-1.amzn2023.0.3.x86_64                 iptables-libs-1.8.8-3.amzn2023.0.2.x86_64  
  iptables-nft-1.8.8-3.amzn2023.0.2.x86_64        libcgroup-3.0-1.amzn2023.0.1.x86_64      libnetfilter_conntrack-1.0.8-2.amzn2023.0.2.x86_64   libnfnetlink-1.0.1-19.amzn2023.0.2.x86_64  
  libnftnl-1.2.2-2.amzn2023.0.2.x86_64            pigz-2.5-1.amzn2023.0.4.x86_64           runc-1.4.3-1.amzn2023.0.3.x86_64                    

Complete!
[root@ip-172-31-9-35 /]# systemctl start docker
[root@ip-172-31-9-35 /]#  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
  % Total    % Received % Xferd  Average Speed  Time    Time    Time   Current
                                 Dload  Upload  Total   Spent   Left   Speed
100 49.25M 100 49.25M   0      0 10.44M      0   00:04   00:04          9.39M
[root@ip-172-31-9-35 /]# sudo rpm -Uvh minikube-latest.x86_64.rpm
minikube start --force
Verifying...                          ################################# [100%]
Preparing...                          ################################# [100%]
Updating / installing...
   1:minikube-1.39.0-0                ################################# [100%]
* minikube v1.39.0 on Amazon 2023.12.20261112 (xen/amd64)
! minikube skips various validations when --force is supplied; this may lead to unexpected behavior
* Automatically selected the docker driver. Other choices: none, ssh
* The "docker" driver should not be used with root privileges. If you wish to continue as root, use --force.
* If you are running minikube within a VM, consider using --driver=none:
*   https://minikube.sigs.k8s.io/docs/reference/drivers/none/

X The requested memory allocation of 3072MiB does not leave room for system overhead (total system memory: 3912MiB). You may face stability issues.
* Suggestion: Start minikube with less memory allocated: 'minikube start --memory=3072mb'

* Using Docker driver with root privileges
* Starting "minikube" primary control-plane node in "minikube" cluster
* Pulling base image v0.0.51 ...
* Downloading Kubernetes v1.37.0 preload ...
    > preloaded-images-k8s-v18-v1...:  347.58 MiB / 347.58 MiB  100.00% 27.48 M
    > gcr.io/k8s-minikube/kicbase:  507.61 MiB / 507.61 MiB  100.00% 14.15 MiB 
* Creating docker container (CPUs=2, Memory=3072MB) ...
* Preparing Kubernetes v1.37.0 on containerd 2.3.4 ...
* Configuring CNI (Container Networking Interface) ...
* Verifying Kubernetes components...
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
* Enabled addons: storage-provisioner, default-storageclass
* kubectl not found. If you need it, try: 'minikube kubectl -- get pods -A'
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
[root@ip-172-31-9-35 /]# curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.36.2/2026-07-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
cp ./kubectl /usr/local/bin/
  % Total    % Received % Xferd  Average Speed  Time    Time    Time   Current
                                 Dload  Upload  Total   Spent   Left   Speed
100 56.81M 100 56.81M   0      0  1.83M      0   00:31   00:31          4.24M
[root@ip-172-31-9-35 /]# 
[root@ip-172-31-9-35 /]# 
[root@ip-172-31-9-35 /]# sudo iptables -t nat -A DOCKER -p tcp --dport 80 -j DNAT --to-destination $(minikube ip):80
sudo iptables -t nat -A DOCKER -p tcp --dport 443 -j DNAT --to-destination $(minikube ip):443
[root@ip-172-31-9-35 /]# vi /etc/hosts
[root@ip-172-31-9-35 /]# minikube ip
192.168.49.2
[root@ip-172-31-9-35 /]# docker ps
CONTAINER ID   IMAGE                                 COMMAND                  CREATED              STATUS              PORTS                                                                                                                                  NAMES
1e77e582e942   gcr.io/k8s-minikube/kicbase:v0.0.51   "/usr/local/bin/entr…"   About a minute ago   Up About a minute   127.0.0.1:32772->22/tcp, 127.0.0.1:32771->2376/tcp, 127.0.0.1:32770->5000/tcp, 127.0.0.1:32769->8443/tcp, 127.0.0.1:32768->32443/tcp   minikube
[root@ip-172-31-9-35 /]# curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
  % Total    % Received % Xferd  Average Speed  Time    Time    Time   Current
                                 Dload  Upload  Total   Spent   Left   Speed
100  12252 100  12252   0      0  52234      0                              0
[WARNING] Could not find git. It is required for plugin installation.
Downloading https://get.helm.sh/helm-v3.22.1-linux-amd64.tar.gz
Verifying checksum... Done.
Preparing to install helm into /usr/local/bin
helm installed into /usr/local/bin/helm
[root@ip-172-31-9-35 /]# yum install git -y
Last metadata expiration check: 0:03:54 ago on Sun Nov 15 05:56:58 2026.
Dependencies resolved.
===========================================================================================================================================================================================
 Package                                       Architecture                        Version                                                  Repository                                Size
===========================================================================================================================================================================================
Installing:
 git                                           x86_64                              2.50.1-1.amzn2023.0.2                                    amazonlinux                               50 k
Installing dependencies:
 git-core                                      x86_64                              2.50.1-1.amzn2023.0.2                                    amazonlinux                              4.9 M
 git-core-doc                                  noarch                              2.50.1-1.amzn2023.0.2                                    amazonlinux                              2.8 M
 perl-Error                                    noarch                              1:0.17030-2.amzn2023.0.1                                 amazonlinux                               42 k
 perl-File-Find                                noarch                              1.37-477.amzn2023.0.11                                   amazonlinux                               26 k
 perl-Git                                      noarch                              2.50.1-1.amzn2023.0.2                                    amazonlinux                               38 k
 perl-TermReadKey                              x86_64                              2.38-9.amzn2023.0.3                                      amazonlinux                               36 k
 perl-lib                                      x86_64                              0.65-477.amzn2023.0.11                                   amazonlinux                               15 k

Transaction Summary
===========================================================================================================================================================================================
Install  8 Packages

Total download size: 8.0 M
Installed size: 41 M
Downloading Packages:
(1/8): git-2.50.1-1.amzn2023.0.2.x86_64.rpm                                                                                                                1.9 MB/s |  50 kB     00:00    
(2/8): perl-Error-0.17030-2.amzn2023.0.1.noarch.rpm                                                                                                        1.4 MB/s |  42 kB     00:00    
(3/8): git-core-2.50.1-1.amzn2023.0.2.x86_64.rpm                                                                                                            51 MB/s | 4.9 MB     00:00    
(4/8): perl-File-Find-1.37-477.amzn2023.0.11.noarch.rpm                                                                                                    580 kB/s |  26 kB     00:00    
(5/8): git-core-doc-2.50.1-1.amzn2023.0.2.noarch.rpm                                                                                                        24 MB/s | 2.8 MB     00:00    
(6/8): perl-Git-2.50.1-1.amzn2023.0.2.noarch.rpm                                                                                                           1.7 MB/s |  38 kB     00:00    
(7/8): perl-TermReadKey-2.38-9.amzn2023.0.3.x86_64.rpm                                                                                                     1.3 MB/s |  36 kB     00:00    
(8/8): perl-lib-0.65-477.amzn2023.0.11.x86_64.rpm                                                                                                          631 kB/s |  15 kB     00:00    
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                                       40 MB/s | 8.0 MB     00:00     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                                                   1/1 
  Installing       : git-core-2.50.1-1.amzn2023.0.2.x86_64                                                                                                                             1/8 
  Installing       : git-core-doc-2.50.1-1.amzn2023.0.2.noarch                                                                                                                         2/8 
  Installing       : perl-lib-0.65-477.amzn2023.0.11.x86_64                                                                                                                            3/8 
  Installing       : perl-TermReadKey-2.38-9.amzn2023.0.3.x86_64                                                                                                                       4/8 
  Installing       : perl-File-Find-1.37-477.amzn2023.0.11.noarch                                                                                                                      5/8 
  Installing       : perl-Error-1:0.17030-2.amzn2023.0.1.noarch                                                                                                                        6/8 
  Installing       : perl-Git-2.50.1-1.amzn2023.0.2.noarch                                                                                                                             7/8 
  Installing       : git-2.50.1-1.amzn2023.0.2.x86_64                                                                                                                                  8/8 
  Running scriptlet: git-2.50.1-1.amzn2023.0.2.x86_64                                                                                                                                  8/8 
  Verifying        : git-2.50.1-1.amzn2023.0.2.x86_64                                                                                                                                  1/8 
  Verifying        : git-core-2.50.1-1.amzn2023.0.2.x86_64                                                                                                                             2/8 
  Verifying        : git-core-doc-2.50.1-1.amzn2023.0.2.noarch                                                                                                                         3/8 
  Verifying        : perl-Error-1:0.17030-2.amzn2023.0.1.noarch                                                                                                                        4/8 
  Verifying        : perl-File-Find-1.37-477.amzn2023.0.11.noarch                                                                                                                      5/8 
  Verifying        : perl-Git-2.50.1-1.amzn2023.0.2.noarch                                                                                                                             6/8 
  Verifying        : perl-TermReadKey-2.38-9.amzn2023.0.3.x86_64                                                                                                                       7/8 
  Verifying        : perl-lib-0.65-477.amzn2023.0.11.x86_64                                                                                                                            8/8 

Installed:
  git-2.50.1-1.amzn2023.0.2.x86_64                 git-core-2.50.1-1.amzn2023.0.2.x86_64     git-core-doc-2.50.1-1.amzn2023.0.2.noarch       perl-Error-1:0.17030-2.amzn2023.0.1.noarch    
  perl-File-Find-1.37-477.amzn2023.0.11.noarch     perl-Git-2.50.1-1.amzn2023.0.2.noarch     perl-TermReadKey-2.38-9.amzn2023.0.3.x86_64     perl-lib-0.65-477.amzn2023.0.11.x86_64        

Complete!
[root@ip-172-31-9-35 /]# curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
  % Total    % Received % Xferd  Average Speed  Time    Time    Time   Current
                                 Dload  Upload  Total   Spent   Left   Speed
100  12252 100  12252   0      0 950.2k      0                              0
Helm v3.22.1 is already latest
[root@ip-172-31-9-35 /]# helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install nginx-ingress ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace
"ingress-nginx" has been added to your repositories
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "ingress-nginx" chart repository
Update Complete. ⎈Happy Helming!⎈
NAME: nginx-ingress
LAST DEPLOYED: Sun Nov 15 06:01:02 2026
NAMESPACE: ingress-nginx
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
The ingress-nginx controller has been installed.
It may take a few minutes for the load balancer IP to be available.
You can watch the status by running 'kubectl get service --namespace ingress-nginx nginx-ingress-ingress-nginx-controller --output wide --watch'

An example Ingress that makes use of the controller:
  apiVersion: networking.k8s.io/v1
  kind: Ingress
  metadata:
    name: example
    namespace: foo
  spec:
    ingressClassName: nginx
    rules:
      - host: www.example.com
        http:
          paths:
            - pathType: Prefix
              backend:
                service:
                  name: exampleService
                  port:
                    number: 80
              path: /
    # This section is only required if TLS is to be enabled for the Ingress
    tls:
      - hosts:
        - www.example.com
        secretName: example-tls

If TLS is enabled for the Ingress, a Secret containing the certificate and key must also be provided:

  apiVersion: v1
  kind: Secret
  metadata:
    name: example-tls
    namespace: foo
  data:
    tls.crt: <base64 encoded cert>
    tls.key: <base64 encoded key>
  type: kubernetes.io/tls
[root@ip-172-31-9-35 /]# kubectl get pods -n ingress-nginx
NAME                                                      READY   STATUS    RESTARTS   AGE
nginx-ingress-ingress-nginx-controller-84db5c7474-zlxv9   0/1     Running   0          12s
[root@ip-172-31-9-35 /]# kubectl get pods -n ingress-nginx
NAME                                                      READY   STATUS    RESTARTS   AGE
nginx-ingress-ingress-nginx-controller-84db5c7474-zlxv9   0/1     Running   0          16s
[root@ip-172-31-9-35 /]# kubectl get pods -n ingress-nginx
NAME                                                      READY   STATUS    RESTARTS   AGE
nginx-ingress-ingress-nginx-controller-84db5c7474-zlxv9   0/1     Running   0          17s
[root@ip-172-31-9-35 /]# kubectl get pods -n ingress-nginx
NAME                                                      READY   STATUS    RESTARTS   AGE
nginx-ingress-ingress-nginx-controller-84db5c7474-zlxv9   0/1     Running   0          17s
[root@ip-172-31-9-35 /]# kubectl create deployment example-app --image=gcr.io/google-samples/hello-app:1.0
kubectl expose deployment example-app --port=8080 --target-port=8080 --name=example-service
kubectl apply -f ingress.yaml
deployment.apps/example-app created
service/example-service exposed
error: the path "ingress.yaml" does not exist
[root@ip-172-31-9-35 /]# kubectl get pods
NAME                          READY   STATUS              RESTARTS   AGE
example-app-d75f7959b-g5sqc   0/1     ContainerCreating   0          5s
[root@ip-172-31-9-35 /]# kubectl get svc
NAME              TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
example-service   ClusterIP   10.99.135.16   <none>        8080/TCP   10s
kubernetes        ClusterIP   10.96.0.1      <none>        443/TCP    2m29s
[root@ip-172-31-9-35 /]# kubectl get pods
NAME                          READY   STATUS    RESTARTS   AGE
example-app-d75f7959b-g5sqc   1/1     Running   0          63s
[root@ip-172-31-9-35 /]# vi ingress.yaml
[root@ip-172-31-9-35 /]# kubectl apply -f ingress.yaml
ingress.networking.k8s.io/example-ingress created
[root@ip-172-31-9-35 /]# kubectl get ingress
NAME              CLASS    HOSTS     ADDRESS   PORTS     AGE
example-ingress   <none>   gfg.com             80, 443   6s
[root@ip-172-31-9-35 /]# helm repo add jetstack https://charts.jetstack.io
"jetstack" has been added to your repositories
[root@ip-172-31-9-35 /]# helm repo update
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "ingress-nginx" chart repository
...Successfully got an update from the "jetstack" chart repository
Update Complete. ⎈Happy Helming!⎈
[root@ip-172-31-9-35 /]# kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.10.1/cert-manager.crds.yaml
customresourcedefinition.apiextensions.k8s.io/clusterissuers.cert-manager.io created
customresourcedefinition.apiextensions.k8s.io/challenges.acme.cert-manager.io created
customresourcedefinition.apiextensions.k8s.io/certificaterequests.cert-manager.io created
customresourcedefinition.apiextensions.k8s.io/issuers.cert-manager.io created
customresourcedefinition.apiextensions.k8s.io/certificates.cert-manager.io created
customresourcedefinition.apiextensions.k8s.io/orders.acme.cert-manager.io created
[root@ip-172-31-9-35 /]# kubectl create namespace cert-manager
helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.10.1
kubectl get pods --namespace cert-manager
namespace/cert-manager created
NAME: cert-manager
LAST DEPLOYED: Sun Nov 15 06:05:31 2026
NAMESPACE: cert-manager
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
cert-manager v1.10.1 has been deployed successfully!

In order to begin issuing certificates, you will need to set up a ClusterIssuer
or Issuer resource (for example, by creating a 'letsencrypt-staging' issuer).

More information on the different types of issuers and how to configure them
can be found in our documentation:

https://cert-manager.io/docs/configuration/

For information on how to configure cert-manager to automatically provision
Certificates for Ingress resources, take a look at the `ingress-shim`
documentation:

https://cert-manager.io/docs/usage/ingress/
NAME                                       READY   STATUS    RESTARTS   AGE
cert-manager-7bf9976d65-c4f5v              1/1     Running   0          22s
cert-manager-cainjector-59456c9f4b-smgq4   1/1     Running   0          22s
cert-manager-webhook-5d8f774666-ppfdn      1/1     Running   0          22s
[root@ip-172-31-9-35 /]# 
[root@ip-172-31-9-35 /]# 
[root@ip-172-31-9-35 /]# 
[root@ip-172-31-9-35 /]# vi self-sign-clusterissuer.yaml
[root@ip-172-31-9-35 /]# kubectl apply -f self-sign-clusterissuer.yaml 
clusterissuer.cert-manager.io/selfsigned-cluster-issuer created
[root@ip-172-31-9-35 /]# vi cert.yaml
[root@ip-172-31-9-35 /]# kubectl apply -f cert.yaml 
certificate.cert-manager.io/selfsigned-cert created
[root@ip-172-31-9-35 /]# kubectl get secret
NAME                  TYPE                DATA   AGE
selfsigned-cert-tls   kubernetes.io/tls   3      94s
[root@ip-172-31-9-35 /]# curl https://gfg.com
curl: (7) Failed to connect to gfg.com:443 after 188 ms: Could not connect to server
[root@ip-172-31-9-35 /]# curl https://gfg.com -k
curl: (7) Failed to connect to gfg.com:443 after 0 ms: Could not connect to server
[root@ip-172-31-9-35 /]# cat /etc/hosts 
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost6 localhost6.localdomain6
192.168.49.2 gfg.com
[root@ip-172-31-9-35 /]# kubectl get pods
NAME                          READY   STATUS    RESTARTS   AGE
example-app-d75f7959b-g5sqc   1/1     Running   0          9m3s
[root@ip-172-31-9-35 /]# kubectl get svc
NAME              TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
example-service   ClusterIP   10.99.135.16   <none>        8080/TCP   9m7s
kubernetes        ClusterIP   10.96.0.1      <none>        443/TCP    11m
[root@ip-172-31-9-35 /]# kubectl get ns
NAME              STATUS   AGE
cert-manager      Active   5m19s
default           Active   11m
ingress-nginx     Active   9m47s
kube-node-lease   Active   11m
kube-public       Active   11m
kube-system       Active   11m
[root@ip-172-31-9-35 /]# kubectl get pods cert-manager
Error from server (NotFound): pods "cert-manager" not found
[root@ip-172-31-9-35 /]# kubectl get pods -n cert-manager
NAME                                       READY   STATUS    RESTARTS   AGE
cert-manager-7bf9976d65-c4f5v              1/1     Running   0          5m28s
cert-manager-cainjector-59456c9f4b-smgq4   1/1     Running   0          5m28s
cert-manager-webhook-5d8f774666-ppfdn      1/1     Running   0          5m28s
[root@ip-172-31-9-35 /]# kubectl get pods -n ingress-nginx
NAME                                                      READY   STATUS    RESTARTS   AGE
nginx-ingress-ingress-nginx-controller-84db5c7474-zlxv9   1/1     Running   0          10m
[root@ip-172-31-9-35 /]# minikube addons enable ingress
* ingress is an addon maintained by Kubernetes. For any concerns contact minikube on GitHub.
You can view the list of minikube maintainers at: https://github.com/kubernetes/minikube/blob/master/OWNERS
  - Using image registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.6.9
  - Using image registry.k8s.io/ingress-nginx/controller:v1.15.1
  - Using image registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.6.9
* Verifying ingress addon...
* The 'ingress' addon is enabled
[root@ip-172-31-9-35 /]# curl https://gfg.com -k
Hello, world!
Version: 1.0.0
Hostname: example-app-d75f7959b-g5sqc
[root@ip-172-31-9-35 /]# kubectl get pods
NAME                          READY   STATUS    RESTARTS   AGE
example-app-d75f7959b-g5sqc   1/1     Running   0          10m
[root@ip-172-31-9-35 /]# kubectl get svc
NAME              TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
example-service   ClusterIP   10.99.135.16   <none>        8080/TCP   10m
kubernetes        ClusterIP   10.96.0.1      <none>        443/TCP    12m
[root@ip-172-31-9-35 /]# history
    1  cd /
    2  yum install docker -y
    3  systemctl start docker
    4   curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
    5  sudo rpm -Uvh minikube-latest.x86_64.rpm
    6  minikube start --force
    7  curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.36.2/2026-07-05/bin/linux/amd64/kubectl
    8  chmod +x ./kubectl
    9  cp ./kubectl /usr/local/bin/
   10  sudo iptables -t nat -A DOCKER -p tcp --dport 80 -j DNAT --to-destination $(minikube ip):80
   11  sudo iptables -t nat -A DOCKER -p tcp --dport 443 -j DNAT --to-destination $(minikube ip):443
   12  vi /etc/hosts
   13  minikube ip
   14  docker ps
   15  curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
   16  yum install git -y
   17  curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
   18  helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
   19  helm repo update
   20  helm install nginx-ingress ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace
   21  kubectl get pods -n ingress-nginx
   22  kubectl get pods -n ingress-nginx
   23  kubectl get pods -n ingress-nginx
   24  kubectl get pods -n ingress-nginx
   25  kubectl create deployment example-app --image=gcr.io/google-samples/hello-app:1.0
   26  kubectl expose deployment example-app --port=8080 --target-port=8080 --name=example-service
   27  kubectl apply -f ingress.yaml
   28  kubectl get pods
   29  kubectl get svc
   30  kubectl get pods
   31  vi ingress.yaml
   32  kubectl apply -f ingress.yaml
   33  kubectl get ingress
   34  helm repo add jetstack https://charts.jetstack.io
   35  helm repo update
   36  kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.10.1/cert-manager.crds.yaml
   37  kubectl create namespace cert-manager
   38  helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.10.1
   39  kubectl get pods --namespace cert-manager
   40  vi self-sign-clusterissuer.yaml
   41  kubectl apply -f self-sign-clusterissuer.yaml 
   42  vi cert.yaml
   43  kubectl apply -f cert.yaml 
   44  kubectl get secret
   45  curl https://gfg.com
   46  curl https://gfg.com -k
   47  cat /etc/hosts 
   48  kubectl get pods
   49  kubectl get svc
   50  kubectl get ns
   51  kubectl get pods cert-manager
   52  kubectl get pods -n cert-manager
   53  kubectl get pods -n ingress-nginx
   54  minikube addons enable ingress
   55  curl https://gfg.com -k
   56  kubectl get pods
   57  kubectl get svc
   58  history
[root@ip-172-31-9-35 /]# 
