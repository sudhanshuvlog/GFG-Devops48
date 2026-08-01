[ec2-user@ip-172-31-7-65 ~]$ whoami
ec2-user
[ec2-user@ip-172-31-7-65 ~]$ cd /
[ec2-user@ip-172-31-7-65 /]$ ls
bin  boot  dev  etc  home  lib  lib64  local  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[ec2-user@ip-172-31-7-65 /]$ sudo su root
[root@ip-172-31-7-65 /]# whoami
root
[root@ip-172-31-7-65 /]# ls
bin  boot  dev  etc  home  lib  lib64  local  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@ip-172-31-7-65 /]# pwd
/
[root@ip-172-31-7-65 /]# free -m
               total        used        free      shared  buff/cache   available
Mem:             957         166         548           0         242         658
Swap:              0           0           0
[root@ip-172-31-7-65 /]# free -m -h
               total        used        free      shared  buff/cache   available
Mem:           957Mi       166Mi       548Mi       0.0Ki       242Mi       658Mi
Swap:             0B          0B          0B
[root@ip-172-31-7-65 /]# df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  464M     0  464M   0% /dev
tmpfs          tmpfs     479M     0  479M   0% /dev/shm
tmpfs          tmpfs     192M  444K  192M   1% /run
/dev/xvda1     xfs       8.0G  1.7G  6.4G  21% /
tmpfs          tmpfs     479M     0  479M   0% /tmp
/dev/xvda128   vfat       10M  1.3M  8.7M  13% /boot/efi
tmpfs          tmpfs      96M     0   96M   0% /run/user/1000
[root@ip-172-31-7-65 /]# fdisk -l
Disk /dev/xvda: 8 GiB, 8589934592 bytes, 16777216 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 574B9818-F108-479C-AF49-A75E01C55259

Device       Start      End  Sectors Size Type
/dev/xvda1   24576 16777182 16752607   8G Linux filesystem
/dev/xvda127 22528    24575     2048   1M BIOS boot
/dev/xvda128  2048    22527    20480  10M EFI System

Partition table entries are not in disk order.
[root@ip-172-31-7-65 /]#
[root@ip-172-31-7-65 /]#
[root@ip-172-31-7-65 /]# top
top - 05:16:18 up 15 min,  2 users,  load average: 0.00, 0.00, 0.00
Tasks: 106 total,   1 running, 105 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :    957.4 total,    549.0 free,    165.9 used,    242.5 buff/cache
MiB Swap:      0.0 total,      0.0 free,      0.0 used.    658.7 avail Mem

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
      1 root      20   0  107548  17436  10884 S   0.0   1.8   0:00.66 systemd
      2 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kthreadd
      3 root      20   0       0      0      0 S   0.0   0.0   0:00.00 pool_workqueue_release
      4 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-rcu_gp
      5 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-sync_wq
      6 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-kvfree_rcu_reclaim
      7 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-slub_flushwq
      8 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-netns
     10 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/0:0H-events_highpri
     13 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-mm_percpu_wq
     14 root      20   0       0      0      0 S   0.0   0.0   0:00.03 ksoftirqd/0
     15 root      20   0       0      0      0 I   0.0   0.0   0:00.01 rcu_preempt
     16 root      20   0       0      0      0 S   0.0   0.0   0:00.00 rcu_exp_par_gp_kthread_worker/0
     17 root      20   0       0      0      0 S   0.0   0.0   0:00.00 rcu_exp_gp_kthread_worker
     18 root      rt   0       0      0      0 S   0.0   0.0   0:00.00 migration/0
     19 root      20   0       0      0      0 S   0.0   0.0   0:00.00 cpuhp/0
     21 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kdevtmpfs
     22 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-inet_frag_wq
     23 root      20   0       0      0      0 I   0.0   0.0   0:00.00 rcu_tasks_kthread
     24 root      20   0       0      0      0 I   0.0   0.0   0:00.00 rcu_tasks_rude_kthread
     25 root      20   0       0      0      0 I   0.0   0.0   0:00.00 rcu_tasks_trace_kthread
     26 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kauditd
     28 root      20   0       0      0      0 S   0.0   0.0   0:00.00 khungtaskd
     29 root      20   0       0      0      0 S   0.0   0.0   0:00.00 oom_reaper
     30 root      20   0       0      0      0 I   0.0   0.0   0:00.05 kworker/u60:1-events_unbound
     31 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-writeback
     32 root      20   0       0      0      0 S   0.0   0.0   0:00.01 kcompactd0
     33 root      39  19       0      0      0 S   0.0   0.0   0:00.00 khugepaged
     34 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-kblockd
     35 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-blkcg_punt_bio
     36 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-kintegrityd
     37 root     -51   0       0      0      0 S   0.0   0.0   0:00.00 irq/9-acpi
     38 root      20   0       0      0      0 S   0.0   0.0   0:00.00 xen-balloon
     39 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-tpm_dev_wq
[root@ip-172-31-7-65 /]#
[root@ip-172-31-7-65 /]#
[root@ip-172-31-7-65 /]#
[root@ip-172-31-7-65 /]# yum install httpd
Amazon Linux 2023 Kernel Livepatch repository                                                                               488 kB/s |  61 kB     00:00
Dependencies resolved.
============================================================================================================================================================
 Package                                  Architecture                Version                                        Repository                        Size
============================================================================================================================================================
Installing:
 httpd                                    x86_64                      2.4.68-1.amzn2023.0.1                          amazonlinux                       46 k
Installing dependencies:
 apr                                      x86_64                      1.7.5-1.amzn2023.0.4                           amazonlinux                      129 k
 apr-util                                 x86_64                      1.6.3-1.amzn2023.0.2                           amazonlinux                       97 k
 apr-util-lmdb                            x86_64                      1.6.3-1.amzn2023.0.2                           amazonlinux                       13 k
 generic-logos-httpd                      noarch                      18.0.0-12.amzn2023.0.3                         amazonlinux                       19 k
 httpd-core                               x86_64                      2.4.68-1.amzn2023.0.1                          amazonlinux                      1.4 M
 httpd-filesystem                         noarch                      2.4.68-1.amzn2023.0.1                          amazonlinux                       12 k
 httpd-tools                              x86_64                      2.4.68-1.amzn2023.0.1                          amazonlinux                       80 k
 libbrotli                                x86_64                      1.0.9-4.amzn2023.0.2                           amazonlinux                      315 k
 mailcap                                  noarch                      2.1.49-3.amzn2023.0.3                          amazonlinux                       33 k
Installing weak dependencies:
 apr-util-openssl                         x86_64                      1.6.3-1.amzn2023.0.2                           amazonlinux                       15 k
 mod_http2                                x86_64                      2.0.42-1.amzn2023.0.1                          amazonlinux                      167 k
 mod_lua                                  x86_64                      2.4.68-1.amzn2023.0.1                          amazonlinux                       59 k

Transaction Summary
============================================================================================================================================================
Install  13 Packages

