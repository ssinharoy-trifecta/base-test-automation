*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${myAccountWelcomeText}  Trifecta Cash
${skipWeeksModalBtn}     id = ts-sw-open-btn
${skipWeek2Btn}          id = wcts-2-skip-button
${skipWeek3Btn}          id = wcts-3-skip-button
${skipWeek4Btn}          id = wcts-4-skip-button
${closeSkipModalBtn}     xpath = //*[@id="wcts_skip_content"]/button
${unskipWeek2Btn}        id = wcts-2-unskip-button
${unskipWeek3Btn}        id = wcts-3-unskip-button
${unskipWeek4Btn}        id = wcts-4-unskip-button

@{skipWeeksList}
...                      ${skipWeek2Btn}
...                      ${skipWeek3Btn}
...                      ${skipWeek4Btn}
...                      ${closeSkipModalBtn}
@{unskipWeeksList}
...                      ${unskipWeek2Btn}
...                      ${unskipWeek3Btn}
...                      ${unskipWeek4Btn}
...                      ${closeSkipModalBtn}

*** Keywords ***
Validate My Account Loaded
  Wait Until Element Is Visible  ${skipWeeksModalBtn}  

Open Skip Weeks Modal
  Log                            Opening Skip Modal...
  Click Button                   ${skipWeeksModalBtn}

Click All Skip Buttons In Skip Modal
  Wait Until Element Is Visible  ${skipWeek2Btn}
  FOR                            ${item}    IN    @{skipWeeksList}
    Click Button                 ${item}
    Sleep                        1s
  END  

Validate All Weeks Are Skipped
  Open Skip Weeks Modal
  FOR                              ${item}    IN    @{unskipWeeksList}
    Wait Until Element Is Visible  ${item}
  END  
