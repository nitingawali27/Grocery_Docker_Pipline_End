*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}      https://reqres.in/api
${LOGIN_ENDPOINT}    /login
${USERNAME}      user123
${PASSWORD}      pass123

*** Test Cases ***
Login API Test
    Create Session    api_session    ${BASE_URL}
    ${response} =    POST    api_session${LOGIN_ENDPOINT}
    ...    json={"email": "${USERNAME}", "password": "${PASSWORD}"}
    Log    ${response.json()}
    Should Be Equal As Numbers    ${response.status_code}    200
