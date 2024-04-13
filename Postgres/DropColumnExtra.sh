#!/bin/bash

output=$(export PGPASSWORD='rpcs190202';psql -U postgres -d tpch-40  -f DropColumn.sql)


echo $output
