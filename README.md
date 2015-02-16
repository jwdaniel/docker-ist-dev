# Docker-ist-dev

Dockerized ist-dev, built on top of [official Ubuntu](https://registry.hub.docker.com/_/ubuntu/) images.

## Installed Packages

Base:
  * [Minimal core of Ubuntu - trusty (14.04LTS)](http://packages.ubuntu.com/trusty/ubuntu-minimal)

Packages:
  * [openssh-server](https://help.ubuntu.com/community/SSH/OpenSSH/Configuring)
  * [subversion](http://packages.ubuntu.com/trusty/subversion)
  * [screen](http://packages.ubuntu.com/trusty/screen)
  * [apache2](http://packages.ubuntu.com/trusty/apache2)
  * [php5](http://packages.ubuntu.com/trusty/php5)
  * php5 extensions: gettext memcache mailparse mysql mongo

## Configurations

Volume /data:

## Run example

```bash
$ sudo docker run --name ist -d -P -v data:/data jwdaniel/ist-dev
$ sudo docker port ist 22
  0.0.0.0:49154

$ ssh root@localhost -p 49154
# The password is `root`
root@ist $
```

