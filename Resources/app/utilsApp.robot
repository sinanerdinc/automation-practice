*** Settings ***
Resource  ../po/utils.robot

*** Keywords ***
create session
    utils.create session
    utils.maximize browser

close session
    utils.close session

debugger
    utils.debugger

generate test datas
    utils.generate fake email