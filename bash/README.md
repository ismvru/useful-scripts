# Bash useful scripts

- [Bash useful scripts](#bash-useful-scripts)
  - [docker-parallel-runner](#docker-parallel-runner)

## [docker-parallel-runner](docker-parallel-runner/parallel-run.sh)

Script for parallel execution of the same tasks inside different Docker containers

Usage:

```bash
export DOCKER_KEYS="--rm -v $PWD:/code"
export DOCKER_EXEC='ls -la'
./parallel-run.sh image1:tag1 image2:tag2 image3:tag3
```

Where:

- `DOCKER_KEYS` - Keys for `docker run` command. Default - `--rm`
- `DOCKER_EXEC` - Command to execute in docker. Default - `uname -a`

Example:

```bash
$ DOCKER_KEYS="--rm -v $PWD:/code -w /code" DOCKER_EXEC="./testscript.sh" ./parallel-run.sh centos:latest ubuntu:latest

Spawning containers!
Waiting for completion...
centos:latest exitcode: 0

### STDOUT ###
CentOS Linux release 8.4.2105
NAME="CentOS Linux"
VERSION="8"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="8"
PLATFORM_ID="platform:el8"
PRETTY_NAME="CentOS Linux 8"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:8"
HOME_URL="https://centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"
CENTOS_MANTISBT_PROJECT="CentOS-8"
CENTOS_MANTISBT_PROJECT_VERSION="8"
CentOS Linux release 8.4.2105
CentOS Linux release 8.4.2105
Linux a0999e732806 5.15.53-1-MANJARO #1 SMP PREEMPT Thu Jul 7 16:56:55 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
total 28K
drwxr-xr-x 2 1000 1000 4.0K Jul 13 07:29 .
drwxr-xr-x 1 root root 4.0K Jul 13 07:29 ..
-rw-r--r-- 1 1000 1000    2 Jul 13 07:29 centos:latest-exitcode.log
-rw-r--r-- 1 1000 1000    0 Jul 13 07:29 centos:latest-stderr.log
-rw-r--r-- 1 1000 1000  534 Jul 13 07:29 centos:latest-stdout.log
-rwxr-xr-x 1 1000 1000  555 Jul 13 07:17 parallel-run.sh
-rwxr-xr-x 1 1000 1000   47 Jul 13 07:27 testscript.sh
-rw-r--r-- 1 1000 1000    2 Jul 13 07:29 ubuntu:latest-exitcode.log
-rw-r--r-- 1 1000 1000    0 Jul 13 07:29 ubuntu:latest-stderr.log
-rw-r--r-- 1 1000 1000    0 Jul 13 07:29 ubuntu:latest-stdout.log

### STDERR ###


ubuntu:latest exitcode: 0

### STDOUT ###
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04 LTS"
PRETTY_NAME="Ubuntu 22.04 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
Linux fb8372e1eb46 5.15.53-1-MANJARO #1 SMP PREEMPT Thu Jul 7 16:56:55 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
total 32K
drwxr-xr-x 2 1000 1000 4.0K Jul 13 07:29 .
drwxr-xr-x 1 root root 4.0K Jul 13 07:29 ..
-rw-r--r-- 1 1000 1000    2 Jul 13 07:29 centos:latest-exitcode.log
-rw-r--r-- 1 1000 1000    0 Jul 13 07:29 centos:latest-stderr.log
-rw-r--r-- 1 1000 1000 1.2K Jul 13 07:29 centos:latest-stdout.log
-rwxr-xr-x 1 1000 1000  555 Jul 13 07:17 parallel-run.sh
-rwxr-xr-x 1 1000 1000   47 Jul 13 07:27 testscript.sh
-rw-r--r-- 1 1000 1000    2 Jul 13 07:29 ubuntu:latest-exitcode.log
-rw-r--r-- 1 1000 1000    0 Jul 13 07:29 ubuntu:latest-stderr.log
-rw-r--r-- 1 1000 1000  595 Jul 13 07:29 ubuntu:latest-stdout.log

### STDERR ###


```
