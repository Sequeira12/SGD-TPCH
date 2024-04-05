#!/bin/bash

# Conecta ao banco de dados e ativa a exibição do tempo de execução
# Executa a consulta e armazena o resultado na variável 'output'
rm -r Results/PKCreation.txt

output=$(mysql -u root -h localhost -P 3306  -e "USE testdb; ALTER TABLE REGION ADD PRIMARY KEY (R_REGIONKEY);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create PK R_REGIONKEY into Table REGION " $output >> Results/PKCreation.txt




output=$(mysql -u root -h localhost -P 3306 -e "USE testdb; ALTER TABLE NATION ADD PRIMARY KEY (N_NATIONKEY);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create PK N_NATIONKEY into Table NATION " $output >> Results/PKCreation.txt




output=$(mysql -u root -h localhost -P 3306  -e "USE testdb; ALTER TABLE CUSTOMER ADD PRIMARY KEY (C_CUSTKEY);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create PK C_CUSTKEY into Table CUSTOMER " $output >> Results/PKCreation.txt




output=$(mysql -u root -h localhost -P 3306 -e "USE testdb; ALTER TABLE SUPPLIER ADD PRIMARY KEY (S_SUPPKEY);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create PK S_SUPPKEY into Table SUPPLIER " $output >> Results/PKCreation.txt



output=$(mysql -u root -h localhost -P 3306  -e "USE testdb; ALTER TABLE PART ADD PRIMARY KEY (P_PARTKEY);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create PK P_PARTKEY into Table PART " $output >> Results/PKCreation.txt



output=$(mysql -u root -h localhost -P 3306  -e "USE testdb; ALTER TABLE PARTSUPP ADD PRIMARY KEY (PS_PARTKEY, PS_SUPPKEY);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create PK PS_PARTKEY,PS_SUPPKEY into Table PARTSUPP " $output >> Results/PKCreation.txt



output=$(mysql -u root -h localhost -P 3306  -e "USE testdb; ALTER TABLE ORDERS ADD PRIMARY KEY (O_ORDERKEY);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create PK O_ORDERKEY into Table ORDERS " $output >> Results/PKCreation.txt



output=$(mysql -u root -h localhost -P 3306 -e "USE testdb; ALTER TABLE LINEITEM ADD PRIMARY KEY (L_ORDERKEY, L_LINENUMBER);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create PK L_ORDERKEY, L_LINENUMBER into Table LINEITEM " $output >> Results/PKCreation.txt
