*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${addBtn}                        id = add-btn
${noPrefBtn}                     id = gq-no-btn
${productAddedTxt}               has been added
${catSelectorProteinTab}         xpath = //*[@id="ps-mobile-nav-ul"]/li[2]
${proteinInfoBtn}                id = protein-0-prod-title
${aLaCarteModalAddBtn}           xpath = //*[@id="psm-add-to-cart-entry"]/div[2]/div[2]/div/div[3]/button
${catSelectorCarbTab}            xpath = //*[@id="ps-desktop-nav-ul"]/li[3]
${carbInfoBtn}                   id = carbohydrates-0-prod-title
${changeTakeAffectNotification}  id = gq-yes-btn


*** Keywords ***
Validate Product Selector Page Load
  Wait Until Element Is Visible     ${addBtn}

Add Meal Plan 
  Click Button                      ${addBtn}
  Wait Until Element Is Visible     ${noPrefBtn}
  #wait for grey mask to fully disappear
  Sleep                             1s
  Click Button                      ${noPrefBtn}
  Wait Until Page Does Not Contain  ${productAddedTxt}

Add A La Carte Product
  [Arguments]                       ${categoryTab}  ${infoBtn}    ${quantity}
  #Wait Until Element Is Visible     ${categoryTab}                        
  Click Element                     ${categoryTab}
  Wait Until Element Is Visible     ${infoBtn}
  Click Element                     ${infoBtn}
  Repeat Keyword                    ${quantity}     Click Button  ${aLaCarteModalAddBtn}
  Click Button                      ${addBtn}

Agree To Changes Affect Delivery On Notification 
  Wait Until Element Is Visible  ${changeTakeAffectNotification}
  Click Button                   ${changeTakeAffectNotification}
