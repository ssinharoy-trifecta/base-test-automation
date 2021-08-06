*** Settings ***
Library	SeleniumLibrary

*** Variables ***
${Login URL}	https://woocommerce-trifecta-qa-3.trifecta.dev/
${Browser}		Chrome
${username}     selenium+08-03-21.13.15.37.1628021737@trifectanutrition.com
${password}     tester123

*** Test Cases ***
Valid Login
    Open Browser To Shop Home Page
    Click Account Icon
    Input Username
    Input Password
    Submit Credentials
    Click Logout
    Close All Browsers

*** Keywords ***
Open Browser To Shop Home Page
    Open Browser    ${Login URL}    ${BROWSER}
    Title Should Be    Home -Trifecta Nutrition Organic Meal Delivery

Click Account Icon
    Click Element   id:Account
    Title Should Be     Trifecta Authentication

Input Username
    Wait Until Element Is Visible   name:username
    Input Text    name:username    clear:True
    Input Text    name:username    ${username}

Input Password
    Input Text    password    clear:True
    Input Text    password    ${password}

Submit Credentials
    Click Element    id:tf-action-btn
    Wait Until Element Is Visible   id:first-menu
    Title Should Be    My Account - Trifecta Nutrition
    Element Should Be Visible   link=Dashboard
    Element Should Be Visible   link=Account Settings
    Element Should Be Visible   link=Refer Friends
    Element Should Be Visible   link=Logout


Click Logout
    Click Element   id:tf-logout-btn