*** Settings ***
Documentation    Recursos e elementos de Physical table open.

Library    RequestsLibrary

Resource    ../base.resource


*** Keywords ***
Should get all sector avaliable
    Create Session    alias=pdv360-mesa    url=${base_url}

    ${HEADER}    Create Dictionary       
    ...    Content-Type=application/json     
    ...    Authorization=Bearer ${token}

    ${RESPONSE}     GET On Session    
  ...    alias=pdv360-mesa    
  ...    url=table-sectors/available
  ...    headers=${HEADER}

  Status Should Be    200