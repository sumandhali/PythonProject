*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${base_url}     https://restcountries.com

*** Test Cases ***
Get_countryinfo
    Create Session    mysession    ${base_url}
    ${response}=    GET Request    mysession    /v2/alpha/IN

    # Load JSON response
    ${json_obj}=    To Json    ${response.content}

    # Extract and log country name
    ${country_name}=    Get Value From Json    ${json_obj}    $.name
    Log To Console    ${country_name[0]}
    Should Be Equal    ${country_name[0]}    India

    # Extract and log single data validation in an array
    ${border}=    Get Value From Json    ${json_obj}    $.borders[0]
    Log To Console    ${border[0]}
    Should Be Equal    ${border[0]}    AFG

    # Extract and log multiple data validation in an array
    ${borders}=    Get Value From Json    ${json_obj}    $.borders
    Log To Console    ${borders[0]}
    Should Contain Any    ${borders[0]}    AFG    BGD    BTN    MMR    CHN
    Should Not Contain Any    ${borders[0]}    abc    xyz


