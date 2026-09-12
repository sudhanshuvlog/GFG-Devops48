[root@ip-172-31-8-47 /]# history
    1  cd /
    2  yum install docker -y
    3  systemctl start docker
    4  docker images
    5  docker ps
    6  docker run -dit --name server1 amazonlinux
    7  docker ps
    8  docker run -dit --name server2 amazonlinux
    9  docker ps
   10  docker exec -it server1 bash
   11  docker exec -it server2 bash
   12  docker exec -it server1 bash
   13  ifconfig
   14  docker network ls
   15  docker inspect server1
   16  docker network ls
   17  docker network create --driver bridge --subnet=192.168.1.0/24 gfgnet
   18  docker network ls
   19  vi Dockerfile
   20  docker build -t gfgimg .
   21  docker run -dit --name server3 --network gfgnet gfgimg
   22  docker exec -it server3 bash
   23  docker run -dit --name server4 --network gfgnet gfgimg
   24  docker exec -it server4 bash
   25  docker ps
   26  docker network ls
   27  docker run -dit --name server5 --network host gfgimg
   28  docker exec -it server5 bash
   29  docker ps
   30  docker network ls
   31  docker run -dit --name server6 --network none gfgimg
   32  docker ps
   33  docker exec -it server6 bash
   34  docker run -dit --name server5a --network host gfgimg
   35  docker run -dit --name server5b --network host gfgimg
   36  docker run -dit --name server5c --network host gfgimg
   37  docker ps
   38  docker stop server5c
   39  docker ps -a
   40  docker start server5x
   41  docker start server5c
   42  docker ps
   43  docker rm server5c
   44  docker stop server5c
   45  docker rm server5c
   46  docker ps -a
   47  docker rm server5b
   48  docker rm -f server5b
   49  docker ps -a
   50  echo hi
   51  echo date
   52  echo `date`
   53  docker ps -a 
   54  docker ps -a -q
   55  docker rm -f `docker ps -a -q`
   56  docker ps -a 
   57  docker run -dit --name server5 --network host gfgimg
   58  docker ps
   59  yum install git -y > /dev/null
   60  git clone https://github.com/sudhanshuvlog/MarioGameOnDocker.git
   61  cd MarioGameOnDocker/
   62  docker build -t mario-game .
   63  docker images
   64  docker run -dit --name gameapp -p 8080:80 mario-game
   65  docker ps
   66  docker stat mario-game
   67  docker stats mario-game
   68  docker stats gameapp
   69  free -m
   70  free -m -h
   71  docker run -dit --name gameapp-server2 --memory 10  -p 8080:80 mario-game
   72  docker run -dit --name gameapp-server2 --memory 10MB  -p 8080:80 mario-game
   73  docker run -dit --name gameapp-server3 --memory 10MB  -p 8081:80 mario-game
   74  docker ps
   75  docker stats gameapp-server3
   76  curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   77  ls
   78  cd /
   79  docker-compose --version
   80  chmod +x /usr/local/bin/docker-compose
   81  docker-compose --version
   82  vi docker-compose.yaml
   83  docker-compose up -d
   84  docker ps
   85  vi docker-compose.yaml
   86  docker-compose up -d
   87  docker ps
   88  docker-compose ps
   89  history