*** Settings ***
Documentation    Recursos e elementos de Physical table active.

Library    RequestsLibrary

Resource    ../base.resource


*** Keywords ***
Should get all table avaliable
    Create Session    alias=pdv360-mesa    url=${base_url}

    ${HEADER}    Create Dictionary       
    ...    Content-Type=application/json     
    ...    Authorization=Bearer ${token}

    ${RESPONSE}     GET On Session    
  ...    alias=pdv360-mesa    
  ...    url=physical-tables/available
  ...    headers=${HEADER}

  Status Should Be    200

  ${quantidade}=  Get Length       ${RESPONSE.json()['items']}
    Log             Existem ${quantidade} itens disponíveis