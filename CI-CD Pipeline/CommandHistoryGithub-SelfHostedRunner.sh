   ,     #_
   ~\_  ####_        Amazon Linux 2023
  ~~  \_#####\
  ~~     \###|
  ~~       \#/ ___   https://aws.amazon.com/linux/amazon-linux-2023
   ~~       V~' '->
    ~~~         /
      ~~._.   _/
         _/ _/
       _/m/'
Last login: Sat Sep 26 04:31:07 2026 from 13.233.177.3
[ec2-user@ip-172-31-13-14 ~]$ sudo su root
[root@ip-172-31-13-14 ec2-user]# cd .
[root@ip-172-31-13-14 ec2-user]# cd /
[root@ip-172-31-13-14 /]# mkdir actions-runner && cd actions-runner
[root@ip-172-31-13-14 actions-runner]# curl -o actions-runner-linux-x64-2.337.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.337.0/actions-runner-linux-x64-2.337.0.tar.gz
  % Total    % Received % Xferd  Average Speed  Time    Time    Time   Current
                                 Dload  Upload  Total   Spent   Left   Speed
  0      0   0      0   0      0      0      0                              0
100 215.9M 100 215.9M   0      0 111.1M      0   00:01   00:01         113.0M
[root@ip-172-31-13-14 actions-runner]# echo "70920811a4f8ad4328818682bca5c6469c1c942fab52448868071d0063816613  actions-runner-linux-x64-2.337.0.tar.gz" | shasum -a 256 -c
bash: shasum: command not found
[root@ip-172-31-13-14 actions-runner]# tar xzf ./actions-runner-linux-x64-2.337.0.tar.gz
[root@ip-172-31-13-14 actions-runner]# ls
actions-runner-linux-x64-2.337.0.tar.gz  bin  config.sh  env.sh  externals  run-helper.cmd.template  run-helper.sh.template  run.sh  safe_sleep.sh
[root@ip-172-31-13-14 actions-runner]# ./config.sh --url https://github.com/sudhanshuvlog/GFG48-Python-FlaskApp --token ANYTRLQKYHY2RI2PIGVXQG3KW5TN6
Must not run with sudo
[root@ip-172-31-13-14 actions-runner]# useradd githubagent
[root@ip-172-31-13-14 actions-runner]# su githubagent
[githubagent@ip-172-31-13-14 actions-runner]$ id
uid=1001(githubagent) gid=1001(githubagent) groups=1001(githubagent) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
[githubagent@ip-172-31-13-14 actions-runner]$ 
[githubagent@ip-172-31-13-14 actions-runner]$ 
[githubagent@ip-172-31-13-14 actions-runner]$ ./config.sh --url https://github.com/sudhanshuvlog/GFG48-Python-FlaskApp --token ANYTRLQKYHY2RI2PIGVXQG3KW5TN6
Libicu's dependencies is missing for Dotnet Core 6.0
Execute sudo ./bin/installdependencies.sh to install any missing Dotnet Core 6.0 dependencies.
[githubagent@ip-172-31-13-14 actions-runner]$ exit
exit
[root@ip-172-31-13-14 actions-runner]# ./bin/installdependencies.sh
--------OS Information--------
NAME="Amazon Linux"
VERSION="2023"
ID="amzn"
ID_LIKE="fedora"
VERSION_ID="2023"
PLATFORM_ID="platform:al2023"
PRETTY_NAME="Amazon Linux 2023.12.20260918"
ANSI_COLOR="0;33"
CPE_NAME="cpe:2.3:o:amazon:amazon_linux:2023"
HOME_URL="https://aws.amazon.com/linux/amazon-linux-2023/"
DOCUMENTATION_URL="https://docs.aws.amazon.com/linux/"
SUPPORT_URL="https://aws.amazon.com/premiumsupport/"
BUG_REPORT_URL="https://github.com/amazonlinux/amazon-linux-2023"
VENDOR_NAME="AWS"
VENDOR_URL="https://aws.amazon.com/"
SUPPORT_END="2029-06-30"
------------------------------
"fedora"
Can't detect current OS type based on /etc/os-release.
Can't install dotnet core dependencies.
You can manually install all required dependencies based on following documentation
https://docs.microsoft.com/en-us/dotnet/core/linux-prerequisites?tabs=netcore2x
[root@ip-172-31-13-14 actions-runner]# yum install  dotnet-sdk-10.0
Last metadata expiration check: 1:06:53 ago on Sat Sep 26 04:32:00 2026.
Dependencies resolved.
=========================================================================================================================================================================
 Package                                              Architecture                 Version                                       Repository                         Size
