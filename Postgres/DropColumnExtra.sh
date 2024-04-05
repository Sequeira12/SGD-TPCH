#!/bin/bash

output=$(psql -U postgres -d tpch-cloud  -f DropColumn.sql)


echo $output
