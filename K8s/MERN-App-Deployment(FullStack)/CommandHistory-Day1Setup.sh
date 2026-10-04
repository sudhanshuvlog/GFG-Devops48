[root@ip-172-31-1-30 k8s-mern-proj-practical]# history
    1  cd /
    2  yum install docker -y
    3  systemctl start docker
    4  docker ps
    5  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
    6  sudo rpm -Uvh minikube-latest.x86_64.rpm
    7  minikube start --force
    8  docker ps
    9  docker exec -it minikube bash
   10  docker p
   11  docker ps
   12  curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.36.2/2026-07-05/bin/linux/amd64/kubectl
   13  chmod +x ./kubectl
   14  cp ./kubectl /usr/local/bin/
   15  kubectl get pods
   16  mkdir k8s-mern-proj-practical
   17  cd k8s-mern-proj-practical/
   18  ls
   19  vi mongo-app.yaml
   20  vi mongo-secret.yaml
   21  vi mongo-secret.yaml 
   22  kubectl get secret
   23  kubectl apply -f mongo-secret.yaml 
   24  kubectl get secret
   25  kubectl describe secret
   26  vi mongo-app.yaml 
   27  kubectl apply -f mongo-app.yaml 
   28  kubectl get pods
   29  kubectl get rs
   30  kubectl get rs
   31  kubectl get pods
   32  kubectl get deployment
   33  docker ps
   34  docker exec -it minikube bash
   35  kubectl get deployment
   36  kubectl get pods
   37  vi express-webapp.yaml
   38  kubectl describe pod
   39  vi mongodb-expose-service.yaml
   40  vi mongo-secret.yaml 
   41  ls
   42  vi mongodb-expose-service.yaml 
   43  kubectl apply -f mongodb-expose-service.yaml 
   44  kubectl get svc
   45  ls
   46  vi express-webapp.yaml 
   47  vi mongo-config.yaml
   48  kubectl get svc
   49  vi mongo-config.yaml
   50  kubectl apply -f mongo-config.yaml 
   51  kubectl get configmap
   52  kubectl describe configmap mongo-service-configmap
   53  vi express-webapp.yaml 
   54  vi express-webapp.yaml 
   55  kubectl apply -f express-webapp.yaml 
   56  vi express-webapp.yaml 
   57  kubectl apply -f express-webapp.yaml 
   58  kubectl get pods
   59  kubectl get deployment
   60  kubectl get pods
   61  kubectl descrribe pod webapp-deployment-5d6677f58b-tmkz5
   62  kubectl describe pod webapp-deployment-5d6677f58b-tmkz5
   63  kubectl describe secret
   64  vi express-webapp.yaml 
   65  kubectl apply -f express-webapp.yaml 
   66  kubectl get pods
   67  kubectl get deployment
   68  kubectl describe pod webapp-deployment-77c8bdd85d-62rjx
   69  curl 10.244.0.5:8081
   70  docker ps
   71  vi webapp-service.yaml
   72  vi webapp-service.yaml
   73  kubectl apply -f webapp-service.yaml 
   74  kubectl get svc
   75  minikube ip
   76  docker ps
   77  curl 192/168.49.2:30513
   78  curl 192.168.49.2:30513
   79  yum install socat -y > /dev/null
   80  socat TCP4-LISTEN:8080,fork,su=nobody  TCP4:192.168.49.2:30513 &
   81  id nobody
   82  netstat -tnlp
   83  kubectl get pods
   84  kubectl logs webapp-deployment-77c8bdd85d-62rjx 
   85  kubectl get pods
   86  kubectl delete pod mongo-app-deployment-6c564976c5-4bj8w
   87  kubectl get pods
   88  vi mongo-app.yaml 
   89  kubectl apply -f mongo-app.yaml 
   90  kubectl get pods
   91  vi mongo-app.yaml 
   92  kubectl get pods
   93  kubectl apply -f mongo-app.yaml 
   94  kubectl get pods
   95  kubectl get pods
   96  kubectl get pods
   97  kubectl get pods
   98  kubectl get pods
   99  kubectl describe pod mongo-app-deployment-6787674775-fnxbm
  100  kubectl get pods
  101  kubectl delete pod mongo-app-deployment-5cb9fb87db-dtgg
  102  kubectl delete pod mongo-app-deployment-5cb9fb87db-dtggr
  103  kubectl get pods
  104  kubectl get deployment
  105  kubectl get pods
  106  vi mongo-app.yaml 
  107  kubectl apply -f mongo-app.yaml 
  108  kubectl get pods
  109  vi pv.yaml
  110  docker exec -it minikube bash
  111  vi pv.yaml 
  112  minikube ssh
  113  vi pv.yaml 
  114  kubectl apply -f pv.yaml 
  115  vi pv.yaml 
  116  kubectl apply -f pv.yaml 
  117  kubectl get pv
  118  vi mongo-app.yaml 
  119  kubectl apply -f mongo-app.yaml 
  120  kubectl get pods
  121  vi webapp-service.yaml 
  122  kubectl apply -f webapp-service.yaml 
  123  kubectl get svc
  124  kubectl get pods
  125  kubectl delete pod mongo-app-deployment-6c564976c5-lm2wf
  126  kubectl get pods
  127  kubectl get pods
  128  vi pvc.yaml
  129  vi pvc.yaml
  130  kubectl get pv
  131  kubectl apply -f pvc.yaml 
  132  kubectl get pvc
  133  kubectl get pv
  134  vi mongo-app.yaml 
  135  vi mongo-app.yaml 
  136  kubectl apply -f mongo-app.yaml 
  137  vi mongo-app.yaml 
  138  kubectl apply -f mongo-app.yaml 
  139  vi mongo-app.yaml 
  140  kubectl apply -f mongo-app.yaml 
  141  kubectl get pods
  142  kubectl get pods
  143  kubectl describe pod mongo-app-deployment-cfb68d8f9-xs552
  144  kubectl get pods
  145  kubectl describe pod mongo-app-deployment-cfb68d8f9-xs552
  146  kubectl logs mongo-app-deployment-cfb68d8f9-xs552
  147  vi mongo-app.yaml 
  148  cat pv.yaml 
  149  minikube ssh
  150  docker ps
  151  kubectl get pods
  152  kubectl get deployment
  153  kubectl delete deployment mongo-app-deployment
  154  kubectl get pods
  155  vi mongo-app.yaml 
  156  kubectl apply -f mongo-app.yaml 
  157  kubectl get pods
  158  kubectl get pods
  159  kubectl delete pod mongo-app-deployment-cfb68d8f9-vrwk8
  160  kubectl get pods
  161  minikube ssh
  162  kubectl get deployment
  163  kubectl scale deployment mongo-app-deployment --replicas 3
  164  kubectl get pods
  165  kubectl get pods
  166  kubectl describe pod mongo-app-deployment-cfb68d8f9-6bgx8
  167  cat pv.yaml 
  168  kubectl get pods
  169  kubectl logs mongo-app-deployment-cfb68d8f9-9rszg
  170  kubectl get pods
  171  ld
  172  ls
  173  cat express-webapp.yaml 
  174  cat mongo-app.yaml 
  175  ls
  176  cat mongo-config.yaml 
  177  cat mongo-secret.yaml 
  178  cat mongodb-expose-service.yaml 
  179  cat pv.yaml 
  180  cat pvc.yaml 
  181  ls
  182  cat webapp-service.yaml 
  183  history