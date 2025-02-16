*** Settings ***
Library     String
Library     Collections
Library     RequestsLibrary
Resource    ../resources/api.robot
Resource    ../resources/keywords.robot
Resource    ../resources/token.robot
Resource    ../resources/variables.robot

*** Keywords ***
Generate Random Email And Get Token
    ${RANDOM}    Generate Random String    8    [LETTERS]
    ${CLIENT_EMAIL}    Set Variable    ${RANDOM}@yopmail.com
    Log    Generated Email: ${CLIENT_EMAIL}

    ${payload}    Create Dictionary
    ...    clientName=${CLIENT_NAME}
    ...    clientEmail=${CLIENT_EMAIL}

    ${response}    POST    ${BASE_URL}/api-clients    json=${payload}    expected_status=201
    ${ACCESS_TOKEN}    Set Variable    ${response.json().get("accessToken")}
    Should Not Be Empty    ${ACCESS_TOKEN}    Access token retrieval failed!
    Set Global Variable    ${ACCESS_TOKEN}
    Log    Access Token: ${ACCESS_TOKEN}