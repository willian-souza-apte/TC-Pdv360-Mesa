*** Settings ***
Documentation    Remove insert after tests


Library    DatabaseLibrary

*** Variables ***
${DB_NAME}    pdv360
${DB_USER}    pdv360
${DB_PWD}     123456
${DB_HOST}    172.29.143.227
${DB_PORT}    6200

*** Keywords ***
Conectar Ao Banco
    Connect To Database    psycopg2    ${DB_NAME}    ${DB_USER}    ${DB_PWD}    ${DB_HOST}    ${DB_PORT}

Desconectar Do Banco
    Disconnect From Database

Limpar Atendimento Da Mesa    
    Conectar Ao Banco
    Execute Sql String    DELETE FROM PHYSICAL_TABLE_MANAGEMENT;
    Desconectar Do Banco