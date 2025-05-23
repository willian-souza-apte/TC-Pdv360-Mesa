*** Settings ***
Documentation    Test to list registered sectors.

Library    RequestsLibrary

Resource    ../resources/oauth/Authorization.resource
Resource    ../resources/physical-table/Physical-table-list-sector.resource

Test Setup     Start session


*** Test Cases ***
List table sector
    [Tags]    sector
    Should get all sector avaliable