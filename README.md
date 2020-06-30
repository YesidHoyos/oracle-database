# Oracle-database
Installation guide Oracle Database

## Pre-requisites
* [Proceed to checkout and get content to Oracle Database Image](https://hub.docker.com/_/oracle-database-enterprise-edition)
* Docker version: 19.03.8
* Network created with Docker: ```docker network create --subnet 172.168.0.1/24 --gateway 172.168.0.2 -d bridge yhoyos-network```

## Setup
To install Oracle Database, execute it using docker: 

```
$ docker login
$ docker run -d -p 8080:8080 -p 1521:1521 --name hiberusDB --network yhoyos-network --ip 172.168.0.20 store/oracle/database-enterprise:12.2.0.1-slim
```
You must wait for the container to go up, that is known by running `docker ps` and observing that the state of the container is in `healthy`
```
$ winpty docker exec -it hiberusDB bash -c "source /home/oracle/.bashrc; sqlplus /nolog"
SQL> connect sys as sysdba;
```
password:`Oradoc_db1`
```
SQL> alter session set "_ORACLE_SCRIPT"=true;
SQL> create tablespace hiberus_data datafile 'datafile1.dbf' size 10M;
SQL> create user yhoyos identified by yhoyos123 temporary tablespace TEMP;
SQL> grant connect to yhoyos;
SQL> alter user yhoyos default tablespace hiberus_data;
SQL> alter user yhoyos quota unlimited on hiberus_data;
SQL> grant create table to yhoyos;
SQL> grant create sequence to yhoyos;
SQL> exit;
```
Connect from any oracle client (Oracle sql developer), with the following data
- user:`yhoyos`
- password:`yhoyos123`
- host:`localhost`
- port:`1521`
- service_name:`ORCLCDB.localdomain`

Once connected run the [tables_creation](tables_creation.sql) script, which will create the table model
