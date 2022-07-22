*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${addBtn}           id = add-btn
${noPrefBtn}        id = gq-no-btn
${productAddedTxt}  has been added
*** Keywords ***
Validate Product Selector Page Load
  Wait Until Element Is Visible  ${addBtn}

Add Meal Plan 
  Click Button                      ${addBtn}
  Wait Until Element Is Visible     ${noPrefBtn}
  #wait for grey mask to fully disappear
  Sleep                             1s
  Click Button                      ${noPrefBtn}
  Wait Until Page Does Not Contain  ${productAddedTxt}
