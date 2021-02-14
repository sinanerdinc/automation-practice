*** Settings ***
Resource  ../po/homepage.robot

*** Keywords ***
go to homepage
    homepage.go to homepage

click sign in button
    homepage.click sign in button

verify user is logged
    [Arguments]  ${user}
    homepage.verify user is logged  ${user}[first_name] ${user}[last_name]

go to category
    [Arguments]  ${category}
    homepage.mouse over to category  ${category}[main]
    homepage.click to subcategory  ${category}[sub]