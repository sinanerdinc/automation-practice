*** Settings ***
Library  SeleniumLibrary
Resource  ./utils.robot
Library  Collections

*** Variables ***
@{cart}

*** Keywords ***
add item to cart from search result
    [Arguments]  ${order}
    mouse over  xpath=//ul[contains(@class,"product_list")]/li[${order}]
    ${product_name} =  utils.find text  xpath=//ul[contains(@class,"product_list")]/li[1]//a[@class="product-name"]
    Append To List  ${cart}  ${product_name}
    utils.click  xpath=//ul[contains(@class,"product_list")]/li[${order}]//a[contains(@class,"add_to_cart_button")]
    wait until element is visible  id=layer_cart
    utils.click  class=cross

fill search input
    [Arguments]  ${search_param}
    utils.input  id=search_query_top  ${search_param}

click search button
    utils.click  name=submit_search
    Wait Until Location Contains  controller=search
    wait until element is visible  class=lighter