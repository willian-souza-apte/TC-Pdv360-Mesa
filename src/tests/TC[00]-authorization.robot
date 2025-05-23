*** Settings ***
Documentation    Get token to authentication

Resource    ../resources/oauth/Authorization.resource

*** Test Cases ***
Should get access token
    Get Access Token