=========================================================================================================================================================================
Installing:
 dotnet-sdk-10.0                                      x86_64                       10.0.111-1.amzn2023.0.1                       amazonlinux                        96 M
Installing dependencies:
 aspnetcore-runtime-10.0                              x86_64                       10.0.11-1.amzn2023.0.1                        amazonlinux                       8.1 M
 aspnetcore-targeting-pack-10.0                       x86_64                       10.0.11-1.amzn2023.0.1                        amazonlinux                       3.4 M
 dotnet-apphost-pack-10.0                             x86_64                       10.0.11-1.amzn2023.0.1                        amazonlinux                       3.8 M
 dotnet-host                                          x86_64                       10.0.11-1.amzn2023.0.1                        amazonlinux                       220 k
 dotnet-hostfxr-10.0                                  x86_64                       10.0.11-1.amzn2023.0.1                        amazonlinux                       160 k
 dotnet-runtime-10.0                                  x86_64                       10.0.11-1.amzn2023.0.1                        amazonlinux                        25 M
 dotnet-targeting-pack-10.0                           x86_64                       10.0.11-1.amzn2023.0.1                        amazonlinux                       3.1 M
 dotnet-templates-10.0                                x86_64                       10.0.111-1.amzn2023.0.1                       amazonlinux                       2.8 M
 libbrotli                                            x86_64                       1.0.9-4.amzn2023.0.2                          amazonlinux                       315 k
 libicu                                               x86_64                       67.1-7.amzn2023.0.4                           amazonlinux                       9.6 M

Transaction Summary
=========================================================================================================================================================================
Install  11 Packages

