-- Comprobar bases
show schemas;

create database if not exists evidence_db;
use evidence_db;

drop table if exists tablita_prueba;
create table if not exists tablita_prueba (
  id   int,
  name string
);

describe tablita_prueba;
show tables;

drop table if exists tablita_prueba;
use default;
drop database if exists evidence_db;