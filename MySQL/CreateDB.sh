#!/bin/bash

# Conecta ao banco de dados e ativa a exibição do tempo de execução
# Executa a consulta e armazena o resultado na variável 'output'
output=$(mysql -u root -h localhost -P 3306 -e "CREATE DATABASE tpchSGD")

echo $output