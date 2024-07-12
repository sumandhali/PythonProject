*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     http://jsonplaceholder.typicode.com

*** Test Cases ***
TestHeaders
        Create Session    mysession    ${base_url}
        ${response}=        GET Request     mysession    /photos
        Log To Console    ${response.headers}

        ${content_typeValue}=       Get From Dictionary     ${response.headers}       Content-Type
        Log To Console    ${content_typeValue}
        Should Be Equal    ${content_typeValue}    application/json; charset=utf-8
        
Testcookies
        Create Session    mysession    ${base_url}
        ${response}=        GET Request     mysession    /photos
        Log To Console    ${response.cookies}
        ${cookie_value}=    Get From Dictionary    ${response.cookies}    _cfuid
        Log To Console    ${cookie_value}

        









