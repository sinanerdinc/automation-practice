*** Settings ***
Library  SeleniumLibrary
Resource  ./utils.robot

*** Keywords ***
fill email address for create an account
    [Arguments]  ${email}
    utils.input  name=email_create  ${email}

click create an account button
    utils.click  id=SubmitCreate
    wait until element is visible  id=customer_firstname

click title mr
    utils.click  id=uniform-id_gender1

click title mrs
    utils.click  id=uniform-id_gender2

fill firstname
    [Arguments]  ${first_name}
    utils.input  id=customer_firstname  ${first_name}

fill lastname
    [Arguments]  ${last_name}
    utils.input  id=customer_lastname  ${last_name}

fill password
    [Arguments]  ${password}
    utils.input  id=passwd  ${password}

select day of birth
    [Arguments]  ${day}
    Select From List By Value  id=days  ${day}

select month of birth
    [Arguments]  ${month}
    Select From List By Value  id=months  ${month}

select year of birth
    [Arguments]  ${year}
    Select From List By Value  id=years  ${year}

fill firstname for address
    [Arguments]  ${first_name}
    utils.input  id=firstname  ${first_name}

fill lastname for address
    [Arguments]  ${last_name}
    utils.input  id=lastname  ${last_name}

fill adress
    [Arguments]  ${address}
    utils.input  id=address1  ${address}

fill city
    [Arguments]  ${city}
    utils.input  id=city  ${city}

select state
    [Arguments]  ${state_name}
    Select From List By Label  id=id_state  ${state_name}

fill postcode
    [Arguments]  ${postcode}
    utils.input  id=postcode  ${postcode}

fill mobile phone
    [Arguments]  ${phone}
    utils.input  id=phone_mobile  ${phone}

click register button
    utils.click  id=submitAccount
    Wait Until Location Is  ${base}[homepage]/index.php?controller=my-account
    Wait Until Page Contains  Welcome to your account. Here you can manage all of your personal information and orders.

go to order history page
    utils.go  ${base}[homepage]/index.php?controller=history

get reference code
    ${result} =  utils.find text  xpath=//a[@class="color-myaccount"]
    [Return]  ${result}