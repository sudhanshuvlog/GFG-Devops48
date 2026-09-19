# Jenkins CI-CD Pipeline Project

* Repo Used in the session - https://github.com/sudhanshuvlog/GFG48-Python-FlaskApp/

## Job1-TestApp

```bash
yum install python3 -y
yum install python3-pip -y
pip3 install -r requirements.txt
pytest
flake8 .
```
## Job2-docker-build

```bash
yum install docker -y
systemctl start docker
docker build -t mygfgimg .
```

## Job3-DeployApp

```bash
docker rm -f webserver 
docker run -dit --name webserver -p 80:80 mygfgimg
```