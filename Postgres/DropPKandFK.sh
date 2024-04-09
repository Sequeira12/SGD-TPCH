#!/bin/bash

output=$(export PGPASSWORD='rpc1902';psql -U postgres -d tpch-cloud  -f DropPKFK.sql)


echo $output