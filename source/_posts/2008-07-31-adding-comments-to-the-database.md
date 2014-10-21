---
layout: post
title: Adding comments to the database
created: 1217513738
categories:
- documentation
- mysql
- sql
---
Comments in code are widely used and generally (but not universally) accepted as a good thing.

Databases can also accommodate comments - but these seem to be very rarely used.

I'm of the opinion that database comments are very useful.

It's often hard to determine the exact meaning of a column - maybe it would be ideal to rename the column but you don't want to risk breaking code.

I've also worked on a few projects where tables retain redundant columns just in case a query somewhere selects this column. Then every now and again a developer (like me) gets tripped up and thinks this column is meaningful.


For a really simple table
<code>
Create Table: CREATE TABLE `phonebook` (
  `number` int(11) NOT NULL COMMENT 'phone number',
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`number`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1
</code>
      

To add a comment to a table
<code>
alter table phonebook comment='an example table'
</code>

To add a comment to a column
repeat the existing column definition and add the comment at the end
<code>
alter table phonebook change column name name varchar(255) default NULL comment 'full name'
</code>

The comments are then displayed when you <code>show create table</code>

It's even easier to put the comments in at the start.

<code>

mysql&gt; create table phonebook (number int(11) primary key comment 'phone number', name varchar(255) comment 'full name') comment 'an example table';
Query OK, 0 rows affected (0.05 sec)

 show create table phonebook\G
*************************** 1. row ***************************
       Table: phonebook
Create Table: CREATE TABLE `phonebook` (
  `number` int(11) NOT NULL COMMENT 'phone number',
  `name` varchar(255) default NULL COMMENT 'full name',
  PRIMARY KEY  (`number`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='an example table'
1 row in set (0.00 sec)

</code>



The above is an example based on MySQL.
