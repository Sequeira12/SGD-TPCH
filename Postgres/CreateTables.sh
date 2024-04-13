#!/bin/bash
# create all tables into data base
output=$(export PGPASSWORD='rpcs190202';psql -U postgres -d tpch-40  -f tables.sql)


echo $output