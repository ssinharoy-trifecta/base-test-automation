*** Settings ***
Resource            ../../../WEB-New/Resources/Settings.robot

*** Variables ***
${mealPlansTopNavLink}  Meal Plans
${mealPrepTopNavLink}   Meal Prep
${classicsTopNavLink}   Classics
${snacksTopNavLink}     Snacks
${giftcardsTopNavLink}  Gift Cards
${cartTopNavIcon}       xpath = //*[@id="trifecta-header"]/div[1]/div[2]/div/div[2]/a[1]/img   #Need to insert ids for these
${myAccountIcon}        xpath = //*[@id="trifecta-header"]/div[1]/div[2]/div/a[1]/img           #Need to insert ids for these

*** Keywords ***
Navigate to Meal Plans Product Selector Page
    Click Link    ${mealPlansTopNavLink}
    
Navigate to Meal Prep Product Selector Page
    Click Link    ${mealPrepTopNavLink}
    
Navigate to Classics Product Selector Page
    Click Link    ${classicsTopNavLink}
    
Navigate to Snacks Product Selector Page
    Click Link    ${snacksTopNavLink}
    
Navigate to Gift Cards Product Selector Page
    Click Link    ${giftcardsTopNavLink}
    
Open Shopping Cart by clicking on Shopping Cart icon
    Click Element    ${cartTopNavIcon}
    
Go To My Account
    Click Element    ${myAccountIcon}
