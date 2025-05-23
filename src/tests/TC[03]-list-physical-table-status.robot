*** Settings ***
Documentation    Test to list physical table status.

Library    RequestsLibrary

Resource    ../resources/oauth/Authorization.resource
Resource    ../resources/physical-table/Physical-table-list-status.resource

Test Setup     Start session


*** Test Cases ***
List physical table status
    [Tags]    table-status
    Should get all status avaliable