#!/bin/bash


output=$(export PGPASSWORD='rpcs190202';psql -U postgres -d tpch-25 -c "\timing on" -f ImportData.sql -c "\timing off" | grep "^Time: ")

echo "Import Time Customer: " $output >> Results/importTime.txt

output=$(psql -U postgres -d tpch-cloud -c "\timing on" -c "COPY lineitem FROM 'C:\Users\conta\OneDrive\Ambiente de Trabalho\Tcp-h_windows\lineitem.tbl' WITH DELIMITER AS '|'; " -c "\timing off" | grep "^Time: ")

echo "Import Time lineitem: " $output  >> Results/importTime.txt

output=$(psql -U postgres -d tpch-cloud -c "\timing on" -c "COPY nation FROM 'C:sers\conta\OneDrive\Ambiente de Trabalho\Tcp-h_windows\nation.tbl' WITH DELIMITER AS '|'; " -c "\timing off" | grep "^Time: ")

echo "Import Time nation: " $output >> Results/importTime.txt

output=$(psql -U postgres -d tpch-cloud -c "\timing on" -c "COPY orders FROM 'C:sers\conta\OneDrive\Ambiente de Trabalho\Tcp-h_windows\orders.tbl' WITH DELIMITER AS '|'; " -c "\timing off" | grep "^Time: ")

echo "Import Time orders: " $output >> Results/importTime.txt

output=$(psql -U postgres -d tpch-cloud -c "\timing on" -c "COPY part FROM 'C:sers\conta\OneDrive\Ambiente de Trabalho\Tcp-h_windows\part.tbl' WITH DELIMITER AS '|'; " -c "\timing off" | grep "^Time: ")

echo "Import Time part: " $output >> Results/importTime.txt

output=$(psql -U postgres -d tpch-cloud -c "\timing on" -c "COPY partsupp FROM 'C:sers\conta\OneDrive\Ambiente de Trabalho\Tcp-h_windows\partsupp.tbl' WITH DELIMITER AS '|'; " -c "\timing off" | grep "^Time: ")

echo "Import Time partsupp: " $output >> Results/importTime.txt

output=$(psql -U postgres -d tpch-cloud -c "\timing on" -c "COPY region FROM 'C:sers\conta\OneDrive\Ambiente de Trabalho\Tcp-h_windows\region.tbl' WITH DELIMITER AS '|'; " -c "\timing off" | grep "^Time: ")

echo "Import Time region: " $output >> Results/importTime.txt

output=$(psql -U postgres -d tpch-cloud -c "\timing on" -c "COPY supplier FROM 'C:sers\conta\OneDrive\Ambiente de Trabalho\Tcp-h_windows\supplier.tbl' WITH DELIMITER AS '|'; " -c "\timing off" | grep "^Time: ")

echo "Import Time supplier: " $output >> Results/importTime.txt
