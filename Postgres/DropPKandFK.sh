#!/bin/bash

output=$(export PGPASSWORD='';psql -U postgres -d tpch-25  -f DropPKFK.sql)


echo $output