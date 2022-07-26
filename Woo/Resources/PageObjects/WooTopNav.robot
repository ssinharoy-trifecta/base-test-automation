*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${cartTopNavBtn}        xpath = //*[@id="trifecta-header"]/div/div/div[2]/div/a[2]/img
${cartTopNavMobileBtn}  xpath = //*[@id="trifecta-header"]/div/div/div[2]/div/a[2]/img

*** Keywords ***
Navigate To Product Selector
  Sleep          2s
  Log            Going to Product Selector from header button...
  Click Element  ${cartTopNavBtn}
