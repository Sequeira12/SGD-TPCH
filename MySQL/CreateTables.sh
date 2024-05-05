#!/bin/bash
# create all tables into data base
output=$(mysql -u root -h localhost -P 3306  -e "USE tpchSGD; source tables.sql;")


echo $output