*** Settings ***
Library  ../helpers/http_helper.py

*** Variables ***
${browser}

*** Keywords ***
get "${url}" status code
    ${result} =  http_helper.get  ${url}
    [Return]  ${result}