Total download size: 2.4 M
Installed size: 7.0 M
Is this ok [y/N]: y
Downloading Packages:
(1/13): apr-util-lmdb-1.6.3-1.amzn2023.0.2.x86_64.rpm                                                                       336 kB/s |  13 kB     00:00
(2/13): apr-util-1.6.3-1.amzn2023.0.2.x86_64.rpm                                                                            2.2 MB/s |  97 kB     00:00
(3/13): apr-1.7.5-1.amzn2023.0.4.x86_64.rpm                                                                                 2.5 MB/s | 129 kB     00:00
(4/13): apr-util-openssl-1.6.3-1.amzn2023.0.2.x86_64.rpm                                                                    599 kB/s |  15 kB     00:00
(5/13): generic-logos-httpd-18.0.0-12.amzn2023.0.3.noarch.rpm                                                               763 kB/s |  19 kB     00:00
(6/13): httpd-2.4.68-1.amzn2023.0.1.x86_64.rpm                                                                              1.5 MB/s |  46 kB     00:00
(7/13): httpd-filesystem-2.4.68-1.amzn2023.0.1.noarch.rpm                                                                   427 kB/s |  12 kB     00:00
(8/13): httpd-core-2.4.68-1.amzn2023.0.1.x86_64.rpm                                                                          32 MB/s | 1.4 MB     00:00
(9/13): httpd-tools-2.4.68-1.amzn2023.0.1.x86_64.rpm                                                                        2.2 MB/s |  80 kB     00:00
(10/13): libbrotli-1.0.9-4.amzn2023.0.2.x86_64.rpm                                                                          7.8 MB/s | 315 kB     00:00
(11/13): mailcap-2.1.49-3.amzn2023.0.3.noarch.rpm                                                                           1.0 MB/s |  33 kB     00:00
(12/13): mod_http2-2.0.42-1.amzn2023.0.1.x86_64.rpm                                                                         5.1 MB/s | 167 kB     00:00
(13/13): mod_lua-2.4.68-1.amzn2023.0.1.x86_64.rpm                                                                           2.3 MB/s |  59 kB     00:00
------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                        12 MB/s | 2.4 MB     00:00
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                    1/1
  Installing       : apr-1.7.5-1.amzn2023.0.4.x86_64                                                                                                   1/13
  Installing       : apr-util-lmdb-1.6.3-1.amzn2023.0.2.x86_64                                                                                         2/13
  Installing       : apr-util-openssl-1.6.3-1.amzn2023.0.2.x86_64                                                                                      3/13
  Installing       : apr-util-1.6.3-1.amzn2023.0.2.x86_64                                                                                              4/13
  Installing       : mailcap-2.1.49-3.amzn2023.0.3.noarch                                                                                              5/13
  Installing       : httpd-tools-2.4.68-1.amzn2023.0.1.x86_64                                                                                          6/13
  Installing       : libbrotli-1.0.9-4.amzn2023.0.2.x86_64                                                                                             7/13
  Running scriptlet: httpd-filesystem-2.4.68-1.amzn2023.0.1.noarch                                                                                     8/13
  Installing       : httpd-filesystem-2.4.68-1.amzn2023.0.1.noarch                                                                                     8/13
  Installing       : httpd-core-2.4.68-1.amzn2023.0.1.x86_64                                                                                           9/13
  Installing       : mod_http2-2.0.42-1.amzn2023.0.1.x86_64                                                                                           10/13
  Installing       : mod_lua-2.4.68-1.amzn2023.0.1.x86_64                                                                                             11/13
  Installing       : generic-logos-httpd-18.0.0-12.amzn2023.0.3.noarch                                                                                12/13
  Installing       : httpd-2.4.68-1.amzn2023.0.1.x86_64                                                                                               13/13
  Running scriptlet: httpd-2.4.68-1.amzn2023.0.1.x86_64                                                                                               13/13
  Verifying        : apr-1.7.5-1.amzn2023.0.4.x86_64                                                                                                   1/13
  Verifying        : apr-util-1.6.3-1.amzn2023.0.2.x86_64                                                                                              2/13
  Verifying        : apr-util-lmdb-1.6.3-1.amzn2023.0.2.x86_64                                                                                         3/13
  Verifying        : apr-util-openssl-1.6.3-1.amzn2023.0.2.x86_64                                                                                      4/13
  Verifying        : generic-logos-httpd-18.0.0-12.amzn2023.0.3.noarch                                                                                 5/13
  Verifying        : httpd-2.4.68-1.amzn2023.0.1.x86_64                                                                                                6/13
  Verifying        : httpd-core-2.4.68-1.amzn2023.0.1.x86_64                                                                                           7/13
  Verifying        : httpd-filesystem-2.4.68-1.amzn2023.0.1.noarch                                                                                     8/13
  Verifying        : httpd-tools-2.4.68-1.amzn2023.0.1.x86_64                                                                                          9/13
  Verifying        : libbrotli-1.0.9-4.amzn2023.0.2.x86_64                                                                                            10/13
  Verifying        : mailcap-2.1.49-3.amzn2023.0.3.noarch                                                                                             11/13
  Verifying        : mod_http2-2.0.42-1.amzn2023.0.1.x86_64                                                                                           12/13
  Verifying        : mod_lua-2.4.68-1.amzn2023.0.1.x86_64                                                                                             13/13

Installed:
  apr-1.7.5-1.amzn2023.0.4.x86_64                    apr-util-1.6.3-1.amzn2023.0.2.x86_64                    apr-util-lmdb-1.6.3-1.amzn2023.0.2.x86_64
  apr-util-openssl-1.6.3-1.amzn2023.0.2.x86_64       generic-logos-httpd-18.0.0-12.amzn2023.0.3.noarch       httpd-2.4.68-1.amzn2023.0.1.x86_64
  httpd-core-2.4.68-1.amzn2023.0.1.x86_64            httpd-filesystem-2.4.68-1.amzn2023.0.1.noarch           httpd-tools-2.4.68-1.amzn2023.0.1.x86_64
  libbrotli-1.0.9-4.amzn2023.0.2.x86_64              mailcap-2.1.49-3.amzn2023.0.3.noarch                    mod_http2-2.0.42-1.amzn2023.0.1.x86_64
  mod_lua-2.4.68-1.amzn2023.0.1.x86_64

Complete!
[root@ip-172-31-7-65 /]# yum install httpd
Last metadata expiration check: 0:03:21 ago on Sat Aug  1 05:18:40 2026.
Package httpd-2.4.68-1.amzn2023.0.1.x86_64 is already installed.
Dependencies resolved.
Nothing to do.
Complete!
[root@ip-172-31-7-65 /]# cd /var/www/html
[root@ip-172-31-7-65 html]# ls
[root@ip-172-31-7-65 html]# pwd
/var/www/html
[root@ip-172-31-7-65 html]# vi index.html
[root@ip-172-31-7-65 html]# ls
index.html
[root@ip-172-31-7-65 html]# vi index.html
[root@ip-172-31-7-65 html]# cat index.html
<h1> Hi GFG 48 </h1>
<p> how r u </p>
[root@ip-172-31-7-65 html]# ls
index.html
[root@ip-172-31-7-65 html]# systemctl status httpd
○ httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
     Active: inactive (dead)
       Docs: man:httpd.service(8)
[root@ip-172-31-7-65 html]# systemctl start httpd
[root@ip-172-31-7-65 html]# systemctl status httpd
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
     Active: active (running) since Sat 2026-08-01 05:30:11 UTC; 1s ago
       Docs: man:httpd.service(8)
   Main PID: 27438 (httpd)
     Status: "Started, listening on: port 80"
      Tasks: 177 (limit: 1113)
     Memory: 13.4M
        CPU: 48ms
     CGroup: /system.slice/httpd.service
             ├─27438 /usr/sbin/httpd -DFOREGROUND
             ├─27439 /usr/sbin/httpd -DFOREGROUND
             ├─27440 /usr/sbin/httpd -DFOREGROUND
             ├─27441 /usr/sbin/httpd -DFOREGROUND
             └─27464 /usr/sbin/httpd -DFOREGROUND

Aug 01 05:30:11 ip-172-31-7-65.ap-south-1.compute.internal systemd[1]: Starting httpd.service - The Apache HTTP Server...
Aug 01 05:30:11 ip-172-31-7-65.ap-south-1.compute.internal systemd[1]: Started httpd.service - The Apache HTTP Server.
Aug 01 05:30:11 ip-172-31-7-65.ap-south-1.compute.internal httpd[27438]: Server configured, listening on: port 80
[root@ip-172-31-7-65 html]#
[root@ip-172-31-7-65 html]#
[root@ip-172-31-7-65 html]# vi index.html

