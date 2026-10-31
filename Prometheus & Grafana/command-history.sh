root@ip-10-0-1-192 /]# history
    1  cd /
    2  yum install httpd -y
    3  systemctl start httpd
    4  wget https://github.com/prometheus/node_exporter/releases/download/v1.12.1/node_exporter-1.12.1.linux-amd64.tar.gz
    5  ls
    6  tar -xvzf node_exporter-1.12.1.linux-amd64.tar.gz 
    7  cd node_exporter-1.12.1.linux-amd64/
    8  ls
    9  cp node_exporter /usr/local/bin
   10  ls
   11  node_exporter
   12  node_exporter &
   13  cd /
   14  yum install docker -y
   15  systemctl start docker
   16  vi /etc/docker/daemon.json
   17  systemctl restart docker
   18  docker run -dit httpd
   19  docker run -dit httpd
   20  docker run -dit httpd
   21  docker run -dit httpd
   22  docker run -dit httpd
   23  docker run -dit httpd
   24  docker run -dit httpd
   25  docker run -dit httpd
   26  docker ps
   27  docker ps
   28  docker run -dit httpd
   29  docker run -dit httpd
   30  dd if=/dev/zero of=/dev/null
   31  history

[root@ip-172-31-37-219 prometheus-3.9.1.linux-amd64]# history
    [root@ip-10-0-1-164 prometheus-3.13.5.linux-amd64]# history
    1  cd /
    2  wget https://github.com/prometheus/prometheus/releases/download/v3.13.5/prometheus-3.13.5.linux-amd64.tar.gz
    3  ls
    4  tar -xvzf prometheus-3.13.5.linux-amd64.tar.gz 
    5  ls
    6  cd prometheus-3.13.5.linux-amd64/
    7  ls
    8  cp prometheus /usr/local/bin/
    9  prometheus --version
   10  cd /
   11  cd prometheus-3.13.5.linux-amd64/
   12  ls
   13  clear
   14  ls
   15  prometheus --version
   16  ls
   17  vi prometheus.yml 
   18  prometheus
   19  vi prometheus.yml 
   20  prometheus
   21  cd /etc/yum.repos.d/
   22  vi grafana.repo
   23  yum install grafana
   24  cd /
   25  systemctl start grafana-server
   26  cd prometheus-3.13.5.linux-amd64/
   27  prometheus 
   28  history