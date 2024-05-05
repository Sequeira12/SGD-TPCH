#!/bin/bash

# Executa o script e captura a saída
rm -r Results/ImportTime.txt


output=$(mysql --local-infile=1 -u root -h localhost -P 3306 -e "USE tpchSGD; SET profiling = 1; $(cat LoadTable/customer.sql); SHOW PROFILES;"  | grep -oE '^[^ ]+ [^ ]+ [^ ]+ [^ ]+ [^ ]+' | awk '{print $2}')

echo "Import time table [customer] " $output "  seconds" >> Results/ImportTime.txt


output=$(mysql --local-infile=1 -u root -h localhost -P 3306 -e "USE tpchSGD; SET profiling = 1; $(cat LoadTable/lineitem.sql); SHOW PROFILES;"  | grep -oE '^[^ ]+ [^ ]+ [^ ]+ [^ ]+ [^ ]+' | awk '{print $2}')

echo "Import time table [lineitem] " $output "  seconds" >> Results/ImportTime.txt



output=$(mysql --local-infile=1 -u root -h localhost -P 3306 -e "USE tpchSGD; SET profiling = 1; $(cat LoadTable/nation.sql); SHOW PROFILES;"  | grep -oE '^[^ ]+ [^ ]+ [^ ]+ [^ ]+ [^ ]+' | awk '{print $2}')

echo "Import time table [nation] " $output "  seconds" >> Results/ImportTime.txt


output=$(mysql --local-infile=1 -u root -h localhost -P 3306 -e "USE tpchSGD; SET profiling = 1; $(cat LoadTable/orders.sql); SHOW PROFILES;"  | grep -oE '^[^ ]+ [^ ]+ [^ ]+ [^ ]+ [^ ]+' | awk '{print $2}')

echo "Import time table [orders] " $output "  seconds" >> Results/ImportTime.txt



output=$(mysql --local-infile=1 -u root -h localhost -P 3306 -e "USE tpchSGD; SET profiling = 1; $(cat LoadTable/part.sql); SHOW PROFILES;"  | grep -oE '^[^ ]+ [^ ]+ [^ ]+ [^ ]+ [^ ]+' | awk '{print $2}')

echo "Import time table [part] " $output >> Results/ImportTime.txt




output=$(mysql --local-infile=1 -u root -h localhost -P 3306 -e "USE tpchSGD; SET profiling = 1; $(cat LoadTable/partsupp.sql); SHOW PROFILES;"  | grep -oE '^[^ ]+ [^ ]+ [^ ]+ [^ ]+ [^ ]+' | awk '{print $2}')

echo "Import time table [partsupp] " $output "  seconds">> Results/ImportTime.txt





output=$(mysql --local-infile=1 -u root -h localhost -P 3306 -e "USE tpchSGD; SET profiling = 1; $(cat LoadTable/region.sql); SHOW PROFILES;"  | grep -oE '^[^ ]+ [^ ]+ [^ ]+ [^ ]+ [^ ]+' | awk '{print $2}')

echo "Import time table [region] " $output "  seconds">> Results/ImportTime.txt



output=$(mysql --local-infile=1 -u root -h localhost -P 3306 -e "USE tpchSGD; SET profiling = 1; $(cat LoadTable/supplier.sql); SHOW PROFILES;"  | grep -oE '^[^ ]+ [^ ]+ [^ ]+ [^ ]+ [^ ]+' | awk '{print $2}')

echo "Import time table [supplier] " $output "  seconds" >> Results/ImportTime.txt