[root@ip-172-31-7-65 html]# cd /
[root@ip-172-31-7-65 /]# ls
bin  boot  dev  etc  home  lib  lib64  local  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@ip-172-31-7-65 /]# cd /var
[root@ip-172-31-7-65 var]# ls
account  adm  cache  db  empty  ftp  games  kerberos  lib  local  lock  log  mail  nis  opt  preserve  run  spool  tmp  www  yp
[root@ip-172-31-7-65 var]# cd log
[root@ip-172-31-7-65 log]# ls
README  audit  chrony                 cloud-init.log   dnf.log      hawkey.log  journal  private  sssd      wtmp
amazon  btmp   cloud-init-output.log  dnf.librepo.log  dnf.rpm.log  httpd       lastlog  sa       tallylog
[root@ip-172-31-7-65 log]# cd httpd/
[root@ip-172-31-7-65 httpd]# ls
access_log  error_log
[root@ip-172-31-7-65 httpd]# pwd
/var/log/httpd
[root@ip-172-31-7-65 httpd]# ls
access_log  error_log
[root@ip-172-31-7-65 httpd]# cat access_log
122.161.175.108 - - [01/Aug/2026:05:33:11 +0000] "GET / HTTP/1.1" 200 38 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
122.161.175.108 - - [01/Aug/2026:05:33:12 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
106.200.26.199 - - [01/Aug/2026:05:33:34 +0000] "GET / HTTP/1.1" 200 38 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
106.200.26.199 - - [01/Aug/2026:05:33:34 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
182.79.194.7 - - [01/Aug/2026:05:33:36 +0000] "GET / HTTP/1.1" 200 38 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36"
182.79.194.7 - - [01/Aug/2026:05:33:37 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36"
122.168.71.20 - - [01/Aug/2026:05:33:45 +0000] "GET / HTTP/1.1" 200 38 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36"
157.50.192.248 - - [01/Aug/2026:05:33:45 +0000] "GET / HTTP/1.1" 200 38 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0"
122.168.71.20 - - [01/Aug/2026:05:33:45 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36"
157.50.192.248 - - [01/Aug/2026:05:33:45 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0"
122.168.71.20 - - [01/Aug/2026:05:33:52 +0000] "GET / HTTP/1.1" 304 - "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36"
49.37.8.222 - - [01/Aug/2026:05:33:54 +0000] "GET / HTTP/1.1" 200 38 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
49.37.8.222 - - [01/Aug/2026:05:33:54 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
103.58.154.108 - - [01/Aug/2026:05:33:59 +0000] "GET / HTTP/1.1" 200 54 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
103.58.154.108 - - [01/Aug/2026:05:33:59 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
122.168.71.20 - - [01/Aug/2026:05:33:59 +0000] "GET / HTTP/1.1" 200 54 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36"
122.161.175.108 - - [01/Aug/2026:05:34:01 +0000] "GET / HTTP/1.1" 200 54 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
123.176.33.201 - - [01/Aug/2026:05:34:05 +0000] "GET / HTTP/1.1" 200 54 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
123.176.33.201 - - [01/Aug/2026:05:34:05 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
49.43.88.57 - - [01/Aug/2026:05:34:08 +0000] "GET / HTTP/1.1" 200 54 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0"
49.43.88.57 - - [01/Aug/2026:05:34:09 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0"
157.50.192.248 - - [01/Aug/2026:05:34:34 +0000] "-" 408 - "-" "-"
157.50.192.248 - - [01/Aug/2026:05:34:34 +0000] "-" 408 - "-" "-"
122.168.71.20 - - [01/Aug/2026:05:34:52 +0000] "-" 408 - "-" "-"
122.161.175.108 - - [01/Aug/2026:05:34:53 +0000] "-" 408 - "-" "-"
171.61.1.211 - - [01/Aug/2026:05:35:00 +0000] "GET / HTTP/1.1" 200 54 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
171.61.1.211 - - [01/Aug/2026:05:35:01 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
49.43.88.57 - - [01/Aug/2026:05:35:01 +0000] "-" 408 - "-" "-"
171.61.1.211 - - [01/Aug/2026:05:35:49 +0000] "-" 408 - "-" "-"
171.61.1.211 - - [01/Aug/2026:05:35:49 +0000] "-" 408 - "-" "-"
[root@ip-172-31-7-65 httpd]# cat access_log
122.161.175.108 - - [01/Aug/2026:05:33:11 +0000] "GET / HTTP/1.1" 200 38 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
122.161.175.108 - - [01/Aug/2026:05:33:12 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
106.200.26.199 - - [01/Aug/2026:05:33:34 +0000] "GET / HTTP/1.1" 200 38 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
106.200.26.199 - - [01/Aug/2026:05:33:34 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
182.79.194.7 - - [01/Aug/2026:05:33:36 +0000] "GET / HTTP/1.1" 200 38 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36"
182.79.194.7 - - [01/Aug/2026:05:33:37 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36"
122.168.71.20 - - [01/Aug/2026:05:33:45 +0000] "GET / HTTP/1.1" 200 38 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36"
157.50.192.248 - - [01/Aug/2026:05:33:45 +0000] "GET / HTTP/1.1" 200 38 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0"
122.168.71.20 - - [01/Aug/2026:05:33:45 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36"
157.50.192.248 - - [01/Aug/2026:05:33:45 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0"
122.168.71.20 - - [01/Aug/2026:05:33:52 +0000] "GET / HTTP/1.1" 304 - "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36"
49.37.8.222 - - [01/Aug/2026:05:33:54 +0000] "GET / HTTP/1.1" 200 38 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
49.37.8.222 - - [01/Aug/2026:05:33:54 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
103.58.154.108 - - [01/Aug/2026:05:33:59 +0000] "GET / HTTP/1.1" 200 54 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
103.58.154.108 - - [01/Aug/2026:05:33:59 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
122.168.71.20 - - [01/Aug/2026:05:33:59 +0000] "GET / HTTP/1.1" 200 54 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36"
122.161.175.108 - - [01/Aug/2026:05:34:01 +0000] "GET / HTTP/1.1" 200 54 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
123.176.33.201 - - [01/Aug/2026:05:34:05 +0000] "GET / HTTP/1.1" 200 54 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
123.176.33.201 - - [01/Aug/2026:05:34:05 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
49.43.88.57 - - [01/Aug/2026:05:34:08 +0000] "GET / HTTP/1.1" 200 54 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0"
49.43.88.57 - - [01/Aug/2026:05:34:09 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0"
157.50.192.248 - - [01/Aug/2026:05:34:34 +0000] "-" 408 - "-" "-"
157.50.192.248 - - [01/Aug/2026:05:34:34 +0000] "-" 408 - "-" "-"
122.168.71.20 - - [01/Aug/2026:05:34:52 +0000] "-" 408 - "-" "-"
122.161.175.108 - - [01/Aug/2026:05:34:53 +0000] "-" 408 - "-" "-"
171.61.1.211 - - [01/Aug/2026:05:35:00 +0000] "GET / HTTP/1.1" 200 54 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
171.61.1.211 - - [01/Aug/2026:05:35:01 +0000] "GET /favicon.ico HTTP/1.1" 404 236 "http://3.110.188.224/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
49.43.88.57 - - [01/Aug/2026:05:35:01 +0000] "-" 408 - "-" "-"
171.61.1.211 - - [01/Aug/2026:05:35:49 +0000] "-" 408 - "-" "-"
171.61.1.211 - - [01/Aug/2026:05:35:49 +0000] "-" 408 - "-" "-"
122.161.175.108 - - [01/Aug/2026:05:37:14 +0000] "GET /a.html HTTP/1.1" 404 236 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
122.161.175.108 - - [01/Aug/2026:05:37:17 +0000] "GET /a.html HTTP/1.1" 404 236 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
122.161.175.108 - - [01/Aug/2026:05:37:18 +0000] "GET /a.html HTTP/1.1" 404 236 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
122.161.175.108 - - [01/Aug/2026:05:37:18 +0000] "GET /a.html HTTP/1.1" 404 236 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
122.161.175.108 - - [01/Aug/2026:05:37:18 +0000] "GET /a.html HTTP/1.1" 404 236 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
122.161.175.108 - - [01/Aug/2026:05:37:18 +0000] "GET /a.html HTTP/1.1" 404 236 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
122.161.175.108 - - [01/Aug/2026:05:37:18 +0000] "GET /a.html HTTP/1.1" 404 236 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"
[root@ip-172-31-7-65 httpd]# cd /
[root@ip-172-31-7-65 /]# ls
bin  boot  dev  etc  home  lib  lib64  local  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@ip-172-31-7-65 /]# cd etc/
[root@ip-172-31-7-65 etc]# ls
DIR_COLORS                cifs-utils             filesystems         inittab         machine-id      passwd-           rpm            sudo.conf
DIR_COLORS.lightbgcolor   cloud                  fstab               inputrc         magic           pkcs11            rsyncd.conf    sudoers
GREP_COLORS               cpupower-service.conf  gcrypt              issue           mailcap         pkgconfig         rsyslog.d      sudoers.d
NetworkManager            cron.daily             gnupg               issue.net       man_db.conf     pki               rwtab.d        sysconfig
X11                       cron.hourly            groff               kernel          mime.types      pm                sasl2          sysctl.conf
acpi                      cron.monthly           group               keyutils        mke2fs.conf     popt.d            screenrc       sysctl.d
adjtime                   cron.weekly            group-              krb5.conf       modprobe.d      printcap          security       system-release
aliases                   crontab                grub.d              krb5.conf.d     modules-load.d  profile           selinux        system-release-cpe
alternatives              crypto-policies        grub2-efi.cfg       ld.so.cache     motd            profile.d         services       systemd
amazon                    csh.cshrc              grub2.cfg           ld.so.conf      motd.d          protocols         sestatus.conf  terminfo
amazon-linux-release      csh.login              gshadow             ld.so.conf.d    mtab            rc.d              shadow         tmpfiles.d
amazon-linux-release-cpe  dbus-1                 gshadow-            libaudit.conf   nanorc          rc0.d             shadow-        trusted-key.key
at.deny                   default                gss                 libibverbs.d    netconfig       rc1.d             shells         udev
audit                     depmod.d               gssproxy            libnl           networks        rc2.d             skel           update-motd.d
bash_completion.d         dhcp                   hibinit-config.cfg  libreport       nfs.conf        rc3.d             ssh            vimrc
bashrc                    dnf                    host.conf           libuser.conf    nfsmount.conf   rc4.d             ssl            virc
bindresvport.blacklist    dracut.conf            hostname            locale.conf     nsswitch.conf   rc5.d             sssd           wgetrc
binfmt.d                  dracut.conf.d          hosts               localtime       openldap        rc6.d             statetab.d     xattr.conf
chkconfig.d               environment            httpd               login.defs      opt             request-key.conf  subgid         xdg
chrony.conf               ethertypes             idmapd.conf         logrotate.conf  os-release      request-key.d     subgid-        yum.repos.d
chrony.d                  exports                image-id            logrotate.d     pam.d           resolv.conf       subuid
chrony.keys               exports.d              init.d              lsm             passwd          rpc               subuid-
[root@ip-172-31-7-65 etc]# cd httpd/
[root@ip-172-31-7-65 httpd]# ls
conf  conf.d  conf.modules.d  logs  modules  run  state
[root@ip-172-31-7-65 httpd]# cd conf.
conf.d/         conf.modules.d/
[root@ip-172-31-7-65 httpd]# cd conf.
conf.d/         conf.modules.d/
[root@ip-172-31-7-65 httpd]# cd conf.d/
[root@ip-172-31-7-65 conf.d]# pwd
/etc/httpd/conf.d
[root@ip-172-31-7-65 conf.d]# ls
README  autoindex.conf  userdir.conf  welcome.conf
[root@ip-172-31-7-65 conf.d]# ls
README  autoindex.conf  userdir.conf  welcome.conf
[root@ip-172-31-7-65 conf.d]# pwd
/etc/httpd/conf.d
[root@ip-172-31-7-65 conf.d]# cd ..
[root@ip-172-31-7-65 httpd]# ls
conf  conf.d  conf.modules.d  logs  modules  run  state
[root@ip-172-31-7-65 httpd]# cd conf
[root@ip-172-31-7-65 conf]# ls
httpd.conf  magic
[root@ip-172-31-7-65 conf]# pwd
/etc/httpd/conf
[root@ip-172-31-7-65 conf]# vi httpd.conf
[root@ip-172-31-7-65 conf]# vi httpd.conf
[root@ip-172-31-7-65 conf]# systemctl restart httpd
[root@ip-172-31-7-65 conf]#
[root@ip-172-31-7-65 conf]#
[root@ip-172-31-7-65 conf]#
[root@ip-172-31-7-65 conf]# ps -aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  1.8 173512 17936 ?        Ss   05:00   0:01 /usr/lib/systemd/systemd --switched-root --system --deserialize=32
root           2  0.0  0.0      0     0 ?        S    05:00   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        S    05:00   0:00 [pool_workqueue_release]
root           4  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-rcu_gp]
root           5  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-sync_wq]
root           6  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kvfree_rcu_reclaim]
root           7  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-slub_flushwq]
root           8  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-netns]
root          10  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/0:0H-events_highpri]
root          13  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-mm_percpu_wq]
root          14  0.0  0.0      0     0 ?        S    05:00   0:00 [ksoftirqd/0]
root          15  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_preempt]
root          16  0.0  0.0      0     0 ?        S    05:00   0:00 [rcu_exp_par_gp_kthread_worker/0]
root          17  0.0  0.0      0     0 ?        S    05:00   0:00 [rcu_exp_gp_kthread_worker]
root          18  0.0  0.0      0     0 ?        S    05:00   0:00 [migration/0]
root          19  0.0  0.0      0     0 ?        S    05:00   0:00 [cpuhp/0]
root          21  0.0  0.0      0     0 ?        S    05:00   0:00 [kdevtmpfs]
root          22  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-inet_frag_wq]
root          23  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_tasks_kthread]
root          24  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_tasks_rude_kthread]
root          25  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_tasks_trace_kthread]
root          26  0.0  0.0      0     0 ?        S    05:00   0:00 [kauditd]
root          28  0.0  0.0      0     0 ?        S    05:00   0:00 [khungtaskd]
root          29  0.0  0.0      0     0 ?        S    05:00   0:00 [oom_reaper]
root          30  0.0  0.0      0     0 ?        I    05:00   0:00 [kworker/u60:1-kvfree_rcu_reclaim]
root          31  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-writeback]
root          32  0.0  0.0      0     0 ?        S    05:00   0:00 [kcompactd0]
root          33  0.0  0.0      0     0 ?        SN   05:00   0:00 [khugepaged]
root          34  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kblockd]
root          35  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-blkcg_punt_bio]
root          36  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kintegrityd]
root          37  0.0  0.0      0     0 ?        S    05:00   0:00 [irq/9-acpi]
root          38  0.0  0.0      0     0 ?        S    05:00   0:00 [xen-balloon]
root          39  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-tpm_dev_wq]
root          40  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-md_bitmap]
root          41  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-edac-poller]
root          42  0.0  0.0      0     0 ?        S    05:00   0:00 [watchdogd]
root          43  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-quota_events_unbound]
root          45  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/0:1H-xfs-log/xvda1]
root          52  0.0  0.0      0     0 ?        S    05:00   0:00 [kswapd0]
root          82  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfsalloc]
root          84  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs_mru_cache]
root          85  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-cryptd]
root          86  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kthrotld]
root          98  0.0  0.0      0     0 ?        S    05:00   0:00 [xenbus]
root         101  0.0  0.0      0     0 ?        S    05:00   0:00 [xenwatch]
root         132  0.0  0.0      0     0 ?        I    05:00   0:00 [kworker/u60:3-flush-202:0]
root         150  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-nvme-wq]
root         153  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-nvme-reset-wq]
root         155  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-nvme-delete-wq]
root         162  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-mld]
root         184  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-ipv6_addrconf]
root         185  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kstrp]
root         559  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/u61:0]
root        1307  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-buf/xvda1]
root        1308  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-conv/xvda1]
root        1309  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-reclaim/xvda1]
root        1310  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-blockgc/xvda1]
root        1311  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-inodegc/xvda1]
root        1312  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-log/xvda1]
root        1313  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-cil/xvda1]
root        1314  0.0  0.0      0     0 ?        S    05:00   0:00 [xfsaild/xvda1]
root        1364  0.0  1.5  54264 15404 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-journald
root        2057  0.0  1.2  33012 11940 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-udevd
root        2058  0.0  0.0      0     0 ?        I    05:00   0:00 [kworker/u60:4-events_unbound]
systemd+    2063  0.0  1.5  23500 15640 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-resolved
root        2068  0.0  0.2  21928  2684 ?        S<sl 05:00   0:00 /sbin/auditd
root        2077  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-rpciod]
root        2078  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xprtiod]
root        2199  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-ata_sff]
root        2206  0.0  0.0      0     0 ?        S    05:00   0:00 [scsi_eh_0]
root        2215  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-scsi_tmf_0]
root        2216  0.0  0.0      0     0 ?        S    05:00   0:00 [scsi_eh_1]
root        2220  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-scsi_tmf_1]
root        2250  0.0  0.7  17084  7292 ?        Ss   05:00   0:00 /usr/bin/systemd-inhibit --what=handle-suspend-key:handle-hibernate-key --who=ec2-hibinit
libstor+    2253  0.0  0.2   2788  1996 ?        Ss   05:00   0:00 /usr/bin/lsmd -d
root        2256  0.0  0.8  17568  8296 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-homed
root        2257  0.0  1.0  19436 10752 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-logind
dbus        2258  0.0  0.4   8500  4100 ?        Ss   05:00   0:00 /usr/bin/dbus-broker-launch --scope system --audit
systemd+    2259  0.0  1.0 237660 10244 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-networkd
dbus        2281  0.0  0.3   5660  3304 ?        S    05:00   0:00 dbus-broker --log 4 --controller 9 --machine-id ec20177ba55c9080d6fa224c1b00d9c7 --max-by
root        2283  0.0  0.1   2700  1836 ?        S    05:00   0:00 /usr/sbin/acpid -f
root        2286  0.0  0.3 282724  3892 ?        Ssl  05:00   0:00 /usr/sbin/gssproxy -D
root        2431  0.0  2.0 1242036 19660 ?       Ssl  05:00   0:00 /usr/bin/amazon-ssm-agent
root        2435  0.0  0.9  15264  9244 ?        Ss   05:00   0:00 sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
root        2438  0.0  0.2   4792  2616 ?        Ss   05:00   0:00 /usr/sbin/atd -f
root        2439  0.0  0.1 221376  1908 tty1     Ss+  05:00   0:00 /sbin/agetty -o -p -- \u --noclear - linux
root        2440  0.0  0.1 221420  1960 ttyS0    Ss+  05:00   0:00 /sbin/agetty -o -p -- \u --keep-baud 115200,57600,38400,9600 - vt220
chrony      2464  0.0  0.3  87156  3900 ?        S    05:00   0:00 /usr/sbin/chronyd -F 2
root        2631  0.0  1.1  16876 11080 ?        Ss   05:04   0:00 sshd: ec2-user [priv]
root        2634  0.0  0.7  17084  7216 ?        Ss   05:04   0:00 /usr/lib/systemd/systemd-userdbd
ec2-user    2639  0.0  1.4  22696 14140 ?        Ss   05:04   0:00 /usr/lib/systemd/systemd --user
ec2-user    2641  0.0  0.8 108888  8688 ?        S    05:04   0:00 (sd-pam)
ec2-user    2648  0.0  0.7  16876  6992 ?        S    05:04   0:00 sshd: ec2-user@pts/0
ec2-user    2649  0.0  0.5 224096  4996 pts/0    Ss   05:04   0:00 -bash
root        2856  0.0  0.8 235456  8428 pts/0    R+   05:08   0:00 sudo su root
root        2858  0.0  0.2 235456  2644 pts/1    Ss   05:08   0:00 sudo su root
root        2859  0.0  0.4 225368  4692 pts/1    S    05:08   0:00 su root
root        2860  0.0  0.5 224260  5160 pts/1    S    05:08   0:00 bash
root        3130  0.0  0.0      0     0 ?        I    05:18   0:00 [kworker/0:0-cgroup_free]
root       27979  0.0  0.0      0     0 ?        I    05:35   0:00 [kworker/0:2-events_power_efficient]
root       28487  0.0  1.1  19180 11640 ?        Ss   05:45   0:00 /usr/sbin/httpd -DFOREGROUND
apache     28489  0.0  0.4  18836  4780 ?        S    05:45   0:00 /usr/sbin/httpd -DFOREGROUND
apache     28490  0.0  1.0 1250704 9992 ?        Sl   05:45   0:00 /usr/sbin/httpd -DFOREGROUND
apache     28491  0.0  0.9 1086932 9800 ?        Sl   05:45   0:00 /usr/sbin/httpd -DFOREGROUND
apache     28492  0.0  1.0 1086932 9824 ?        Sl   05:45   0:00 /usr/sbin/httpd -DFOREGROUND
apache     28728  0.0  0.9 1086800 9200 ?        Sl   05:46   0:00 /usr/sbin/httpd -DFOREGROUND
root       28955  0.0  0.7  17444  7216 ?        S    05:50   0:00 systemd-userwork: waiting...
root       28956  0.0  0.7  17444  7304 ?        S    05:50   0:00 systemd-userwork: waiting...
root       28957  0.0  0.7  17444  7260 ?        S    05:50   0:00 systemd-userwork: waiting...
root       29073  0.0  0.2 223608  2932 pts/1    R+   05:53   0:00 ps -aux
[root@ip-172-31-7-65 conf]# systemctl stop httpd
[root@ip-172-31-7-65 conf]# ps -aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  1.8 173512 17936 ?        Ss   05:00   0:01 /usr/lib/systemd/systemd --switched-root --system --deserialize=32
root           2  0.0  0.0      0     0 ?        S    05:00   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        S    05:00   0:00 [pool_workqueue_release]
root           4  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-rcu_gp]
root           5  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-sync_wq]
root           6  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kvfree_rcu_reclaim]
root           7  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-slub_flushwq]
root           8  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-netns]
root          10  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/0:0H-events_highpri]
root          13  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-mm_percpu_wq]
root          14  0.0  0.0      0     0 ?        S    05:00   0:00 [ksoftirqd/0]
root          15  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_preempt]
root          16  0.0  0.0      0     0 ?        S    05:00   0:00 [rcu_exp_par_gp_kthread_worker/0]
root          17  0.0  0.0      0     0 ?        S    05:00   0:00 [rcu_exp_gp_kthread_worker]
root          18  0.0  0.0      0     0 ?        S    05:00   0:00 [migration/0]
root          19  0.0  0.0      0     0 ?        S    05:00   0:00 [cpuhp/0]
root          21  0.0  0.0      0     0 ?        S    05:00   0:00 [kdevtmpfs]
root          22  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-inet_frag_wq]
root          23  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_tasks_kthread]
root          24  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_tasks_rude_kthread]
root          25  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_tasks_trace_kthread]
root          26  0.0  0.0      0     0 ?        S    05:00   0:00 [kauditd]
root          28  0.0  0.0      0     0 ?        S    05:00   0:00 [khungtaskd]
root          29  0.0  0.0      0     0 ?        S    05:00   0:00 [oom_reaper]
root          30  0.0  0.0      0     0 ?        I    05:00   0:00 [kworker/u60:1-kvfree_rcu_reclaim]
root          31  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-writeback]
root          32  0.0  0.0      0     0 ?        S    05:00   0:00 [kcompactd0]
root          33  0.0  0.0      0     0 ?        SN   05:00   0:00 [khugepaged]
root          34  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kblockd]
root          35  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-blkcg_punt_bio]
root          36  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kintegrityd]
root          37  0.0  0.0      0     0 ?        S    05:00   0:00 [irq/9-acpi]
root          38  0.0  0.0      0     0 ?        S    05:00   0:00 [xen-balloon]
root          39  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-tpm_dev_wq]
root          40  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-md_bitmap]
root          41  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-edac-poller]
root          42  0.0  0.0      0     0 ?        S    05:00   0:00 [watchdogd]
root          43  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-quota_events_unbound]
root          45  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/0:1H-kblockd]
root          52  0.0  0.0      0     0 ?        S    05:00   0:00 [kswapd0]
root          82  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfsalloc]
root          84  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs_mru_cache]
root          85  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-cryptd]
root          86  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kthrotld]
root          98  0.0  0.0      0     0 ?        S    05:00   0:00 [xenbus]
root         101  0.0  0.0      0     0 ?        S    05:00   0:00 [xenwatch]
root         132  0.0  0.0      0     0 ?        I    05:00   0:00 [kworker/u60:3-events_unbound]
root         150  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-nvme-wq]
root         153  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-nvme-reset-wq]
root         155  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-nvme-delete-wq]
root         162  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-mld]
root         184  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-ipv6_addrconf]
root         185  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kstrp]
root         559  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/u61:0]
root        1307  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-buf/xvda1]
root        1308  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-conv/xvda1]
root        1309  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-reclaim/xvda1]
root        1310  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-blockgc/xvda1]
root        1311  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-inodegc/xvda1]
root        1312  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-log/xvda1]
root        1313  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-cil/xvda1]
root        1314  0.0  0.0      0     0 ?        S    05:00   0:00 [xfsaild/xvda1]
root        1364  0.0  1.5  54264 15404 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-journald
root        2057  0.0  1.2  33012 11940 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-udevd
root        2058  0.0  0.0      0     0 ?        R    05:00   0:00 [kworker/u60:4-events_unbound]
systemd+    2063  0.0  1.5  23500 15640 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-resolved
root        2068  0.0  0.2  21928  2684 ?        S<sl 05:00   0:00 /sbin/auditd
root        2077  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-rpciod]
root        2078  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xprtiod]
root        2199  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-ata_sff]
root        2206  0.0  0.0      0     0 ?        S    05:00   0:00 [scsi_eh_0]
root        2215  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-scsi_tmf_0]
root        2216  0.0  0.0      0     0 ?        S    05:00   0:00 [scsi_eh_1]
root        2220  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-scsi_tmf_1]
root        2250  0.0  0.7  17084  7292 ?        Ss   05:00   0:00 /usr/bin/systemd-inhibit --what=handle-suspend-key:handle-hibernate-key --who=ec2-hibinit
libstor+    2253  0.0  0.2   2788  1996 ?        Ss   05:00   0:00 /usr/bin/lsmd -d
root        2256  0.0  0.8  17568  8296 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-homed
root        2257  0.0  1.0  19436 10752 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-logind
dbus        2258  0.0  0.4   8500  4100 ?        Ss   05:00   0:00 /usr/bin/dbus-broker-launch --scope system --audit
systemd+    2259  0.0  1.0 237660 10244 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-networkd
dbus        2281  0.0  0.3   5660  3304 ?        S    05:00   0:00 dbus-broker --log 4 --controller 9 --machine-id ec20177ba55c9080d6fa224c1b00d9c7 --max-by
root        2283  0.0  0.1   2700  1836 ?        S    05:00   0:00 /usr/sbin/acpid -f
root        2286  0.0  0.3 282724  3892 ?        Ssl  05:00   0:00 /usr/sbin/gssproxy -D
root        2431  0.0  2.0 1242036 19692 ?       Ssl  05:00   0:00 /usr/bin/amazon-ssm-agent
root        2435  0.0  0.9  15264  9244 ?        Ss   05:00   0:00 sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
root        2438  0.0  0.2   4792  2616 ?        Ss   05:00   0:00 /usr/sbin/atd -f
root        2439  0.0  0.1 221376  1908 tty1     Ss+  05:00   0:00 /sbin/agetty -o -p -- \u --noclear - linux
root        2440  0.0  0.1 221420  1960 ttyS0    Ss+  05:00   0:00 /sbin/agetty -o -p -- \u --keep-baud 115200,57600,38400,9600 - vt220
chrony      2464  0.0  0.3  87156  3900 ?        S    05:00   0:00 /usr/sbin/chronyd -F 2
root        2631  0.0  1.1  16876 11080 ?        Ss   05:04   0:00 sshd: ec2-user [priv]
root        2634  0.0  0.7  17084  7216 ?        Ss   05:04   0:00 /usr/lib/systemd/systemd-userdbd
ec2-user    2639  0.0  1.4  22696 14140 ?        Ss   05:04   0:00 /usr/lib/systemd/systemd --user
ec2-user    2641  0.0  0.8 108888  8688 ?        S    05:04   0:00 (sd-pam)
ec2-user    2648  0.0  0.7  16876  6992 ?        S    05:04   0:00 sshd: ec2-user@pts/0
ec2-user    2649  0.0  0.5 224096  4996 pts/0    Ss   05:04   0:00 -bash
root        2856  0.0  0.8 235456  8428 pts/0    S+   05:08   0:00 sudo su root
root        2858  0.0  0.2 235456  2644 pts/1    Ss   05:08   0:00 sudo su root
root        2859  0.0  0.4 225368  4692 pts/1    S    05:08   0:00 su root
root        2860  0.0  0.5 224260  5160 pts/1    S    05:08   0:00 bash
root        3130  0.0  0.0      0     0 ?        I    05:18   0:00 [kworker/0:0-cgroup_free]
root       27979  0.0  0.0      0     0 ?        I    05:35   0:00 [kworker/0:2-events]
root       28955  0.0  0.7  17444  7216 ?        S    05:50   0:00 systemd-userwork: waiting...
root       28956  0.0  0.7  17444  7304 ?        S    05:50   0:00 systemd-userwork: waiting...
root       28957  0.0  0.7  17444  7260 ?        S    05:50   0:00 systemd-userwork: waiting...
root       29131  0.0  0.0      0     0 ?        I    05:53   0:00 [kworker/0:1]
root       29136  0.0  0.2 223608  2940 pts/1    R+   05:53   0:00 ps -aux
[root@ip-172-31-7-65 conf]# systemctl start httpd
[root@ip-172-31-7-65 conf]# ps -aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  1.8 173512 17936 ?        Ss   05:00   0:01 /usr/lib/systemd/systemd --switched-root --system --deserialize=32
root           2  0.0  0.0      0     0 ?        S    05:00   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        S    05:00   0:00 [pool_workqueue_release]
root           4  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-rcu_gp]
root           5  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-sync_wq]
root           6  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kvfree_rcu_reclaim]
root           7  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-slub_flushwq]
root           8  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-netns]
root          10  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/0:0H-events_highpri]
root          13  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-mm_percpu_wq]
root          14  0.0  0.0      0     0 ?        S    05:00   0:00 [ksoftirqd/0]
root          15  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_preempt]
root          16  0.0  0.0      0     0 ?        S    05:00   0:00 [rcu_exp_par_gp_kthread_worker/0]
root          17  0.0  0.0      0     0 ?        S    05:00   0:00 [rcu_exp_gp_kthread_worker]
root          18  0.0  0.0      0     0 ?        S    05:00   0:00 [migration/0]
root          19  0.0  0.0      0     0 ?        S    05:00   0:00 [cpuhp/0]
root          21  0.0  0.0      0     0 ?        S    05:00   0:00 [kdevtmpfs]
root          22  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-inet_frag_wq]
root          23  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_tasks_kthread]
root          24  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_tasks_rude_kthread]
root          25  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_tasks_trace_kthread]
root          26  0.0  0.0      0     0 ?        S    05:00   0:00 [kauditd]
root          28  0.0  0.0      0     0 ?        S    05:00   0:00 [khungtaskd]
root          29  0.0  0.0      0     0 ?        S    05:00   0:00 [oom_reaper]
root          30  0.0  0.0      0     0 ?        I    05:00   0:00 [kworker/u60:1-kvfree_rcu_reclaim]
root          31  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-writeback]
root          32  0.0  0.0      0     0 ?        S    05:00   0:00 [kcompactd0]
root          33  0.0  0.0      0     0 ?        SN   05:00   0:00 [khugepaged]
root          34  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kblockd]
root          35  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-blkcg_punt_bio]
root          36  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kintegrityd]
root          37  0.0  0.0      0     0 ?        S    05:00   0:00 [irq/9-acpi]
root          38  0.0  0.0      0     0 ?        S    05:00   0:00 [xen-balloon]
root          39  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-tpm_dev_wq]
root          40  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-md_bitmap]
root          41  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-edac-poller]
root          42  0.0  0.0      0     0 ?        S    05:00   0:00 [watchdogd]
root          43  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-quota_events_unbound]
root          45  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/0:1H-kblockd]
root          52  0.0  0.0      0     0 ?        S    05:00   0:00 [kswapd0]
root          82  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfsalloc]
root          84  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs_mru_cache]
root          85  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-cryptd]
root          86  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kthrotld]
root          98  0.0  0.0      0     0 ?        S    05:00   0:00 [xenbus]
root         101  0.0  0.0      0     0 ?        S    05:00   0:00 [xenwatch]
root         132  0.0  0.0      0     0 ?        I    05:00   0:00 [kworker/u60:3-flush-202:0]
root         150  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-nvme-wq]
root         153  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-nvme-reset-wq]
root         155  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-nvme-delete-wq]
root         162  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-mld]
root         184  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-ipv6_addrconf]
root         185  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kstrp]
root         559  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/u61:0]
root        1307  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-buf/xvda1]
root        1308  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-conv/xvda1]
root        1309  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-reclaim/xvda1]
root        1310  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-blockgc/xvda1]
root        1311  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-inodegc/xvda1]
root        1312  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-log/xvda1]
root        1313  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-cil/xvda1]
root        1314  0.0  0.0      0     0 ?        S    05:00   0:00 [xfsaild/xvda1]
root        1364  0.0  1.5  54264 15404 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-journald
root        2057  0.0  1.2  33012 11940 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-udevd
root        2058  0.0  0.0      0     0 ?        I    05:00   0:00 [kworker/u60:4-events_unbound]
systemd+    2063  0.0  1.5  23500 15640 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-resolved
root        2068  0.0  0.2  21928  2684 ?        S<sl 05:00   0:00 /sbin/auditd
root        2077  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-rpciod]
root        2078  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xprtiod]
root        2199  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-ata_sff]
root        2206  0.0  0.0      0     0 ?        S    05:00   0:00 [scsi_eh_0]
root        2215  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-scsi_tmf_0]
root        2216  0.0  0.0      0     0 ?        S    05:00   0:00 [scsi_eh_1]
root        2220  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-scsi_tmf_1]
root        2250  0.0  0.7  17084  7292 ?        Ss   05:00   0:00 /usr/bin/systemd-inhibit --what=handle-suspend-key:handle-hibernate-key --who=ec2-hibinit
libstor+    2253  0.0  0.2   2788  1996 ?        Ss   05:00   0:00 /usr/bin/lsmd -d
root        2256  0.0  0.8  17568  8296 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-homed
root        2257  0.0  1.0  19436 10752 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-logind
dbus        2258  0.0  0.4   8500  4100 ?        Ss   05:00   0:00 /usr/bin/dbus-broker-launch --scope system --audit
systemd+    2259  0.0  1.0 237660 10244 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-networkd
dbus        2281  0.0  0.3   5660  3304 ?        S    05:00   0:00 dbus-broker --log 4 --controller 9 --machine-id ec20177ba55c9080d6fa224c1b00d9c7 --max-by
root        2283  0.0  0.1   2700  1836 ?        S    05:00   0:00 /usr/sbin/acpid -f
root        2286  0.0  0.3 282724  3892 ?        Ssl  05:00   0:00 /usr/sbin/gssproxy -D
root        2431  0.0  2.0 1242036 19692 ?       Ssl  05:00   0:00 /usr/bin/amazon-ssm-agent
root        2435  0.0  0.9  15264  9244 ?        Ss   05:00   0:00 sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
root        2438  0.0  0.2   4792  2616 ?        Ss   05:00   0:00 /usr/sbin/atd -f
root        2439  0.0  0.1 221376  1908 tty1     Ss+  05:00   0:00 /sbin/agetty -o -p -- \u --noclear - linux
root        2440  0.0  0.1 221420  1960 ttyS0    Ss+  05:00   0:00 /sbin/agetty -o -p -- \u --keep-baud 115200,57600,38400,9600 - vt220
chrony      2464  0.0  0.3  87156  3900 ?        S    05:00   0:00 /usr/sbin/chronyd -F 2
root        2631  0.0  1.1  16876 11080 ?        Ss   05:04   0:00 sshd: ec2-user [priv]
root        2634  0.0  0.7  17084  7216 ?        Ss   05:04   0:00 /usr/lib/systemd/systemd-userdbd
ec2-user    2639  0.0  1.4  22696 14140 ?        Ss   05:04   0:00 /usr/lib/systemd/systemd --user
ec2-user    2641  0.0  0.8 108888  8688 ?        S    05:04   0:00 (sd-pam)
ec2-user    2648  0.0  0.7  16876  6992 ?        S    05:04   0:00 sshd: ec2-user@pts/0
ec2-user    2649  0.0  0.5 224096  4996 pts/0    Ss   05:04   0:00 -bash
root        2856  0.0  0.8 235456  8428 pts/0    S+   05:08   0:00 sudo su root
root        2858  0.0  0.2 235456  2644 pts/1    Ss   05:08   0:00 sudo su root
root        2859  0.0  0.4 225368  4692 pts/1    S    05:08   0:00 su root
root        2860  0.0  0.5 224260  5160 pts/1    S    05:08   0:00 bash
root        3130  0.0  0.0      0     0 ?        I    05:18   0:00 [kworker/0:0-cgroup_free]
root       27979  0.0  0.0      0     0 ?        I    05:35   0:00 [kworker/0:2-mm_percpu_wq]
root       28955  0.0  0.7  17444  7216 ?        S    05:50   0:00 systemd-userwork: waiting...
root       28956  0.0  0.7  17444  7304 ?        S    05:50   0:00 systemd-userwork: waiting...
root       28957  0.0  0.7  17444  7260 ?        S    05:50   0:00 systemd-userwork: waiting...
root       29131  0.0  0.0      0     0 ?        I    05:53   0:00 [kworker/0:1]
root       29139  2.0  1.1  19180 11612 ?        Ss   05:54   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29140  0.0  0.4  18836  4768 ?        S    05:54   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29141  0.0  0.9 1250704 9064 ?        Sl   05:54   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29159  0.0  0.8 1086800 7936 ?        Sl   05:54   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29160  0.0  0.8 1086800 7940 ?        Sl   05:54   0:00 /usr/sbin/httpd -DFOREGROUND
root       29319  0.0  0.2 223608  2932 pts/1    R+   05:54   0:00 ps -aux
[root@ip-172-31-7-65 conf]# ps -aux | grep httpd
root       29139  0.0  1.1  19180 11612 ?        Ss   05:54   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29140  0.0  0.4  18836  4768 ?        S    05:54   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29141  0.0  0.9 1250704 9304 ?        Sl   05:54   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29159  0.0  0.9 1086800 9008 ?        Sl   05:54   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29160  0.0  0.8 1086800 7940 ?        Sl   05:54   0:00 /usr/sbin/httpd -DFOREGROUND
root       29378  0.0  0.2 222344  2180 pts/1    S+   05:54   0:00 grep --color=auto httpd
[root@ip-172-31-7-65 conf]# systemctl restart httpd
[root@ip-172-31-7-65 conf]# ps -aux | grep httpd
root       29629  1.0  1.1  19180 11628 ?        Ss   05:57   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29630  0.0  0.4  18836  4756 ?        S    05:57   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29631  0.0  0.9 1250704 9316 ?        Sl   05:57   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29650  0.0  0.8 1086800 8052 ?        Sl   05:57   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29651  0.0  0.8 1086800 8052 ?        Sl   05:57   0:00 /usr/sbin/httpd -DFOREGROUND
root       29810  0.0  0.2 222344  2180 pts/1    S+   05:57   0:00 grep --color=auto httpd
[root@ip-172-31-7-65 conf]# netstat -tnlp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      2435/sshd: /usr/sbi
tcp6       0      0 :::82                   :::*                    LISTEN      29629/httpd
tcp6       0      0 :::22                   :::*                    LISTEN      2435/sshd: /usr/sbi
[root@ip-172-31-7-65 conf]# systemctl restart httpd
[root@ip-172-31-7-65 conf]# ps -aux | grep httpd
root       29874  0.6  1.1  19180 11592 ?        Ss   05:59   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29875  0.0  0.4  18836  4784 ?        S    05:59   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29876  0.0  0.9 1250704 9100 ?        Sl   05:59   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29894  0.0  0.8 1086800 7996 ?        Sl   05:59   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29895  0.0  0.8 1086800 7996 ?        Sl   05:59   0:00 /usr/sbin/httpd -DFOREGROUND
root       30055  0.0  0.2 222344  2180 pts/1    S+   05:59   0:00 grep --color=auto httpd
[root@ip-172-31-7-65 conf]# netstat -tnlp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      2435/sshd: /usr/sbi
tcp6       0      0 :::82                   :::*                    LISTEN      29874/httpd
tcp6       0      0 :::22                   :::*                    LISTEN      2435/sshd: /usr/sbi
[root@ip-172-31-7-65 conf]# history
    1  whoami
    2  ls
    3  pwd
    4  free -m
    5  free -m -h
    6  df -hT
    7  fdisk -l
    8  top
    9  yum install httpd
   10  yum install httpd
   11  cd /var/www/html
   12  ls
   13  pwd
   14  vi index.html
   15  ls
   16  vi index.html
   17  cat index.html
   18  ls
   19  systemctl status httpd
   20  systemctl start httpd
   21  systemctl status httpd
   22  vi index.html
   23  cd /
   24  ls
   25  cd /var
   26  ls
   27  cd log
   28  ls
   29  cd httpd/
   30  ls
   31  pwd
   32  ls
   33  cat access_log
   34  cat access_log
   35  cd /
   36  ls
   37  cd etc/
   38  ls
   39  cd httpd/
   40  ls
   41  cd conf.d/
   42  pwd
   43  ls
   44  ls
   45  pwd
   46  cd ..
   47  ls
   48  cd conf
   49  ls
   50  pwd
   51  vi httpd.conf
   52  vi httpd.conf
   53  systemctl restart httpd
   54  ps -aux
   55  systemctl stop httpd
   56  ps -aux
   57  systemctl start httpd
   58  ps -aux
   59  ps -aux | grep httpd
   60  systemctl restart httpd
   61  ps -aux | grep httpd
   62  netstat -tnlp
   63  systemctl restart httpd
   64  ps -aux | grep httpd
   65  netstat -tnlp
   66  history
