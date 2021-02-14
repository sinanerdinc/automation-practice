*** Settings ***
Resource  ../Resources/app/utilsApp.robot
Resource  ../Resources/app/homepageApp.robot
Test Setup  utilsApp.create session
Test Teardown  utilsApp.close session

*** Test Cases ***
Deneme
    homepageApp.go to homepage
    homepageApp.click sign in button
    utilsApp.debugger
