*** Settings ***
Documentation    Test for nokia wiki finding
Library    SeleniumLibrary


*** Variables ***
${ENTER_KEY}    \ue007
${wikipedia_name}  a[contains(text(),'wikipedia.org')
${BROWSER}  Firefox
${SEARCH_TERM}  nokia wikipedia


*** Test Cases ***
Test Nokia Wiki
    [Documentation]    opening nokia wiki

    Open Browser And Go To Google
    Handle Google Cookies
    Search For A Term In Google
    In Google Search Result Find Wikipedia
    Wait For The Page To Fully Load


*** Keywords ***
Open Browser And Go To Google
    Create Webdriver    ${BROWSER}
    Set Selenium Speed    0.6
    Maximize Browser Window
    Go To    https://www.google.com/

Handle Google Cookies
    # Check if the cookie window is present
    ${cookie_window_present}  Run Keyword And Return Status  Page Should Contain Element  id=W0wltc

    # Handle cookies window. Cancel cookies
    Run Keyword If  ${cookie_window_present}  Click Element  id=W0wltc

Search For A Term In Google
    Input Text  name=q  ${SEARCH_TERM}
    Press Keys  name=q    ${ENTER_KEY}

In Google Search Result Find Wikipedia
    Wait Until Page Contains    wikipedia.org
    # Click on the first link that contains "wikipedia.org"
    Click Link    xpath://a[contains(@href, 'wikipedia.org')][1]

Wait For The Page To Fully Load
    Wait For Condition	return document.readyState == "complete"