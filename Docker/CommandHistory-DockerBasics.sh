[root@ip-172-31-13-46 /]# history
    1  cd /
    2   yum install docker -y
    3  cd /
    4  yum install docker -y
    5  systemctl start docker
    6  systemctl status docker
    7  docker images
    8  docker pull ubuntu
    9  docker images
   10  docker run ubuntu
   11  docker ps
   12  docker ps -a
   13  docker run ubuntu --help
   14  docker run --help
   15  docker run -it ubuntu
   16  docker ps
   17  docker ps -a
   18  ls
   19  docker start 05913e9ae07c
   20  docker ps
   21  docker attach 05913e9ae07c
   22  docker ps
   23  ls
   24  docker pull amazonlinux
   25  docker images
   26  docker run -it --name mycontainer1 amazonlinux
   27  docker ps
   28  docker inspect mycontainer1
   29  docker ps
   30  docker inspect 05913e9ae07c
   31  curl 172.17.0.3
   32  rpm -q httpd
   33  cd /var/www/html
   34  docker ps
   35  docker pull httpd
   36  docker run -it --name webserver httpd
   37  docker ps
   38  docker inspect webserver
   39  curl 172.17.0.4
   40  docker ps
   41  history
   42  docker run -it --name webserver httpd
   43  docker run -it --name webserver1 httpd
   44  docker ps
   45  docker inspect webserver1
   46  ifconfig