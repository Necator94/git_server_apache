## README

#Docker build of git https server based on apache.

This is test building of git server. Apache configured by adding of my_host.conf config file to directory /etc/apache2/sites-enabled. This config file has configurations (paths to ssl sertificats, password file and git repositories which are located in shared with container host directory) only for my case.

For using this container as a git server over https several configurations should be done:

The folder ***git*** contains two directories: *config* and *repos*. It can be cloned by runnung: https://github.com/Necator94/git_server_apache.git

*Config* folder includes directories with ssl sertificats and password file. Ssl sertificats and password file should be modified for your private access.
As example your ssl certificates can be created like : 
```
openssl req -x509 -nodes -days 999 -newkey rsa:2048 -keyout mygit_ssl.key -out mygit_ssl.crt
```
Creation of password file: htpasswd -c gitusers.passwd user1
*Repos* directory - your git repositories that will be used by apache. 
*172.17.42.1.conf* - example of configuration file for apache.

This container can be executed by: 
```
docker run -d -p 443:443 -v /path_to_git_directory/git/:/mount necator94/git_serverapache
```
If you want to use your our configuration file for apache, container should be executed by:
```
docker run -d -p 443:443 -v /path_to_git_directory/git/:/mount -v /path_to_config/some.conf:/etc/apache2/sites-enabled/some.conf necator94/git_serverapache
```
