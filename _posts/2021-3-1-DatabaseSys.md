---
layout: post
title: Database System
tags: Database
stickie: false
---

参考书籍：《数据库系统概念》6th

# Part 0 Intro

文件处理系统的局限

数据抽象：物理层（描述数据如何存储） -> 逻辑层（描述存储什么数据以及数据间关系） -> 视图层

物理数据独立性：应用程序不受物理模式的改变影响

# Part 1 Relational DB

关系理论第一范式:每个属性不可再分

## Keys 码

超码superkey: 唯一标识一个元组

候选码candidate key: 任意真子集都不是超码集合的超码集合

主码primary key

外码foreign key

# Part 3 SQL

## Data-Definition Language (DDL)

Domain Types: char(n) varchar(n) int smallint numeric(p,d) float(n) Null

create table r(A1 D1, A2 D2……);

drop table r; // delete the table and its contents;

delete from r; // delete contents but retains table;

alter table r add A D;

alter table r drop A;

create index <i-name> on <table-name> (<attribute-list>);
  
create unique index <i-name> on <table-name> (<attribute-list>);
  
drop index <i-name>;
  
## Intermediate SQL
  
### 连接条件

join...using

join...on
