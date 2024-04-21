#!/bin/bash

output=$(export PGPASSWORD='';psql -U postgres -d tpch-25  -f DropColumn.sql)


echo $output
