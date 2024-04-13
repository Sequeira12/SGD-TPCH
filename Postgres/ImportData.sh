#!/bin/bash


<<<<<<< HEAD
output=$(export PGPASSWORD='rpcs190202';psql -U postgres -d tpch-40 -c "\timing on" -f ImportData.sql -c "\timing off" | grep "^Time: ")
=======
output=$(psql -U postgres -d tpch-cloud -c "\timing on" -c "COPY customer FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/customer.tbl' WITH DELIMITER AS '|'; " -c "\timing off" | grep "^Time: ")
>>>>>>> 673ad258bfaea43a0097ca0c7c574e4ecb126395

echo "Import Time Customer: " $output >> Results/importTime.txt

output=$(psql -U postgres -d tpch-cloud -c "\timing on" -c "COPY lineitem FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/lineitem.tbl' WITH DELIMITER AS '|'; " -c "\timing off" | grep "^Time: ")

echo "Import Time lineitem: " $output  >> Results/importTime.txt

output=$(psql -U postgres -d tpch-cloud -c "\timing on" -c "COPY nation FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/nation.tbl' WITH DELIMITER AS '|'; " -c "\timing off" | grep "^Time: ")

echo "Import Time nation: " $output >> Results/importTime.txt

output=$(psql -U postgres -d tpch-cloud -c "\timing on" -c "COPY orders FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/orders.tbl' WITH DELIMITER AS '|'; " -c "\timing off" | grep "^Time: ")

echo "Import Time orders: " $output >> Results/importTime.txt

output=$(psql -U postgres -d tpch-cloud -c "\timing on" -c "COPY part FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/part.tbl' WITH DELIMITER AS '|'; " -c "\timing off" | grep "^Time: ")

echo "Import Time part: " $output >> Results/importTime.txt

output=$(psql -U postgres -d tpch-cloud -c "\timing on" -c "COPY partsupp FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/partsupp.tbl' WITH DELIMITER AS '|'; " -c "\timing off" | grep "^Time: ")

echo "Import Time partsupp: " $output >> Results/importTime.txt

output=$(psql -U postgres -d tpch-cloud -c "\timing on" -c "COPY region FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/region.tbl' WITH DELIMITER AS '|'; " -c "\timing off" | grep "^Time: ")

echo "Import Time region: " $output >> Results/importTime.txt

output=$(psql -U postgres -d tpch-cloud -c "\timing on" -c "COPY supplier FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/supplier.tbl' WITH DELIMITER AS '|'; " -c "\timing off" | grep "^Time: ")

echo "Import Time supplier: " $output >> Results/importTime.txt
