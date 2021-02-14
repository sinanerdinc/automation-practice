*** Settings ***
Resource  ../po/search.robot

*** Keywords ***
add item to cart from search result
    [Arguments]  ${order}
    search.add item to cart from search result  ${order}

search product
    [Arguments]  ${search}
    search.fill search input  ${search}[param]
    search.click search button