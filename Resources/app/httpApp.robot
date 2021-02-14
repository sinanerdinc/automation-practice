*** Settings ***
Resource  ../po/http.robot

*** Keywords ***
get "${url}" verify http status is "${response_code}"
    ${result} =  http.get "${url}" status code
    should be equal  ${result}  ${response_code}
