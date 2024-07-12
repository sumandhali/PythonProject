#*** Settings ***
#Library     RequestsLibrary
#Library     Collections
#
#*** Variables ***
#${base_url}     https://httpbin.org
#
#*** Test Cases ***
#BasicAuth
##    ${auth}=    Create List     Admin       testuser123
#    Create Session    mysession     ${base_url}     verify=False
#    ${response}=        Get Request    mysession    /basic-auth/Admin/testuser123
#
#    Log To Console    ${response.content}
#    Should Be Equal As Strings     ${response.status_code}    200


*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${base_url}     https://httpbin.org

*** Test Cases ***
BasicAuth
    ${auth}=    Create List     Admin       testuser123
    # Create session with verification turned off to suppress the warning
    Create Session    mysession    ${base_url}     auth=${auth}    verify=False

    # Send a GET request to a known endpoint
    ${response}=    GET Request    mysession    /basic-auth/Admin/testuser123

    # Check the response status
    Should Be Equal As Strings    ${response.status_code}    200

    # Parse the JSON response
    ${json_obj}=    ${response.json()}    ${response.content}

    # Validate the response content
    ${authenticated}=    Get Value From Json    ${json_obj}    $.authenticated
    Log To Console    ${authenticated}
    Should Be True    ${authenticated}
