   ### Jenkins Master
   yum install docker -y
   systemctl start docker
   docker run -p 8080:8080 -p 50000:50000 --restart=on-failure -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk21
   

   ### Jenkins Worker
   
    1  cd /
    2  mkdir data
    3  cd data
    4  pwd
    5  ls
    6  cd /
    7  curl -sO http://15.252.180.147:8080/jnlpJars/agent.jar
    8  ls
    9  java -jar agent.jar -url http://15.252.180.147:8080/ -secret a7679b2648a8f93011b7c4925571034bbaf9b80bafd6904c56251c6823a3e1e9 -name worker1 -webSocket -workDir "/data" 
   10  wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.rpm
   11  ls
   12  yum install jdk-21_linux-x64_bin.rpm -y
   13  java -jar agent.jar -url http://15.252.180.147:8080/ -secret a7679b2648a8f93011b7c4925571034bbaf9b80bafd6904c56251c6823a3e1e9 -name worker1 -webSocket -workDir "/data" 
   14  java -jar agent.jar -url http://15.252.180.147:8080/ -secret a7679b2648a8f93011b7c4925571034bbaf9b80bafd6904c56251c6823a3e1e9 -name worker1 -webSocket -workDir "/data"  &
   15  date
   16  cak
   17  cal
   18  ps -aux | grep java
   19  cd /data
   20  ls
   21  cd remoting/
   22  ls
   23  cd logs/
   24  l
   25  ls
   26  cd ../..
   27  ls
   28  git
   29  yum install git -y
   30  pwd
   31  ls
   32  cd workspace/
   33  ls
   34  cd job1/
   35  lls
   36  ls
   37  pwd
   38  history
   39  history