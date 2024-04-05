#!/bin/bash

# Executa o script e captura a saída

output=$(mysql --local-infile=1 -u root -h localhost -P 3306 -e "USE testdb; SET profiling = 1; $(cat ImportData.sql); SHOW PROFILES;"  | grep -oE '^[^ ]+ [^ ]+ [^ ]+ [^ ]+ [^ ]+' | awk '{print $2}'
)
echo $output
# Inicializa o tempo total
total_time=0


for valor in $output; do

    total_time=$(echo "$total_time + $valor" | bc)
done


# Mostra o tempo total de execução
echo "Execution Time: $total_time segundos" >>  Results/ImportTime.txt
