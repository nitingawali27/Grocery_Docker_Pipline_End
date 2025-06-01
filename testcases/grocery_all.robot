*** Settings ***
Library     String
Library     Collections
Library     RequestsLibrary
Resource    ../resources/api.robot
Resource    ../resources/keywords.robot
Resource    ../resources/token.robot
Resource    ../resources/variables.robot
Resource    ../resources/payloads.robot

*** Test Cases ***
Create Item Payload
    [Documentation]    Execute Create Item Payload test case
    Create Item Payload

Generate Random Email And Get Token
    [Documentation]    Execute Generate Random Email And Get Token test case
    Generate Random Email And Get Token

Create New Cart
    [Documentation]    Execute Create New Cart test case
    Create New Cart

Add Items To Cart
    [Documentation]    Execute Add Items To Cart test case
    Add Items To Cart

Create New Order
    [Documentation]    Execute Create New Order test case
    Create New Order

Get All Orders
    [Documentation]    Execute Get All Orders test case
    Get All Orders

Delete Order
    [Documentation]    Execute Delete Order test case
    Delete Order

Check Grocery Store API Status
    [Documentation]    Execute Check Grocery Store API Status test case
    Check Grocery Store API Status
