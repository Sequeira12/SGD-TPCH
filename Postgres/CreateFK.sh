#!/bin/bash


rm -r Results/FKCreation.txt

output=$(export PGPASSWORD='rpcs190202';psql -U postgres -d tpch-25  -c "\timing on" -c "ALTER TABLE SUPPLIER ADD FOREIGN KEY (S_NATIONKEY) REFERENCES NATION(N_NATIONKEY);" -c "\timing off" | grep "^Time: ")

echo "Time create FK S_NATIONKEY into Table SUPPLIER " $output >> Results/FKCreation.txt



output=$(export PGPASSWORD='rpcs190202';psql -U postgres -d tpch-25  -c "\timing on" -c "ALTER TABLE NATION ADD FOREIGN KEY (N_REGIONKEY) REFERENCES REGION(R_REGIONKEY)" -c "\timing off" | grep "^Time: ")

echo "Time create FK N_REGIONKEY into Table NATION " $output >> Results/FKCreation.txt




output=$(export PGPASSWORD='rpcs190202';psql -U postgres -d tpch-25  -c "\timing on" -c "ALTER TABLE CUSTOMER ADD FOREIGN KEY (C_NATIONKEY) REFERENCES NATION(N_NATIONKEY);" -c "\timing off" | grep "^Time: ")

echo "Time create FK C_NATIONKEY into Table CUSTOMER " $output >> Results/FKCreation.txt




output=$(export PGPASSWORD='rpcs190202';psql -U postgres -d tpch-25  -c "\timing on" -c "ALTER TABLE PARTSUPP ADD FOREIGN KEY (PS_SUPPKEY) REFERENCES SUPPLIER(S_SUPPKEY);" -c "\timing off" | grep "^Time: ")

echo "Time create FK PS_SUPPKEY into Table PARTSUPP " $output >> Results/FKCreation.txt



output=$(export PGPASSWORD='rpcs190202';psql -U postgres -d tpch-25  -c "\timing on" -c "ALTER TABLE PARTSUPP ADD FOREIGN KEY (PS_PARTKEY) REFERENCES PART(P_PARTKEY);" -c "\timing off" | grep "^Time: ")

echo "Time create FK PS_PARTKEY into Table PARTSUPP " $output >> Results/FKCreation.txt



output=$(export PGPASSWORD='rpcs190202';psql -U postgres -d tpch-25  -c "\timing on" -c "ALTER TABLE ORDERS ADD FOREIGN KEY (O_CUSTKEY) REFERENCES CUSTOMER(C_CUSTKEY);" -c "\timing off" | grep "^Time: ")

echo "Time create FK O_CUSTKEY into Table ORDERS " $output >> Results/FKCreation.txt



output=$(export PGPASSWORD='rpcs190202';psql -U postgres -d tpch-25  -c "\timing on" -c "ALTER TABLE LINEITEM ADD FOREIGN KEY (L_ORDERKEY) REFERENCES ORDERS(O_ORDERKEY);" -c "\timing off" | grep "^Time: ")

echo "Time create FK L_ORDERKEY into Table LINEITEM " $output >> Results/FKCreation.txt



output=$(export PGPASSWORD='rpcs190202';psql -U postgres -d tpch-25  -c "\timing on" -c "ALTER TABLE LINEITEM ADD FOREIGN KEY (L_PARTKEY,L_SUPPKEY) REFERENCES PARTSUPP(PS_PARTKEY,PS_SUPPKEY);" -c "\timing off" | grep "^Time: ")

echo "Time create FK L_PARTKEY, L_SUPPKEY into Table LINEITEM " $output >> Results/FKCreation.txt



