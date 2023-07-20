*** Settings ***
Documentation    Test for nokia wiki finding
Library    SeleniumLibrary

*** Variables ***
${ENTER_KEY}    \ue007
${wikipedia_name}    a[contains(text(),'wikipedia.org')]
${BROWSER}    Firefox
${SEARCH_TERM}    nokia wikipedia

*** Test Cases ***
Test Nokia Wiki
    [Documentation]    Test case to open Nokia Wikipedia
    Open Browser And Go To Google
    Handle Google Cookies
    Search For A Term In Google
    In Google Search Result Find Wikipedia

*** Keywords ***
Open Browser And Go To Google
    [Documentation]    Open a browser and navigate to Google
    Create Webdriver    ${BROWSER}
    Set Selenium Speed    0.6
    Maximize Browser Window
    Go To    https://www.google.com/

Handle Google Cookies
    [Documentation]    Handle Google cookies window
    ${cookie_window_present}  Run Keyword And Return Status  Page Should Contain Element  id=W0wltc
    Run Keyword If    ${cookie_window_present}    Click Element    id=W0wltc

Search For A Term In Google
    [Documentation]    Search for a term in Google search box
    Input Text    name=q    ${SEARCH_TERM}
    Press Keys    name=q    ${ENTER_KEY}

In Google Search Result Find Wikipedia
    [Documentation]    Click on the first link that contains "wikipedia.org"
    Wait Until Page Contains    wikipedia.org
    Click Link    xpath://${wikipedia_name}[1]
    Wait For Condition    return document.readyState == "complete"