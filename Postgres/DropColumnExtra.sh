#!/bin/bash

output=$(export PGPASSWORD='rpcs190202';psql -U postgres -d tpch-sgd  -f DropColumn.sql)


echo $output
