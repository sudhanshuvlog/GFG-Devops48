[root@ip-172-31-1-108 /]# history
    1  cd /
    2  systemd-cgtop
    3  systemd-cgls
    4  yum install httpd -y
    5  systemctl start httpd
    6  ps -aux | grep httpd
    7  systemd-cgtop
    8  systemctl stop httpd
    9  /usr/sbin/httpd
   10  ps - aux | grep httpd
   11  ps -aux | grep httpd
   12  kill -9 30121 30122 30123
   13  ps -aux | grep httpd
   14  kill -9 30124 30146 30303
   15  ps -aux | grep httpd
   16  /usr/sbin/httpd
   17  systemd-cgls
   18  cd /
   19  useradd dev1
   20  passwd dev1
   21  whoami
   22  su dev1
   23  vi /etc/ssh/sshd_config
   24  systemctl restart sshd
   25  vi /etc/ssh/sshd_config
   26  ps -aux
   27  ps -aux | grep python3
   28  id dev1
   29  id ec2-user
   30  id 1000
   31  id 1001
   32  ps -aux | grep httpd
   33  systemd-cgls
   34  cd /etc/systemd/system
   35  ls
   36  mkdir user-1001.slice.d
   37  cd user-1001.slice.d/
   38  ls
   39  vi cpu.conf
   40  systemctl daemon-reload
   41  systemctl status httpd
   42  vi /usr/lib/systemd/system/httpd.service
   43  cd /
   44  ps -aux | grep httpd
   45  kill -9 30439
   46  ps -aux | grep httpd
   47  kill -9 30440 30441 30506 30515 30682
   48  ps -aux | grep httpd
   49  systemctl status httpd
   50  systemctl start httpd
   51  systemctl enable httpd
   52  cat /usr/lib/systemd/system/httpd.service
   53  vi /usr/lib/systemd/system/httpd.service
   54  cd /etc/systemd/system
   55  ls
   56  cd httpd.service.d/
   57  ls
   58  vi httpd-server.conf
   59  ps -aux | grep httpd
   60  vi httpd.conf
   61  systemctl daemon-reload
   62  systemctl restart httpd
   63  systemctl status httpd
   64  cat httpd.conf 
   65  cd ..
   66  cd user-1001.slice.d/
   67  cat cpu.conf 
   68  vi /usr/lib/systemd/system/httpd.service
   69  cd ..
   70  pwd
   71  vi gfgs1.service
   72  sysemctl daemon-reload
   73  systemctl daemon-reload
   74  systemctl start gfgs1
   75  systemd-cgls
   76  ls
   77  cp gfgs1.service gfgs2.service
   78  ls
   79  vi gfgs2.service 
   80  systemctl daemon-reload
   81  systemctl start gfgs2
   82  vi gfgs1.service 
   83  vi gfgs2.service 
   84  systemctl daemon-reload
   85  systemctl restart gfgs1
   86  systemctl restart gfgs2
   87  cat gfgs1.service 
   88  vi user.slice
   89  systemctl daemon-reload
   90  useradd dev2
   91  id dev2
   92  passwd dev2
   93  id dev2
   94  cat user.slice 
   95  cat gfgs1
   96  cat gfgs1.service 
   97  systemd-cgls
   98  journalctl
   99  journalctl -u httpd
  100  journalctl -h gfs1
  101  journalctl -u gfs1
  102  journalctl -h
  103  journalctl -n 20
  104  journalctl b -1
  105  journalctl -b -1
  106  journalctl -p err
  107  journalctl -p warning
  108  ps -aux | grep dd
  109  journalctl _PID=34060
  110  man journalctl
  111  man chmod
  112  cd /
  113  vi app.py
  114  python3 app.py 
  115  pip3 install flask
  116  yum whatprovides pip3
  117  systemctl stop gfgs1
  118  systemctl stop gfgs2
  119  yum whatprovides pip3
  120  yum install python3-pip
  121  pip3 install flask
  122  python3 app.py 
  123  vi app.py 
  124  python3 app.py 
  125  pwd
  126  ls
  127  cd /etc/systemd/system
  128  cp gfgs1.service gfgapp.service
  129  vi gfgapp.service 
  130  systemd daemon-reload
  131  systemctl daemon-reload
  132  systemctl start gfgapp
  133  systemd-cgtop
  134  cd /
  135  systemctl status gfgapp
  136  journalctl -u gfgapp
  137  history