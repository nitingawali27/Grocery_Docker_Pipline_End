*** Settings ***
Library     String
Library     Collections
Library     RequestsLibrary
Resource    ../resources/api.robot
Resource    ../resources/keywords.robot
Resource    ../resources/token.robot
Resource    ../resources/variables.robot
Resource    ../resources/payloads.robot


*** Keywords ***
Create New Cart
    ${response}    POST    ${BASE_URL}/carts    expected_status=201
    ${CART_ID}    Set Variable    ${response.json().get("cartId")}
    Should Not Be Empty    ${CART_ID}    Cart creation failed!
    Set Global Variable    ${CART_ID}
    Log    Cart ID: ${CART_ID}

Add Items To Cart
    ${response}    POST    ${BASE_URL}/carts/${CART_ID}/items    json=${Item_payload}    expected_status=201
    ${ITEM_ID}    Set Variable    ${response.json().get("itemId")}
    Set Global Variable    ${ITEM_ID}
    Log    Item ID: ${ITEM_ID}

Create New Order
    ${payload}    Create Dictionary
    ...    cartId=${CART_ID}
    ...    customerName=${CUSTOMER_NAME}
    ...    comment=${COMMENT}
    Log    payload: ${payload}

    ${headers}    Create Dictionary    Authorization=Bearer ${ACCESS_TOKEN}
    ${response}    POST    ${BASE_URL}/orders    json=${payload}    headers=${headers}    expected_status=201
    ${ORDER_ID}    Set Variable    ${response.json().get("orderId")}
    Should Not Be Empty    ${ORDER_ID}    Order creation failed!
    Set Global Variable    ${ORDER_ID}
    Log    Order ID: ${ORDER_ID}

Get All Orders
    ${headers}    Create Dictionary    Authorization=Bearer ${ACCESS_TOKEN}
    ${response}    GET    ${BASE_URL}/orders    headers=${headers}    expected_status=200
    ${ORDERS}    Set Variable    ${response.json()}
    Should Not Be Empty    ${ORDERS}    No orders found!
    Log    Orders: ${ORDERS}

Delete Order
    ${headers}    Create Dictionary    Authorization=Bearer ${ACCESS_TOKEN}
    ${response}    DELETE    ${BASE_URL}/orders/${ORDER_ID}    headers=${headers}    expected_status=204
    Log    Order Deleted Successfully

Check Grocery Store API Status
    # Send the GET request to check API status
    ${response}=    GET    ${STATUS_API}    expected_status=200
    Log    ${response.text}  # Log the raw response text for debugging
    # Validate response status
    ${json_response}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json_response}    status
    Should Be Equal As Strings    ${json_response['status']}    UP

