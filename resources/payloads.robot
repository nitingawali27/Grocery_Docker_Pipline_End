*** Settings ***
Library     String
Library     Collections
Library     RequestsLibrary
Resource    ../resources/api.robot
Resource    ../resources/keywords.robot
Resource    ../resources/token.robot
Resource    ../resources/variables.robot

*** Keywords ***
Create Item Payload
    ${Item_payload}    Create Dictionary
    ...    productId=${PRODUCT_ID}
    ...    quantity=${QUANTITY}
    Set Global Variable    ${Item_payload}
    Log    Item Payload: ${Item_payload}


