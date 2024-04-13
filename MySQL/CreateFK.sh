


#!/bin/bash

# Conecta ao banco de dados e ativa a exibição do tempo de execução
# Executa a consulta e armazena o resultado na variável 'output'
rm -r Results/FKCreation.txt

output=$(mysql -u root -h localhost -P 3306 -e "USE tpchcloud; ALTER TABLE SUPPLIER ADD FOREIGN KEY (S_NATIONKEY) REFERENCES NATION(N_NATIONKEY);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create FK S_NATIONKEY into Table SUPPLIER " $output >> Results/FKCreation.txt



output=$(mysql -u root -h localhost -P 3306 -e "USE tpchcloud; ALTER TABLE NATION ADD FOREIGN KEY (N_REGIONKEY) REFERENCES REGION(R_REGIONKEY);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create FK N_REGIONKEY into Table NATION " $output >> Results/FKCreation.txt




output=$(mysql -u root -h localhost -P 3306 -e "USE tpchcloud; ALTER TABLE CUSTOMER ADD FOREIGN KEY (C_NATIONKEY) REFERENCES NATION(N_NATIONKEY);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create FK C_NATIONKEY into Table CUSTOMER " $output >> Results/FKCreation.txt




output=$(mysql -u root -h localhost -P 3306 -e "USE tpchcloud; ALTER TABLE PARTSUPP ADD FOREIGN KEY (PS_SUPPKEY) REFERENCES SUPPLIER(S_SUPPKEY);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create FK PS_SUPPKEY into Table PARTSUPP " $output >> Results/FKCreation.txt



output=$(mysql -u root -h localhost -P 3306 -e "USE tpchcloud; ALTER TABLE PARTSUPP ADD FOREIGN KEY (PS_PARTKEY) REFERENCES PART(P_PARTKEY);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create FK PS_PARTKEY into Table PARTSUPP " $output >> Results/FKCreation.txt



output=$(mysql -u root -h localhost -P 3306 -e "USE tpchcloud; ALTER TABLE ORDERS ADD FOREIGN KEY (O_CUSTKEY) REFERENCES CUSTOMER(C_CUSTKEY);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create FK O_CUSTKEY into Table ORDERS " $output >> Results/FKCreation.txt



output=$(mysql -u root -h localhost -P 3306 -e "USE tpchcloud; ALTER TABLE LINEITEM ADD FOREIGN KEY (L_ORDERKEY) REFERENCES ORDERS(O_ORDERKEY);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create FK L_ORDERKEY into Table LINEITEM " $output >> Results/FKCreation.txt



output=$(mysql -u root -h localhost -P 3306 -e "USE tpchcloud; ALTER TABLE LINEITEM ADD FOREIGN KEY (L_PARTKEY,L_SUPPKEY) REFERENCES PARTSUPP(PS_PARTKEY,PS_SUPPKEY);SHOW PROFILES" |  grep -A 1 "Duration" |tail -n 1 |awk '{print $2}')

echo "Time create FK L_PARTKEY, L_SUPPKEY into Table LINEITEM " $output >> Results/FKCreation.txt
