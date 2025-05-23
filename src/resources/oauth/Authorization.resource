*** Settings ***

Library    RequestsLibrary
Library    Collections

Resource    ../base.resource


*** Variables ***   
${grant_type}        urn:ietf:params:oauth:grant-type:custom_client_credentials
${scope}             profile
${username}          quality
${password}          123456
${pos_id}            1

${token}


*** Keywords ***
Get Access Token     
    [Tags]    buscar-token
    Create Session    alias=pdv360-mesa     url=${base_url}
    ${HEADER}=    Create Dictionary    Authorization=Basic Y2xpZW50LWlkLWZyb250OjEyMzQ1Ng==
    ${DATA}        Create Dictionary    
    ...        Content-type=x-www-form-urlencoded 
    ...        grant_type=${grant_type}       
    ...        scope=${scope} 
    ...        username=${username}    
    ...        password=${password}   
    ...        pos_id=${pos_id}    

    ${RESPONSE}        POST On Session   alias=pdv360-mesa     url=/oauth2/token    headers=${HEADER}    data=${DATA}
    Set Suite Variable        ${token}     ${RESPONSE.json()["access_token"]}

    RETURN    ${token}


Check request success
    [Arguments]        ${RESPONSE}
    Should Be True    '${RESPONSE.status_code}'=='200' or '${RESPONSE.status_code}'=='201'
    ...                msg=Erro na requisição! Verifique: ${RESPONSE}

    Delete All Sessions    