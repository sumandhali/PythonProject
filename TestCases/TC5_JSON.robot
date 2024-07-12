*** Settings ***
Library     XML
Library     OperatingSystem
Library     Collections

*** Variables ***
${xml_filepath}     D:/PyChramProjects/APIAutomation/TestData/new 1.xml

*** Test Cases ***
Testcase3:
 # Load XML data from file
    ${xml_obj}=  Parse Xml      ${xml_filepath}

    #Validations
    #check the single element value
    #approach 1
    ${emp_firstname}=   Get Element Text    ${xml_obj}      .//Employee[1]/FirstName
    Log To Console    ${emp_firstname}
    Should Be Equal    ${emp_firstname}    Tanmay

    #approach 2
    ${emp_firstname}=   Get Element     ${xml_obj}      .//Employee[1]/FirstName
    Log To Console    ${emp_firstname.text}
    Should Be Equal    ${emp_firstname.text}    Tanmay

    #approach 3
    Element Text Should Match        ${xml_obj}     Tanmay      .//Employee[1]/FirstName


    #val2 check number of elements
    ${count}=       Get Element Count    ${xml_obj}     .//Employee
    Log To Console    ${count}
    Should Be Equal As Integers    ${count}    3
    
    
    #val3 check attribute presence 
    
    Element Attribute Should Be     ${xml_obj}    id    be134      .//Employee[3]
    
    #val 4 check values of child elements
    
    ${child_elements}=      Get Child Elements    ${xml_obj}    .//Employee[1]
    Should Not Be Empty    ${child_elements}
    Log To Console    ${child_elements}

    ${fname}=   Get Element Text    ${child_elements[0]}
    ${lname}=   Get Element Text    ${child_elements[1]}
    ${title}=   Get Element Text    ${child_elements[2]}

    Log To Console     ${fname}
    Log To Console     ${lname}
    Log To Console     ${title}

    Should Be Equal    ${fname}    Tanmay









