#!/bin/bash
# create all tables into data base
output=$(export PGPASSWORD='rpc1902';psql -U postgres -d tpch-cloud  -f tables.sql)


echo $output