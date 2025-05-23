*** Settings ***
Documentation    Resource and elements of Waiters active.

Library    RequestsLibrary

Resource    ../base.resource


*** Keywords ***
Should get all waiters active
    Create Session    alias=pdv360-mesa    url=${base_url}

    ${HEADER}    Create Dictionary       
    ...    Content-Type=application/json     
    ...    Authorization=Bearer ${token}

    ${RESPONSE}     GET On Session    
  ...    alias=pdv360-mesa    
  ...    url=waiters/available
  ...    headers=${HEADER}

  Status Should Be    200