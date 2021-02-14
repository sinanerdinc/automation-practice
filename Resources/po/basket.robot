*** Settings ***
Library  SeleniumLibrary
Resource  ./utils.robot
Library  Collections
Library  ../helpers/base_helper.py

*** Variables ***
${reference_code}

*** Keywords ***
go to cart page
    utils.go  http://automationpractice.com/index.php?controller=order

verify product in the basket
    [Arguments]  ${product_name}
    List Should Contain Value  ${cart}  ${product_name}

product count in the basket
    ${count} =  Get Element Count  xpath=//table/tbody/tr
    [Return]  ${count}

get product name
    [Arguments]  ${row}
    ${result} =  get text  xpath=//table/tbody/tr[${row}]//p/a
    [Return]  ${result}

click proceed to checkout button in the basket
    utils.click  xpath=//p/a[@title="Proceed to checkout"]

click proceed to checkout button in the address
    utils.click  name=processAddress

agree term of service
    Checkbox Should Not Be Selected  id=cgv
    utils.click  id=cgv
    Checkbox Should Be Selected  id=cgv

click proceed to checkout button in the shipping
    utils.click  name=processCarrier

select bank wire method
    utils.click  class=bankwire

confirm the order
    utils.click  xpath=//p[@id="cart_navigation"]//button
    Wait Until Page Contains  Your order on My Store is complete.

get reference code
    ${text} =  utils.find text  xpath=//div[@id="center_column"]//div
    ${reference_code} =  base_helper.find reference code  ${text}
