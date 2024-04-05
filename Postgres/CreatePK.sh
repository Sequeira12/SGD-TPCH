#!/bin/bash

# Conecta ao banco de dados e ativa a exibição do tempo de execução
# Executa a consulta e armazena o resultado na variável 'output'
rm -r Results/PKCreation.txt

output=$(psql -U postgres -d tpch-cloud  -c "\timing on" -c "ALTER TABLE REGION ADD PRIMARY KEY (R_REGIONKEY)" -c "\timing off" | grep "^Time: ")

echo "Time create PK R_REGIONKEY into Table REGION " $output >> Results/PKCreation.txt



output=$(psql -U postgres -d tpch-cloud  -c "\timing on" -c "ALTER TABLE NATION ADD PRIMARY KEY (N_NATIONKEY);" -c "\timing off" | grep "^Time: ")

echo "Time create PK N_NATIONKEY into Table NATION " $output >> Results/PKCreation.txt




output=$(psql -U postgres -d tpch-cloud  -c "\timing on" -c "ALTER TABLE CUSTOMER ADD PRIMARY KEY (C_CUSTKEY);" -c "\timing off" | grep "^Time: ")

echo "Time create PK C_CUSTKEY into Table CUSTOMER " $output >> Results/PKCreation.txt




output=$(psql -U postgres -d tpch-cloud  -c "\timing on" -c "ALTER TABLE SUPPLIER ADD PRIMARY KEY (S_SUPPKEY);" -c "\timing off" | grep "^Time: ")

echo "Time create PK S_SUPPKEY into Table SUPPLIER " $output >> Results/PKCreation.txt



output=$(psql -U postgres -d tpch-cloud  -c "\timing on" -c "ALTER TABLE PART ADD PRIMARY KEY (P_PARTKEY);" -c "\timing off" | grep "^Time: ")

echo "Time create PK P_PARTKEY into Table PART " $output >> Results/PKCreation.txt



output=$(psql -U postgres -d tpch-cloud  -c "\timing on" -c "ALTER TABLE PARTSUPP ADD PRIMARY KEY (PS_PARTKEY, PS_SUPPKEY)" -c "\timing off" | grep "^Time: ")

echo "Time create PK PS_PARTKEY,PS_SUPPKEY into Table PARTSUPP " $output >> Results/PKCreation.txt



output=$(psql -U postgres -d tpch-cloud  -c "\timing on" -c "ALTER TABLE ORDERS ADD PRIMARY KEY (O_ORDERKEY);" -c "\timing off" | grep "^Time: ")

echo "Time create PK O_ORDERKEY into Table ORDERS " $output >> Results/PKCreation.txt



output=$(psql -U postgres -d tpch-cloud  -c "\timing on" -c "ALTER TABLE LINEITEM ADD PRIMARY KEY (L_ORDERKEY, L_LINENUMBER);" -c "\timing off" | grep "^Time: ")

echo "Time create PK L_ORDERKEY, L_LINENUMBER into Table LINEITEM " $output >> Results/PKCreation.txt