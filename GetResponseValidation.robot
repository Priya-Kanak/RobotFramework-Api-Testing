***Settings***
Library       ExtendedRequestsLibrary    
Library    RequestsLibrary    
Library    json    
Library    http    
Library    String  
Library    Collections 

***Variables***
${base_URL}    http://dummy.restapiexample.com/api/v1
${Servicename}    /employees


*** Test Cases ***
GET_Request
    RequestsLibrary.Create Session    baseURI       ${base_URL}
    ${response}=    RequestsLibrary.Get Request    baseURI    ${Servicename} 
    RequestsLibrary.Status Should Be    200    ${response}  
    Log To Console    ${response} 
    ${json} =  Set Variable  ${response.json()}
    Log To Console    ${json} 
    ${framework} =  Get From Dictionary  ${json}  data 
    Log To Console    ${framework}       
    ${resp}=  Set Variable  ${response.content}
    :FOR    ${item}    IN    @{framework}
    \    ${Key_set}=    Get Dictionary Keys    ${item}    sort_keys=False 
    \    ${Key_value}=    Get Dictionary Values    ${item}    sort_keys=False    
    \   # Log To Console    ${item}[:]   
    \   # ${one_set}=     Sli    ${item}    ${:}     
    \   # Log To Console     ${item}[:]    
    \   # ${one_set}=    Set Variable    ${item}[:]
    \    Log To Console    ${Key_set}  
    \    Log To Console    ${Key_value}   
      
    END    
   
      
    