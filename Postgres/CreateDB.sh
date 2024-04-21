#!/bin/bash

# Conecta ao banco de dados e ativa a exibição do tempo de execução
# Executa a consulta e armazena o resultado na variável 'output'
output=$(export PGPASSWORD='rpcs190202';createdb -h localhost -p 5432 -U postgres tpch-25)

echo $output