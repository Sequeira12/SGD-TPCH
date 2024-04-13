#!/bin/bash

output=$(export PGPASSWORD='rpcs190202';psql -U postgres -d tpch-40  -f DropPKFK.sql)


echo $output