#!/bin/bash
# create all tables into data base
output=$(export PGPASSWORD='';psql -U postgres -d tpch-25  -f tables.sql)


echo $output