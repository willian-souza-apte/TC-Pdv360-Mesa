*** Settings ***
Documentation    Recursos e elementos de Physical table status.

Library    RequestsLibrary

Resource    ../base.resource


*** Keywords ***
Should get all status avaliable
    Create Session    alias=pdv360-mesa    url=${base_url}

    ${HEADER}    Create Dictionary       
    ...    Content-Type=application/json     
    ...    Authorization=Bearer ${token}

    ${RESPONSE}     GET On Session    
  ...    alias=pdv360-mesa    
  ...    url=physical-table-status/available
  ...    headers=${HEADER}

  Status Should Be    200

  ${items}=       Set Variable    ${RESPONSE.json()['items']}

  ${nomes_encontrados}=    Evaluate    [item['name'] for item in ${items}]

  ${nomes_esperados}=    Create List    Em Pagamento    Fechada    Livre    Ocupada    Reservada

  Should Contain    ${nomes_encontrados}    Em Pagamento
  Should Contain    ${nomes_encontrados}    Fechada
  Should Contain    ${nomes_encontrados}    Livre
  Should Contain    ${nomes_encontrados}    Ocupada
  Should Contain    ${nomes_encontrados}    Reservada