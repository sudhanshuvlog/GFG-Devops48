[root@ip-172-31-8-2 /]# history
    1  cd /
    2  yum install docker -y
    3  systemctl start docker
    4  docker images
    5  docker run -it --name server1 amazonlinux:latest
    6  curl 172.17.0.2
    7  docker ps
    8  docker run -it --name server2 ubuntu
    9  docker ps
   10  docker run -it -d --name server3 ubuntu
   11  docker ps
   12  docker attach server3
   13  docker inspect server1
   14  curl 172.17.0.2
   15  rpm -q httpd
   16  docker run -it --name webserver -p 8080:80 amazonlinux:latest
   17  docker ps
   18  netstat -tnlp
   19  docker ps
   20  docker attach webserver
   21  docker ps
   22  vi index.html
   23  ls
   24  docker ps
   25  docker cp --help
   26  docker cp index.html webserver:/var/www/html/
   27  ls
   28  docker attach webserver
   29  docker cp webserver:/log.txt .
   30  ls
   31  vi index.html 
   32  docker cp index.html webserver:/var/www/html/
   33  mkdir web_pages
   34  cd web_pages/
   35  cp ../index.html .
   36  ls
   37  docker ps
   38  docker run -it --name webserver1 -v /web_pages/:/var/www/html/ amazonlinux
   39  docker ps
   40  curl 172.17.0.6
   41  pwd
   42  vi index.html 
   43  rm -rf index.html 
   44  vi index.html
   45  rm -rf index.html 
   46  cat > index.html
   47  curl 172.17.0.6
   48  docker run -it --name nginx_server -p 80:80 -v /web_pages/:/usr/share/nginx/html/  nginx
   49  docker ps
   50  cat > index.html 
   51  docker run -it --name nginx_server_replica -p 80:80 -v /web_pages/:/usr/share/nginx/html/  nginx
   52  docker run -it --name nginx_server_replica_s -p 81:80 -v /web_pages/:/usr/share/nginx/html/  nginx
   53  docker ps
   54  docker run -it -d  --name nginx_server_replica_s2 -p 82:80 -v /web_pages/:/usr/share/nginx/html/  nginx
   55  docker ps
   56  ls
   57  docker volume ls
   58  docker volume --help
   59  docker volume create --help
   60  docker volume create -d local gfg_vol
   61  docker volume ls
   62  docker run -it -d  --name httpd_server -p 8081:80 -v gfg_vol:/usr/local/apache2/htdocs/  httpd
   63  docker images
   64  docker ps
   65  docker volume ls
   66  cd /var/lib/docker/volumes/
   67  l
   68  ls
   69  cd gfg_vol/
   70  ls
   71  pwd
   72  ls
   73  cd _data/
   74  pwd
   75  ls
   76  cat index.html 
   77  pwd
   78  cd /
   79  ls
   80  docker ps
   81  docker run -dit --name gfg amazonlinux
   82  docker ps
   83  docker attach gfg
   84  docker attach httpd_server
   85  docker ps
   86  docker ps -a
   87  docker start httpd_server
   88  docker ps
   89  docker exec -it gfg date
   90  docker exec -it gfg rpm -q httpd
   91  docker exec -it gfg ls
   92  docker exec -it httpd_server  ls
   93  docker exec -it httpd_server bash
   94  docker ps
   95  docker exec -it gfg bash
   96  docker ps
   97  docker exec -it gfg bash
   98  docker ps
   99  docker exec -it gfg bash
  100  docker commit --help
  101  docker ps
  102  docker commit -m "my gfg first image" gfg gfg_image:v1
  103  docker ps
  104  docker images
  105  docker run -dit --name server111 gfg_image:v1
  106  docker ps
  107  docker exec -it server111 bash
  108  docker ps
  109  vi Dockerfile
  110  docker run -dit --name server111 -e x=10 gfg_image:v1
  111  docker run -dit --name server222 -e x=10 gfg_image:v1
  112  docker exec -it server2222 bash
  113  docker exec -it server222 bash
  114  cd /
  115  vi Dockerfile
  116  vi index.html
  117  vi Dockerfile
  118  docker build --help
  119  docker build -it gfg48_img:v1 .
  120  docker build -t gfg48_img:v1 .
  121  cd /
  122  history

  [root@ip-172-31-6-207 MarioGameOnDocker]# history
    1  cd /
    2  yum install docker -y
    3  systemctl start docker
    4  vi Dockerfile
    5  vi index.html
    6  docker build -t gfg_custom_img:v1 .
    7  docker images
    8  cat Dockerfile
    9  docker run -it gfg_custom_img:v1
   10  docker ps
   11  docker ps -a
   12  vi Dockerfile
   13  docker build -t gfg_custom_img:v2 .
   14  docker images
   15  docker run -it gfg_custom_img:v2
   16  vi index.html 
   17  vi Dockerfile 
   18  docker run -it gfg_custom_img:v2
   19  docker build -t gfg_custom_img:v2 .
   20  docker images
   21  docker run -it gfg_custom_img:v2
   22  docker ps
   23  docker ps -a
   24  vi Dockerfile 
   25  docker build -t gfg_custom_img:v3 .
   26  docker run -it gfg_custom_img:v3
   27  vi Dockerfile
   28  docker build -t gfg_custom_img:v3 .
   29  docker run -it gfg_custom_img:v3
   30  vi Dockerfile
   31  vi Dockerfile
   32  docker build -t gfg_custom_img:v3 .
   33  cat Dockerfile 
   34  docker run -it gfg_custom_img:v3
   35  docker run -it gfg_custom_img:v3 ls
   36  docker run -it amazonlinux
   37  docker ps -a
   38  docker run -it amazonlinux date
   39  docker ps -a
   40  docker run -it amazonlinux ls
   41  docker ps -a
   42  vi Dockerfile
   43  docker run -it gfg_custom_img:v4 ls
   44  docker build -t gfg_custom_img:v4 .
   45  docker run -it gfg_custom_img:v4
   46  docker run -it gfg_custom_img:v4 ls
   47  cat Dockerfile
   48  vi Dockerfile 
   49  docker build -t gfg_custom_img:v5 .
   50  docker run -it gfg_custom_img:v5 ls
   51  docker run -it gfg_custom_img:v5
   52  docker run -dit gfg_custom_img:v5
   53  docker ps
   54  docker run -dit -p 80:80 gfg_custom_img:v5
   55  docker ps
   56  docker exec -it 6a02 bash
   57  cat Dockerfile
   58  docker images
   59  docker login
   60  docker tag gfg_custom_img:v5 jinny1/gfg-48-httpd-server:v1
   61  docker images
   62  docker push jinny1/gfg-48-httpd-server
   63  docker push jinny1/gfg-48-httpd-server:v1
   64  git clone https://github.com/sudhanshuvlog/MarioGameOnDocker.git
   65  yum install git -y
   66  git clone https://github.com/sudhanshuvlog/MarioGameOnDocker.git
   67  cd MarioGameOnDocker/
   68  ls
   69  vi Dockerfile
   70  docker build -t mario-game:v1 .
   71  docker images
   72  docker run -dit --name mario-game -p 8080:80 mario-game
   73  docker run -dit --name mario-game -p 8080:80 mario-game:v1
   74  docker ps
   75  docker logs mario-game
   76  history