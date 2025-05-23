*** Settings ***
Documentation    Resource and elements to physical table open.

Library    RequestsLibrary
Library    Collections


Resource    ../base.resource

*** Variables ***
${physical_table_id}    1
${consumer_name}        Felix
${current_people}       2
${waiter_id}            1

${json_response}

*** Keywords ***
Should be open table physical with all attributes filled
    Create Session    alias=pdv360-mesa    url=${base_url}

    ${HEADER}    Create Dictionary       
    ...    Content-Type=application/json     
    ...    Authorization=Bearer ${token}

    ${BODY}    Create Dictionary    
    ...    physical_table_id=${physical_table_id}    
    ...    waiter_id=${waiter_id}      
    ...    consumer_name=${consumer_name}    
    ...    current_people=${current_people}    

    ${JSON}    Evaluate    json.dumps(${BODY})    modules=json

    ${RESPONSE}    POST On Session     
    ...    headers=${HEADER}    
    ...    alias=pdv360-mesa    
    ...    url=/physical-tables/open    
    ...    data=${JSON}

    Status Should Be     201

    Set Suite Variable    ${json_response}    ${RESPONSE.json()}
    
    ${table}    Get From Dictionary    ${json_response}    physical_table_id
    ${name}    Get From Dictionary    ${json_response}    consumer_name

    Should Be Equal As Integers    1        ${table}
    Should Be Equal                Felix    ${name}
       

Should be open table physical with optional attributes filled
    Create Session    alias=pdv360-mesa    url=${base_url}

    ${HEADER}    Create Dictionary       
    ...    Content-Type=application/json     
    ...    Authorization=Bearer ${TOKEN}

    ${BODY}    Create Dictionary    
    ...    physical_table_id=2    
    ...    waiter_id=null    
    ...    consumer_name=  
    ...    current_people=null  

    ${JSON}    Evaluate    json.dumps(${BODY})    modules=json

    ${RESPONSE}    POST On Session    
    ...    headers=${HEADER}    
    ...    alias=pdv360-mesa    
    ...    url=/physical-tables/open    
    ...    data=${JSON}

    Status Should Be    201

    Set Suite Variable    ${json_response}    ${RESPONSE.json()}
    
    ${table}           Get From Dictionary    ${json_response}    physical_table_id
    ${waiter_id}       Get From Dictionary    ${json_response}    waiter_id
    
    Should Be Equal                ${None}                  ${waiter_id}
    Should Be Equal As Integers    2        ${table}

Should not open table physical with id of table is open
    Create Session    alias=pdv360-mesa    url=${base_url}

    ${HEADER}    Create Dictionary       
    ...    Content-Type=application/json     
    ...    Authorization=Bearer ${token}

    ${BODY}    Create Dictionary    
    ...    physical_table_id=${physical_table_id}    
    ...    waiter_id=${waiter_id}      
    ...    consumer_name=${consumer_name}    
    ...    current_people=${current_people}    

    ${JSON}    Evaluate    json.dumps(${BODY})    modules=json
    
    ${RESPONSE}   POST On Session    
    ...    headers=${HEADER}    
    ...    alias=pdv360-mesa    
    ...    url=/physical-tables/open    
    ...    expected_status=any    
    ...    data=${JSON}

    Log    Status code: ${RESPONSE.status_code}
    ${body}    Set Variable    ${RESPONSE.json()}    modules=requests

    Log    Mensagem principal: ${RESPONSE.json()['message']}
    Log    Detalhe: ${RESPONSE.json()['errors'][0]['message']}
