*** Settings ***
Documentation    Test to list waiters active.

Library    RequestsLibrary

Resource    ../resources/oauth/Authorization.resource
Resource    ../resources/waiter/Waiters-active.resource

Test Setup     Start session


*** Test Cases ***
List waiters active
    [Tags]    waiters
    Should get all waiters active