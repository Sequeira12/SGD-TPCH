#!/bin/bash


output=$(export PGPASSWORD='rpc1902';psql -U postgres -d tpch-cloud -c "\timing on" -f ImportData.sql -c "\timing off" | grep "^Time: ")

# Extrair os tempos e somá-los
total_time=0
while read -r line; do
    # Extrair o tempo em milissegundos
    time=$(echo "$line" | grep -oE '[0-9.]+ ms' | cut -d' ' -f1)
    # Converter para milissegundos e somar ao total
    total_time=$(echo "$total_time + $time" | bc)
done <<< "$output"

# Mostrar o tempo total
echo "Tempo total de importação: $total_time ms" > Results/ImportTime.txt