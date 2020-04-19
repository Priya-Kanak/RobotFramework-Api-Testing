***Settings***
Library    RequestsLibrary    
Library    String  
Library    Collections 

***Variables***
${base_URL}    http://dummy.restapiexample.com/api/v1
${Servicename}    /create
${sample_body}    {"name":"test","salary":"123","age":"23"}


*** Test Cases ***
PostRequest
    RequestsLibrary.Create Session    baseURI       ${base_URL}
    &{body}=    Create Dictionary    name=priya salary=00 age=16
    &{headers}=    Create Dictionary    content-type=application/json      
    ${response}=    RequestsLibrary.Post Request    baseURI    ${Servicename}    data=${body}    headers=${headers}
    Log To Console    ${response}   
    Log To Console    ${response.status_code}      