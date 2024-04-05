#!/bin/bash
# create all tables into data base
output=$(mysql -u root -h localhost -P 3306 -p -e "USE testdb; source tables.sql;")


echo $output