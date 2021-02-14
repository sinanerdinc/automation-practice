*** Settings ***
Library  SeleniumLibrary
Library  DebugLibrary

*** Variables ***
${browser}  chrome
${TIMEOUT}  20 seconds
${MAX_TRY}  3

*** Keywords ***
create session
    open browser  about:blank  ${browser}
    Set Selenium Timeout  ${TIMEOUT}

maximize browser
    maximize browser window

close session
    close all browsers

debugger
    debug

go
    [Arguments]  ${url}
    go to  ${url}

click
    [Arguments]  ${SELECTOR}
    FOR	 ${i}  IN RANGE  1  ${MAX_TRY}
        Wait Until Page Contains Element  ${SELECTOR}  ${TIMEOUT}
        Wait Until Element Is Enabled  ${SELECTOR}  ${TIMEOUT}
        ${click_status} =  Run Keyword And Return Status  click element  ${SELECTOR}
        Exit For Loop If  '${click_status}' == 'True'
        Sleep  ${i}  wait for a click
    END

input
    [Arguments]  ${selector}  ${text}
    FOR	 ${i}  IN RANGE  1  ${MAX_TRY}
        Wait Until Page Contains Element  ${selector}  ${TIMEOUT}
        ${input_status} =  Run Keyword And Return Status  input text  ${selector}  ${text}
        Exit For Loop If  '${input_status}' == 'True'
        Sleep  ${i}  wait for a input
    END

select by label
    [Arguments]  ${selector}  ${text}
    FOR	 ${i}  IN RANGE  1  ${MAX_TRY}
        wait until page contains element  ${selector}
        ${input_status} =  Run Keyword And Return Status  Select From List By Label  ${selector}  ${text}
        Exit For Loop If  '${input_status}' == 'True'
        Sleep  ${i}  wait for a input
    END


find text
    [Arguments]  ${selector}
    FOR	 ${i}  IN RANGE  1  ${MAX_TRY}
        Wait Until Page Contains Element  ${selector}  ${TIMEOUT}
        Wait Until Element Is Enabled  ${selector}  ${TIMEOUT}
        ${result} =  get text  ${selector}
        ${not_empty} =  Run Keyword And Return Status  Should Not Be Empty  ${result}
        Exit For Loop If  '${not_empty}' == 'True'
        Sleep  ${i}  wait for a text
    END
    [Return]  ${result}

get element attribute
    [Arguments]  ${selector}  ${attrs}
    Wait Until Page Contains Element  ${selector}  ${TIMEOUT}
    ${result} =  Get Element Attribute  ${selector}  ${attrs}
    [Return]  ${result}