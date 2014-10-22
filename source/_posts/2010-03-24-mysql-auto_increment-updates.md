---
layout: post
title: MySQL AUTO_INCREMENT updates
created: 1269446847
comments: true
categories:
- mysql
- bug
---
I just found out the painful way that if you manually update a column which is normally calculated automatically as an auto_increment it seems to work at first ..

but MySQL doesn't update the auto_increment value for the table - so subsequent inserts can fail.

The solution seems to be to delete and re-insert the row.

http://bugs.mysql.com/bug.php?id=12434


Test code:
<code>
mysql> create table test (id int(10) unsigned NOT NULL, col1 varchar(255), PRIMARY KEY (id));
Query OK, 0 rows affected (0.00 sec)

mysql> insert into test (col1) VALUES ('test1');
Query OK, 1 row affected, 1 warning (0.00 sec)

mysql> select * from test;
+----+-------+
| id | col1  |
+----+-------+
|  0 | test1 |
+----+-------+
1 row in set (0.00 sec)

mysql> update test set id= 1  where id=0;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> insert into test (col1) VALUES ('test2');
Query OK, 1 row affected, 1 warning (0.00 sec)

mysql> select * from test;
+----+-------+
| id | col1  |
+----+-------+
|  1 | test1 |
|  0 | test2 |
+----+-------+
2 rows in set (0.00 sec)

mysql> insert into test (col1) VALUES ('test3');
ERROR 1062 (23000): Duplicate entry '0' for key 1

</code>
