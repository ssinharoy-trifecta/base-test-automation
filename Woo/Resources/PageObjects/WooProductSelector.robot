*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${addBtn}                 id = add-btn
${noPrefBtn}              id = gq-no-btn
${productAddedTxt}        has been added
${catSelectorProteinTab}  xpath = //*[@id="ps-desktop-nav-ul"]/li[2]/a
${proteinInfoBtn}         id = protein-0-prod-title
${proteinModalAddBtn}     xpath = //*[@id="psm-add-to-cart-entry"]/div[2]/div[2]/div/div[3]/button

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
  Wait Until Element Is Visible     ${catSelectorProteinTab}                          
  Click Element                     ${catSelectorProteinTab}
  Wait Until Element Is Visible     ${proteinInfoBtn}
  Click Element                     ${proteinInfoBtn}
  Repeat Keyword                    5  Click Button  ${proteinModalAddBtn}
  Click Button                      ${addBtn}
