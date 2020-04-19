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
   # ${len_value}=    Get Length     ${framework}
   # &{data}=    Evaluate     json.loads($response)    json
   # ${index} =    Set Variable    -1
    :FOR    ${item}    IN    @{framework}
    #\    Get From List     ${framework}    ${index}+1 
    \   # ${value}=    Evaluate     ${index}+1
    \    #Log To Console    ${value}${item}    
    \    Log To Console    ${item}    
   
    #${value}=    Get From List     ${framework}    0   
    ${id_dict}=    Get Dictionary Keys    ${json}        
    Log To Console    ${id_dict} 
    #Log To Console    ${value} 
      
    