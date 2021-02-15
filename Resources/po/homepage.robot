*** Settings ***
Library  SeleniumLibrary
Resource  ./utils.robot

*** Keywords ***
go to homepage
    utils.go  ${base}[homepage]
    wait until element is visible  id=footer

click sign in button
    utils.click  class=login
    wait until element is visible  id=SubmitCreate

verify user is logged
    [Arguments]  ${user_info}
    ${get_user_info} =  utils.find text  class=header_user_info
    should be equal  ${user_info}  ${get_user_info}

mouse over to category
    [Arguments]  ${main_category}
    Mouse Over  xpath=//div[@id="block_top_menu"]/ul/li/a[text()="${main_category}"]

click to subcategory
    [Arguments]  ${sub_category}
    utils.click  xpath=//li[@class="sfHover"]//a[text()="${sub_category}"]