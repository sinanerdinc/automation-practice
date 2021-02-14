*** Settings ***
Resource  ../Resources/app/utilsApp.robot
Resource  ../Resources/app/homepageApp.robot
Resource  ../Resources/app/searchApp.robot
Resource  ../Resources/app/loginApp.robot
Resource  ../Resources/app/basketApp.robot
Test Setup  utilsApp.create session
Test Teardown  utilsApp.close session

*** Test Cases ***
Demo Test Cases
    utilsApp.generate test datas
    homepageApp.go to homepage
    homepageApp.click sign in button
    loginApp.create an account  ${user}
    homepageApp.go to homepage
    homepageApp.verify user is logged  ${user}
    homepageApp.go to category  ${category}
    searchApp.add item to cart from search result  1
    searchApp.search product  ${search}
    searchApp.add item to cart from search result  2
    basketApp.go to cart page
    basketApp.verify all products in the basket
    basketApp.click proceed to checkout button in the basket
    basketApp.click proceed to checkout button in the address
    basketApp.agree term of service
    basketApp.click proceed to checkout button in the shipping
    basketApp.confirm order with bank wire
    loginApp.verify order history