Total download size: 153 M
Installed size: 565 M
Is this ok [y/N]: y
Downloading Packages:
(1/11): aspnetcore-targeting-pack-10.0-10.0.11-1.amzn2023.0.1.x86_64.rpm                                                                  27 MB/s | 3.4 MB     00:00    
(2/11): dotnet-host-10.0.11-1.amzn2023.0.1.x86_64.rpm                                                                                    3.3 MB/s | 220 kB     00:00    
(3/11): dotnet-apphost-pack-10.0-10.0.11-1.amzn2023.0.1.x86_64.rpm                                                                        18 MB/s | 3.8 MB     00:00    
(4/11): aspnetcore-runtime-10.0-10.0.11-1.amzn2023.0.1.x86_64.rpm                                                                         29 MB/s | 8.1 MB     00:00    
(5/11): dotnet-hostfxr-10.0-10.0.11-1.amzn2023.0.1.x86_64.rpm                                                                            1.8 MB/s | 160 kB     00:00    
(6/11): dotnet-targeting-pack-10.0-10.0.11-1.amzn2023.0.1.x86_64.rpm                                                                      16 MB/s | 3.1 MB     00:00    
(7/11): dotnet-templates-10.0-10.0.111-1.amzn2023.0.1.x86_64.rpm                                                                          18 MB/s | 2.8 MB     00:00    
(8/11): libbrotli-1.0.9-4.amzn2023.0.2.x86_64.rpm                                                                                        9.2 MB/s | 315 kB     00:00    
(9/11): dotnet-runtime-10.0-10.0.11-1.amzn2023.0.1.x86_64.rpm                                                                             36 MB/s |  25 MB     00:00    
(10/11): libicu-67.1-7.amzn2023.0.4.x86_64.rpm                                                                                            26 MB/s | 9.6 MB     00:00    
(11/11): dotnet-sdk-10.0-10.0.111-1.amzn2023.0.1.x86_64.rpm                                                                               54 MB/s |  96 MB     00:01    
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                     72 MB/s | 153 MB     00:02     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                                 1/1 
  Installing       : dotnet-host-10.0.11-1.amzn2023.0.1.x86_64                                                                                                      1/11 
  Installing       : libbrotli-1.0.9-4.amzn2023.0.2.x86_64                                                                                                          2/11 
  Installing       : dotnet-apphost-pack-10.0-10.0.11-1.amzn2023.0.1.x86_64                                                                                         3/11 
  Installing       : aspnetcore-targeting-pack-10.0-10.0.11-1.amzn2023.0.1.x86_64                                                                                   4/11 
  Installing       : dotnet-hostfxr-10.0-10.0.11-1.amzn2023.0.1.x86_64                                                                                              5/11 
  Installing       : dotnet-targeting-pack-10.0-10.0.11-1.amzn2023.0.1.x86_64                                                                                       6/11 
  Installing       : dotnet-templates-10.0-10.0.111-1.amzn2023.0.1.x86_64                                                                                           7/11 
  Installing       : libicu-67.1-7.amzn2023.0.4.x86_64                                                                                                              8/11 
  Installing       : dotnet-runtime-10.0-10.0.11-1.amzn2023.0.1.x86_64                                                                                              9/11 
  Installing       : aspnetcore-runtime-10.0-10.0.11-1.amzn2023.0.1.x86_64                                                                                         10/11 
  Installing       : dotnet-sdk-10.0-10.0.111-1.amzn2023.0.1.x86_64                                                                                                11/11 
  Running scriptlet: dotnet-sdk-10.0-10.0.111-1.amzn2023.0.1.x86_64                                                                                                11/11 
  Verifying        : aspnetcore-runtime-10.0-10.0.11-1.amzn2023.0.1.x86_64                                                                                          1/11 
  Verifying        : aspnetcore-targeting-pack-10.0-10.0.11-1.amzn2023.0.1.x86_64                                                                                   2/11 
  Verifying        : dotnet-apphost-pack-10.0-10.0.11-1.amzn2023.0.1.x86_64                                                                                         3/11 
  Verifying        : dotnet-host-10.0.11-1.amzn2023.0.1.x86_64                                                                                                      4/11 
  Verifying        : dotnet-hostfxr-10.0-10.0.11-1.amzn2023.0.1.x86_64                                                                                              5/11 
  Verifying        : dotnet-runtime-10.0-10.0.11-1.amzn2023.0.1.x86_64                                                                                              6/11 
  Verifying        : dotnet-sdk-10.0-10.0.111-1.amzn2023.0.1.x86_64                                                                                                 7/11 
  Verifying        : dotnet-targeting-pack-10.0-10.0.11-1.amzn2023.0.1.x86_64                                                                                       8/11 
  Verifying        : dotnet-templates-10.0-10.0.111-1.amzn2023.0.1.x86_64                                                                                           9/11 
  Verifying        : libbrotli-1.0.9-4.amzn2023.0.2.x86_64                                                                                                         10/11 
  Verifying        : libicu-67.1-7.amzn2023.0.4.x86_64                                                                                                             11/11 

Installed:
  aspnetcore-runtime-10.0-10.0.11-1.amzn2023.0.1.x86_64                            aspnetcore-targeting-pack-10.0-10.0.11-1.amzn2023.0.1.x86_64                          
  dotnet-apphost-pack-10.0-10.0.11-1.amzn2023.0.1.x86_64                           dotnet-host-10.0.11-1.amzn2023.0.1.x86_64                                             
  dotnet-hostfxr-10.0-10.0.11-1.amzn2023.0.1.x86_64                                dotnet-runtime-10.0-10.0.11-1.amzn2023.0.1.x86_64                                     
  dotnet-sdk-10.0-10.0.111-1.amzn2023.0.1.x86_64                                   dotnet-targeting-pack-10.0-10.0.11-1.amzn2023.0.1.x86_64                              
  dotnet-templates-10.0-10.0.111-1.amzn2023.0.1.x86_64                             libbrotli-1.0.9-4.amzn2023.0.2.x86_64                                                 
  libicu-67.1-7.amzn2023.0.4.x86_64                                               

