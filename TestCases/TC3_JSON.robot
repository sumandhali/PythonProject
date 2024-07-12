*** Settings ***
Library     RequestsLibrary
Library     OperatingSystem
Library     Collections
Library     JSONLibrary

*** Variables ***
${json_file_path}       D:/PyChramProjects/APIAutomation/TestData/jsondata.json

*** Test Cases ***
Testcase1:
    # Load JSON data from file
    ${json_obj}=       Load Json From File    ${json_file_path}

    ${name_value}=      Get Value From Json     ${json_obj}     $.firstName
    Log To Console    ${name_value[0]}
    Should Be Equal    ${name_value[0]}    John

    ${street_value}=    Get Value From Json     ${json_obj}     $.address.streetaddress
    Log To Console    ${street_value[0]}
    Should Be Equal   ${street_value[0]}    22 2nd Street

    ${faxnumb_value}=   Get Value From Json    ${json_obj}      $.phoneNumber[1].number
    Log To Console    ${faxnumb_value}
    Should Be Equal   ${faxnumb_value[0]}    646 555-4567






