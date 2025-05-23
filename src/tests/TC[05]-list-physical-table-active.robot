*** Settings ***
Documentation    Test to list physical table active.

Library    RequestsLibrary

Resource    ../resources/oauth/Authorization.resource
Resource    ../resources/physical-table/Physical-table-list-active.resource

Test Setup     Start session


*** Test Cases ***
List physical table active
    [Tags]    table-active
    Should get all table avaliable