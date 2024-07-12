*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}         https://petstore.swagger.io/v2/user

*** Test Cases ***
put_customerRegistration
        Create Session    mysession     ${base_url}
        #creating the list of dictionaries
        # Create the JSON payload as a list of dictionaries
    ${user_data}=    Create List
    ${user}=    Create Dictionary
    ...    id=100
    ...    username=mike123
    ...    firstName=mike123
    ...    lastName=mike123
    ...    email=mike123@gmail.com
    ...    password=string
    ...    phone=string
    ...    userStatus=0
    Append To List    ${user_data}    ${user}

    ${header}=      Create Dictionary       Content-Type=application/json

    ${response}=    Post Request    mysession    /createWithList    data=${user_data}       headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

#    #Validations
    ${res_body}=    Convert To String    ${response.content}
     Should Contain    ${res_body}    200
     Should Contain    ${res_body}    ok
     Should Be Equal As Numbers    ${response.status_code}    200

#*** Settings ***
#Library    RequestsLibrary
#Library    Collections
#
#*** Variables ***
#${base_url}    https://petstore.swagger.io/v2
#${endpoint}    /user/createWithList
#
#*** Test Cases ***
#Create User
#    # Create the JSON payload as a list of dictionaries
#    ${user_data}=    Create List
#    ${user}=    Create Dictionary
#    ...    id=100
#    ...    username=mike123
#    ...    firstName=mike123
#    ...    lastName=mike123
#    ...    email=mike123@gmail.com
#    ...    password=string
#    ...    phone=string
#    ...    userStatus=0
#    Append To List    ${user_data}    ${user}
#
#    # Convert the list of dictionaries to a JSON string
#    ${json_payload}=    Convert To JSON    ${user_data}
#
#    # Create session with headers
#    Create Session    mysession    ${base_url}    headers={"Content-Type": "application/json"}
#
#    # Send POST request with JSON payload
#    ${response}=    Post Request    mysession    ${endpoint}    data=${json_payload}
#    Log To Console    ${response.status_code}
#    Log To Console    ${response.headers}
#    Log To Console    ${response.content}
#
#    # Validations
#    Should Be Equal As Numbers    ${response.status_code}    200
#    ${res_body}=    Convert To String    ${response.content}
##    Should Contain    ${response.content}    200
#     Should Contain    ${response.content}    ok
#
#*** Keywords ***
#Convert To JSON
#    [Arguments]    ${data}
#    ${json_string}=    Evaluate    json.dumps(${data})    json
#    [Return]    ${json_string}

