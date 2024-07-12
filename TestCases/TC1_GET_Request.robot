*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    https://petstore.swagger.io
${id}          100

*** Test Cases ***
Get Pet By Id
    Create Session    mysession    ${base_url}
    ${response}=    GET Request    mysession    /v2/pet/${id}
    Log To Console    ${response.status_code}
    Log To Console    ${response.headers}
    Log To Console    ${response.content}


    # Validations
    Should Be Equal As Numbers    ${response.status_code}    200

    ${body}=  Convert To String  ${response.content}

    Log To Console    ${body}
    Should Contain    ${body}    100

#    ${contentTypeValue}= Get From Dictionary   ${response.headers} Content-Type
#    Should Be Equal     ${contentTypeValue}     application/json

    ${content_type}=    Get From Dictionary    ${response.headers}    Content-Type
    Log To Console    Content-Type: ${content_type}
    Should Be Equal     ${content_type}     application/json









    