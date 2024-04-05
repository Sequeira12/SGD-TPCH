#!/bin/bash
# create all tables into data base
output=$(psql -U postgres -d tpch-cloud  -f tables.sql)


echo $output