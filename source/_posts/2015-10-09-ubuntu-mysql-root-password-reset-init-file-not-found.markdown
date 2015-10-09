---
layout: post
title: "Ubuntu Mysql Root password reset (init file not found)"
date: 2015-10-09 17:13:21 +0100
comments: true
categories: 
 - mysql
---

If you don't use the mysql root account very often and change passwords reasonably frequently you may (like me) find that you no longer know the mysql root password on a dev box.

The mysql site has a reasonable guide here https://dev.mysql.com/doc/refman/5.0/en/resetting-permissions.html#resetting-permissions-unix

But there always seems to be something additional, this time for me it was apparmor preventing mysql from reading my reset file

to reset I had to
 look in /etc/apparmor.d/usr.sbin.mysqld and identify /etc/mysql/conf.d/ as a good place to place a reset init file

```bash
sudo su
service stop mysql
echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('MyNewPass');" > /etc/mysql/conf.d/mysql-init
mysqld_safe --init-file=/etc/mysql/conf.d/mysql-init &
# check password works
# stop mysql 
service start mysql
rm /etc/mysql/conf.d/mysql-init
```

