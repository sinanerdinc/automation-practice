*** Settings ***
Resource  ../po/login.robot

*** Keywords ***
create an account
    [Arguments]  ${user}
    login.fill email address for create an account  ${user}[email]
    login.click create an account button
    Run Keyword If  '${user}[gender]' == 'Mr'  login.click title mr
    Run Keyword If  '${user}[gender]' == 'Mrs'  login.click title mrs
    login.fill firstname  ${user}[first_name]
    login.fill lastname  ${user}[last_name]
    login.fill password  ${user}[password]
    login.select day of birth  ${user}[birth_data]
    login.select month of birth  ${user}[birth_month]
    login.select year of birth  ${user}[birth_year]
    login.fill firstname for address  ${user}[first_name]
    login.fill lastname for address  ${user}[last_name]
    login.fill adress  ${address}[address]
    login.fill city  ${address}[city]
    login.select state  ${address}[state]
    login.fill postcode  ${address}[postcode]
    login.fill mobile phone  ${address}[mobile_phone]
    login.click register button

verify order history
    login.go to order history page
    ${result} =  login.get reference code
    should be equal  ${result}  ${reference_code}