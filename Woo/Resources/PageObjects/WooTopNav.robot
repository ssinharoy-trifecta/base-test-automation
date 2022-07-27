*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${cartTopNavBtn}        xpath = //*[@id="trifecta-header"]/div/div/div[2]/div/a[2]/img
${cartTopNavMobileBtn}  xpath = //*[@id="trifecta-header"]/div/div/div[2]/div/a[2]/img
${accountTopNavBtn}     xpath = //*[@id="trifecta-header"]/div/div/div[2]/div/a[1]/img

*** Keywords ***
Navigate To Product Selector
  Sleep          2s
  Log            Going to Product Selector from header button...
  Click Element  ${cartTopNavBtn}

Click Header Account Element
  Wait Until Element Is Visible  ${accountTopNavBtn}
  Click Element                  ${accountTopNavBtn}