[root@ip-172-31-7-65 conf]# ps -aus | grep sshd
error: user name does not exist

Usage:
 ps [options]

 Try 'ps --help <simple|list|output|threads|misc|all>'
  or 'ps --help <s|l|o|t|m|a>'
 for additional help text.

For more details see ps(1).
[root@ip-172-31-7-65 conf]# ps -aux | grep sshd
root        2435  0.0  0.9  15264  9244 ?        Ss   05:00   0:00 sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
root        2631  0.0  1.1  16876 11080 ?        Ss   05:04   0:00 sshd: ec2-user [priv]
ec2-user    2648  0.0  0.7  16876  6992 ?        S    05:04   0:00 sshd: ec2-user@pts/0
root       30347  0.0  0.2 222344  2324 pts/1    S+   06:03   0:00 grep --color=auto sshd
[root@ip-172-31-7-65 conf]# ps -aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  1.8 173512 17936 ?        Ss   05:00   0:01 /usr/lib/systemd/systemd --switched-root --system --deserialize=32
root           2  0.0  0.0      0     0 ?        S    05:00   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        S    05:00   0:00 [pool_workqueue_release]
root           4  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-rcu_gp]
root           5  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-sync_wq]
root           6  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kvfree_rcu_reclaim]
root           7  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-slub_flushwq]
root           8  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-netns]
root          10  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/0:0H-events_highpri]
root          13  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-mm_percpu_wq]
root          14  0.0  0.0      0     0 ?        S    05:00   0:00 [ksoftirqd/0]
root          15  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_preempt]
root          16  0.0  0.0      0     0 ?        S    05:00   0:00 [rcu_exp_par_gp_kthread_worker/0]
root          17  0.0  0.0      0     0 ?        S    05:00   0:00 [rcu_exp_gp_kthread_worker]
root          18  0.0  0.0      0     0 ?        S    05:00   0:00 [migration/0]
root          19  0.0  0.0      0     0 ?        S    05:00   0:00 [cpuhp/0]
root          21  0.0  0.0      0     0 ?        S    05:00   0:00 [kdevtmpfs]
root          22  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-inet_frag_wq]
root          23  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_tasks_kthread]
root          24  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_tasks_rude_kthread]
root          25  0.0  0.0      0     0 ?        I    05:00   0:00 [rcu_tasks_trace_kthread]
root          26  0.0  0.0      0     0 ?        S    05:00   0:00 [kauditd]
root          28  0.0  0.0      0     0 ?        S    05:00   0:00 [khungtaskd]
root          29  0.0  0.0      0     0 ?        S    05:00   0:00 [oom_reaper]
root          30  0.0  0.0      0     0 ?        I    05:00   0:00 [kworker/u60:1-events_unbound]
root          31  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-writeback]
root          32  0.0  0.0      0     0 ?        S    05:00   0:00 [kcompactd0]
root          33  0.0  0.0      0     0 ?        SN   05:00   0:00 [khugepaged]
root          34  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kblockd]
root          35  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-blkcg_punt_bio]
root          36  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kintegrityd]
root          37  0.0  0.0      0     0 ?        S    05:00   0:00 [irq/9-acpi]
root          38  0.0  0.0      0     0 ?        S    05:00   0:00 [xen-balloon]
root          39  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-tpm_dev_wq]
root          40  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-md_bitmap]
root          41  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-edac-poller]
root          42  0.0  0.0      0     0 ?        S    05:00   0:00 [watchdogd]
root          43  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-quota_events_unbound]
root          45  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/0:1H-kblockd]
root          52  0.0  0.0      0     0 ?        S    05:00   0:00 [kswapd0]
root          82  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfsalloc]
root          84  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs_mru_cache]
root          85  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-cryptd]
root          86  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kthrotld]
root          98  0.0  0.0      0     0 ?        S    05:00   0:00 [xenbus]
root         101  0.0  0.0      0     0 ?        S    05:00   0:00 [xenwatch]
root         132  0.0  0.0      0     0 ?        R    05:00   0:00 [kworker/u60:3-events_unbound]
root         150  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-nvme-wq]
root         153  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-nvme-reset-wq]
root         155  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-nvme-delete-wq]
root         162  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-mld]
root         184  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-ipv6_addrconf]
root         185  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-kstrp]
root         559  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/u61:0]
root        1307  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-buf/xvda1]
root        1308  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-conv/xvda1]
root        1309  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-reclaim/xvda1]
root        1310  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-blockgc/xvda1]
root        1311  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-inodegc/xvda1]
root        1312  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-log/xvda1]
root        1313  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xfs-cil/xvda1]
root        1314  0.0  0.0      0     0 ?        S    05:00   0:00 [xfsaild/xvda1]
root        1364  0.0  1.5  54264 15532 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-journald
root        2057  0.0  1.2  33012 11940 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-udevd
root        2058  0.0  0.0      0     0 ?        I    05:00   0:00 [kworker/u60:4-events_unbound]
systemd+    2063  0.0  1.5  23500 15640 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-resolved
root        2068  0.0  0.2  21928  2684 ?        S<sl 05:00   0:00 /sbin/auditd
root        2077  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-rpciod]
root        2078  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-xprtiod]
root        2199  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-ata_sff]
root        2206  0.0  0.0      0     0 ?        S    05:00   0:00 [scsi_eh_0]
root        2215  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-scsi_tmf_0]
root        2216  0.0  0.0      0     0 ?        S    05:00   0:00 [scsi_eh_1]
root        2220  0.0  0.0      0     0 ?        I<   05:00   0:00 [kworker/R-scsi_tmf_1]
root        2250  0.0  0.7  17084  7292 ?        Ss   05:00   0:00 /usr/bin/systemd-inhibit --what=handle-suspend-key:handle-hibernate-key --who=ec2-hibinit
libstor+    2253  0.0  0.2   2788  1996 ?        Ss   05:00   0:00 /usr/bin/lsmd -d
root        2256  0.0  0.8  17568  8296 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-homed
root        2257  0.0  1.0  19436 10752 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-logind
dbus        2258  0.0  0.4   8500  4100 ?        Ss   05:00   0:00 /usr/bin/dbus-broker-launch --scope system --audit
systemd+    2259  0.0  1.0 237660 10244 ?        Ss   05:00   0:00 /usr/lib/systemd/systemd-networkd
dbus        2281  0.0  0.3   5660  3304 ?        S    05:00   0:00 dbus-broker --log 4 --controller 9 --machine-id ec20177ba55c9080d6fa224c1b00d9c7 --max-by
root        2283  0.0  0.1   2700  1836 ?        S    05:00   0:00 /usr/sbin/acpid -f
root        2286  0.0  0.3 282724  3892 ?        Ssl  05:00   0:00 /usr/sbin/gssproxy -D
root        2431  0.0  2.0 1242036 19692 ?       Ssl  05:00   0:00 /usr/bin/amazon-ssm-agent
root        2435  0.0  0.9  15264  9244 ?        Ss   05:00   0:00 sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
root        2438  0.0  0.2   4792  2616 ?        Ss   05:00   0:00 /usr/sbin/atd -f
root        2439  0.0  0.1 221376  1908 tty1     Ss+  05:00   0:00 /sbin/agetty -o -p -- \u --noclear - linux
root        2440  0.0  0.1 221420  1960 ttyS0    Ss+  05:00   0:00 /sbin/agetty -o -p -- \u --keep-baud 115200,57600,38400,9600 - vt220
chrony      2464  0.0  0.3  87156  3900 ?        S    05:00   0:00 /usr/sbin/chronyd -F 2
root        2631  0.0  1.1  16876 11080 ?        Ss   05:04   0:00 sshd: ec2-user [priv]
root        2634  0.0  0.7  17084  7216 ?        Ss   05:04   0:00 /usr/lib/systemd/systemd-userdbd
ec2-user    2639  0.0  1.4  22696 14140 ?        Ss   05:04   0:00 /usr/lib/systemd/systemd --user
ec2-user    2641  0.0  0.8 108888  8688 ?        S    05:04   0:00 (sd-pam)
ec2-user    2648  0.0  0.7  16876  6992 ?        S    05:04   0:00 sshd: ec2-user@pts/0
ec2-user    2649  0.0  0.5 224096  4996 pts/0    Ss   05:04   0:00 -bash
root        2856  0.0  0.8 235456  8428 pts/0    R+   05:08   0:00 sudo su root
root        2858  0.0  0.2 235456  2644 pts/1    Ss   05:08   0:00 sudo su root
root        2859  0.0  0.4 225368  4692 pts/1    S    05:08   0:00 su root
root        2860  0.0  0.5 224260  5160 pts/1    S    05:08   0:00 bash
root        3130  0.0  0.0      0     0 ?        I    05:18   0:00 [kworker/0:0-events]
root       27979  0.0  0.0      0     0 ?        I    05:35   0:00 [kworker/0:2-events]
root       29874  0.0  1.1  19180 11592 ?        Ss   05:59   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29875  0.0  0.4  18836  4784 ?        S    05:59   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29876  0.0  1.0 1250704 9960 ?        Sl   05:59   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29894  0.0  0.9 1086932 9708 ?        Sl   05:59   0:00 /usr/sbin/httpd -DFOREGROUND
apache     29895  0.0  0.9 1086800 9672 ?        Sl   05:59   0:00 /usr/sbin/httpd -DFOREGROUND
root       30115  0.0  0.7  17444  7216 ?        S    06:00   0:00 systemd-userwork: waiting...
root       30116  0.0  0.7  17444  7260 ?        S    06:00   0:00 systemd-userwork: waiting...
root       30117  0.0  0.7  17444  7308 ?        S    06:00   0:00 systemd-userwork: waiting...
apache     30290  0.0  0.9 1086800 9024 ?        Sl   06:03   0:00 /usr/sbin/httpd -DFOREGROUND
root       30348  0.0  0.2 223608  2924 pts/1    R+   06:04   0:00 ps -aux
[root@ip-172-31-7-65 conf]# netstat -tnlp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      2435/sshd: /usr/sbi
tcp6       0      0 :::82                   :::*                    LISTEN      29874/httpd
tcp6       0      0 :::22                   :::*                    LISTEN      2435/sshd: /usr/sbi
[root@ip-172-31-7-65 conf]# cd /var/www/html/
[root@ip-172-31-7-65 html]# ls
index.html
[root@ip-172-31-7-65 html]# cat index.html
<h1> Hi GFG 48 updated content </h1>
<p> how r u </p>
[root@ip-172-31-7-65 html]# curl http://3.110.188.224:82/
<h1> Hi GFG 48 updated content </h1>
<p> how r u </p>
[root@ip-172-31-7-65 html]#
[root@ip-172-31-7-65 html]#
[root@ip-172-31-7-65 html]#
[root@ip-172-31-7-65 html]# mv index.html gfg.html
[root@ip-172-31-7-65 html]# ls
gfg.html
[root@ip-172-31-7-65 html]#
[root@ip-172-31-7-65 html]#
[root@ip-172-31-7-65 html]#
[root@ip-172-31-7-65 html]# ls
gfg.html
[root@ip-172-31-7-65 html]# vi a.py
 [New] 1L, 12B written
[root@ip-172-31-7-65 html]# python3 a.py
hi
[root@ip-172-31-7-65 html]#