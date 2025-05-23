*** Settings ***
Documentation        Arquivo principal do projeto

Library        Browser

Resource    ../resources/oauth/Authorization.resource


*** Variables ***
${base_url}    http://localhost:8080/api  


*** Keywords ***
Start session
    Get Access Token   