#!/bin/bash

output=$(mysql -u root -h localhost -P 3306  -e "USE testdb; source DropColumn.sql;")


echo $output
