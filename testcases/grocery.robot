*** Settings ***
Library     String
Library     Collections
Library     RequestsLibrary
Resource    ../resources/api.robot
Resource    ../resources/keywords.robot
Resource    ../resources/token.robot
Resource    ../resources/variables.robot


*** Test Cases ***
End-to-End Grocery Store API Test
    Generate Random Email And Get Token
    Create New Cart
    Add Items To Cart
    Create New Order
    Get All Orders
    Delete Order


