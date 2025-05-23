*** Settings ***
Documentation    Test to list physical table.

Library    RequestsLibrary

Resource    ../resources/oauth/Authorization.resource
Resource    ../resources/db-resource/clean-database.resource
Resource    ../resources/physical-table/Physical-table-open.resource

Test Setup     Start session


*** Test Cases ***
Physical table open
    [Tags]    physical-table
    Should be open table physical with all attributes filled
    Should be open table physical with optional attributes filled

Physical table with id in use
    [Tags]    smoke
    Should not open table physical with id of table is open
    
Clean database
    [Tags]    clean
    Limpar Atendimento Da Mesa    
