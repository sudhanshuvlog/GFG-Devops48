[root@ip-172-31-12-198 gfg-ansible-code]# history
    1  cd /
    2  yum install ansible -y
    3  ansible --version
    4  mkdir gfg-ansible-code
    5  cd gfg-ansible-code/
    6  ls
    7  vi inventory
    8  vi key.pem
    9  vi inventory
   10  ansible all -m ping
   11  ls
   12  ansible --version
   13  ansible-config init --disabled
   14  ansible-config init --disabled > ansible.cfg
   15  ansible --version
   16  ls
   17  ansible all -m ping
   18  vi ansible.cfg 
   19  ansible all -m ping
   20  ls -l
   21  chmod 400 key.pem 
   22  ls -l
   23  ansible all -m ping
   24  vi ansible.cfg 
   25  ansible all -m ping
   26  ansible all -m command -a "date"
   27  ansible all -m command -a "yum install httpd"
   28  ansible all -m command -a "sudo yum install httpd -y"
   29  cat inventory 
   30  ansible all -m command -a "yum install httpd -y"
   31  vi ansible.cfg 
   32  ansible all -m command -a "yum install httpd -y"
   33  vi httpd-server-configuration.yaml
   34  vi index.html
   35  vi httpd-server-configuration.yaml
   36  ansible-playbook httpd-server-configuration.yaml 
   37  rpm -q httpd
   38  vi httpd-server-configuration.yaml
   39  ansible-playbook httpd-server-configuration.yaml 
   40  vi httpd-server-configuration.yaml
   41  ansible-playbook httpd-server-configuration.yaml 
   42  vi httpd-server-configuration.yaml
   43  ansible-playbook httpd-server-configuration.yaml 
   44  vi httpd-server-configuration.yaml
   45  ansible-playbook httpd-server-configuration.yaml 
   46  yum install httpd
   47  vi /etc/httpd/conf/httpd.conf 
   48  cp /etc/httpd/conf/httpd.conf .
   49  yum remove httpd
   50  ls
   51  vi httpd.conf 
   52  vi httpd-server-configuration.yaml 
   53  ansible-playbook httpd-server-configuration.yaml 
   54  vi httpd-server-configuration.yaml 
   55  ansible-playbook httpd-server-configuration.yaml 
   56  ansible-playbook httpd-server-configuration.yaml 
   57  vi httpd-server-configuration.yaml 
   58  ansible-playbook httpd-server-configuration.yaml 
   59  vi httpd-server-configuration.yaml 
   60  vi httpd.conf 
   61  ansible-playbook httpd-server-configuration.yaml 
   62  ansible-playbook httpd-server-configuration.yaml 
   63  vi index.html 
   64  ansible-playbook httpd-server-configuration.yaml 
   65  vi httpd-server-configuration.yaml 
   66  ansible-playbook httpd-server-configuration.yaml 
   67  ansible-playbook httpd-server-configuration.yaml 
   68  vi index.html 
   69  ansible-playbook httpd-server-configuration.yaml -t copy
   70  ansible-playbook httpd-server-configuration.yaml -t package
   71  vi httpd-server-configuration.yaml 
   72  ansible-playbook httpd-server-configuration.yaml -t package
   73  vi create-user.yaml
   74  ansible-playbook create-user.yaml 
   75  vi create-user.yaml
   76  ansible-playbook create-user.yaml 
   77  vi create-user.yaml
   78  ansible-playbook create-user.yaml 
   79  vi create-ec2.yaml
   80  vi ec2_variables.yaml
   81  vi create-ec2.yaml
   82  ansible-vault --help
   83  ansible-vault create aws_credentials.yaml
   84  ls
   85  cat aws_credentials.yaml 
   86  vi create-ec2.yaml 
   87  cat ec2_variables.yaml 
   88  ansible-vault view aws_credentials.yaml 
   89  ansible-vault view aws_credentials.yaml 
   90  clear
   91  ansible-playbook create-ec2.yaml 
   92  ansible-playbook create-ec2.yaml  --help
   93  ansible-playbook create-ec2.yaml --ask-vault-password
   94  vi ec2_variables.yaml 
   95  ansible-playbook create-ec2.yaml --ask-vault-password
   96  cat inventory 
   97  vi create-ec2.yaml 
   98  vi create-ec2.yaml 
   99  ansible-playbook create-ec2.yaml --ask-vault-password
  100  vi create-ec2.yaml 
  101  ansible-playbook create-ec2.yaml --ask-vault-password
  102  vi create-ec2.yaml 
  103  ansible-playbook create-ec2.yaml --ask-vault-password
  104  cat inventory
  105  cp inventory inventory.j2
  106  vi inventory.j2 
  107  vi inventory.j2 
  108  ls
  109  cat inventory.j2 
  110  cat inventory
  111  vi create-ec2.yaml 
  112  cat inventory
  113  ansible-playbook create-ec2.yaml --ask-vault-password
  114  cat inventory.j2 
  115  cat inventory
  116  ls
  117  ansible-playbook httpd-server-configuration.yaml 
  118  yum install haparoxy
  119  yum install haproxy
  120  cp /etc/haproxy/haproxy.cfg .
  121  vi haproxy.cfg 
  122  cp haproxy.cfg haproxy.j2
  123  vi haproxy.j2
  124  vi create-ec2.yaml 
  125  ansible-playbook create-ec2.yaml --ask-vault-password
  126  ansible-playbook create-ec2.yaml --ask-vault-password
  127  cat inventory
  128  vi /etc/haproxy/haproxy.cfg 
  129  ansible-playbook httpd-server-configuration.yaml 
  130  systemctl status haproxy
  131  ansible-playbook create-ec2.yaml --ask-vault-password
  132  systemctl restart haproxy
  133  systemctl status haproxy.service
  134  vi haproxy.j2
  135  cat /etc/haproxy/haproxy.cfg 
  136  vi haproxy.j2
  137  ansible-playbook create-ec2.yaml --ask-vault-password
  138  cat /etc/haproxy/haproxy.cfg 
  139  ansible-playbook httpd-server-configuration.yaml 
  140  history