Complete!
[root@ip-172-31-13-14 actions-runner]# su githubworker
su: user githubworker does not exist or the user entry does not contain all the required fields
[root@ip-172-31-13-14 actions-runner]# su githubagent
[githubagent@ip-172-31-13-14 actions-runner]$ 
[githubagent@ip-172-31-13-14 actions-runner]$ 
[githubagent@ip-172-31-13-14 actions-runner]$ id
uid=1001(githubagent) gid=1001(githubagent) groups=1001(githubagent) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
[githubagent@ip-172-31-13-14 actions-runner]$ ./config.sh --url https://github.com/sudhanshuvlog/GFG48-Python-FlaskApp --token ANYTRLQKYHY2RI2PIGVXQG3KW5TN6

--------------------------------------------------------------------------------
|        ____ _ _   _   _       _          _        _   _                      |
|       / ___(_) |_| | | |_   _| |__      / \   ___| |_(_) ___  _ __  ___      |
|      | |  _| | __| |_| | | | | '_ \    / _ \ / __| __| |/ _ \| '_ \/ __|     |
|      | |_| | | |_|  _  | |_| | |_) |  / ___ \ (__| |_| | (_) | | | \__ \     |
|       \____|_|\__|_| |_|\__,_|_.__/  /_/   \_\___|\__|_|\___/|_| |_|___/     |
|                                                                              |
|                       Self-hosted runner registration                        |
|                                                                              |
--------------------------------------------------------------------------------

# Authentication


√ Connected to GitHub

# Runner Registration

Enter the name of the runner group to add this runner to: [press Enter for Default] 

Enter the name of runner: [press Enter for ip-172-31-13-14] pythonrunner

This runner will have the following labels: 'self-hosted', 'Linux', 'X64' 
Enter any additional labels (ex. label-1,label-2): [press Enter to skip] python-worker

√ Runner successfully added

# Runner settings

Enter name of work folder: [press Enter for _work] github_worker_data

√ Settings Saved.

[githubagent@ip-172-31-13-14 actions-runner]$ mkdir github_worker_data
[githubagent@ip-172-31-13-14 actions-runner]$ ./run.sh

√ Connected to GitHub

Current runner version: '2.337.0'
2026-09-26 05:41:46Z: Listening for Jobs
2026-09-26 05:44:52Z: Running job: Build and Test (3.11)
2026-09-26 05:45:07Z: Job Build and Test (3.11) completed with result: Failed
2026-09-26 05:50:04Z: Running job: Build and Test
2026-09-26 05:50:30Z: Job Build and Test completed with result: Succeeded
2026-09-26 05:50:34Z: Running job: SonarQube Scanner
2026-09-26 05:50:49Z: Job SonarQube Scanner completed with result: Failed
2026-09-26 05:56:05Z: Running job: SonarQube Scanner
2026-09-26 05:56:21Z: Job SonarQube Scanner completed with result: Failed
^CExiting...
^CExiting...
^CExiting...
Runner listener exit with 0 return code, stop the service, no retry needed.
Exiting runner...
[githubagent@ip-172-31-13-14 actions-runner]$ sudo ./run.sh
Must not run interactively with sudo
Exiting runner...
[githubagent@ip-172-31-13-14 actions-runner]$ ./run.sh

√ Connected to GitHub

Current runner version: '2.337.0'
2026-09-26 05:58:17Z: Listening for Jobs
2026-09-26 06:00:34Z: Running job: SonarQube Scanner
2026-09-26 06:00:51Z: Job SonarQube Scanner completed with result: Failed
2026-09-26 06:01:27Z: Running job: Build and Test
2026-09-26 06:01:44Z: Job Build and Test completed with result: Succeeded
2026-09-26 06:03:21Z: Running job: Docker Build and Push
2026-09-26 06:03:36Z: Job Docker Build and Push completed with result: Failed