*** Settings ***
Library         SeleniumLibrary

*** Variables ***
# Skip elements
${skipWeeksModalBtn}          id = ts-sw-open-btn
${skipWeek2Btn}               id = wcts-2-skip-button
${skipWeek3Btn}               id = wcts-3-skip-button
${skipWeek4Btn}               id = wcts-4-skip-button
${closeSkipModalBtn}          xpath = //*[@id="wcts_skip_content"]/button
${unskipWeek2Btn}             id = wcts-2-unskip-button
${unskipWeek3Btn}             id = wcts-3-unskip-button
${unskipWeek4Btn}             id = wcts-4-unskip-button
# Skip Lists
@{skipWeeksList}
...                           ${skipWeek2Btn}
...                           ${skipWeek3Btn}
...                           ${skipWeek4Btn}
...                           ${closeSkipModalBtn}
@{unskipWeeksList}
...                           ${unskipWeek2Btn}
...                           ${unskipWeek3Btn}
...                           ${unskipWeek4Btn}
...                           ${closeSkipModalBtn}

${modifySubBtn}               id = ts-ps-open-btn
${viewSubBtn}                 xpath = //*[@id="content-block"]/div[4]/div/div/div/div/div/div[2]/table/tbody/tr[1]/td[6]/a/button

# Update Payment Info elements
${editPaymentLink}            xpath = //*[@id="content-block"]/div[4]/div/div/div/div/div/div[2]/div[2]/div[3]/div[6]/a
${changePaymentSaveBtn}       id = place_order
${useNewCardRadio}            xpath = //*[@id="payment"]/ul/li/div/p[3]/label[2]
${newCardNumberField}         xpath = //*[@id="wc-authorize-net-cim-credit-card-account-number"]
${newCardNumberValue}         4111111111111111
${newCardExpField}            id = wc-authorize-net-cim-credit-card-expiry
${newCardExpValue}            0123
${newCardCVCField}            xpath = //*[@id="wc-authorize-net-cim-credit-card-csc"]
${newCardCVCValue}            900

${accountSettingsTab}         Account Settings

# Change Billing Address elements
${changeBillingLink}          xpath = //*[@id="content-block"]/div[4]/div/div/div/div/div/div[2]/table/tbody/tr[4]/td[2]/a
${billingFirstNameField}      id = billing_first_name
${billingLastNameField}       id = billing_last_name
${billingStreetAddressField}  id = billing_address_1
${billingCityField}           id = billing_city 
${billingZipField}            id = billing_postcode
${billingPhoneField}          id = billing_phone
${updateAllBillingCheckbox}   xpath = //*[@id="update_all_subscriptions_addresses"]
${saveBillingAddressBtn}      id = ts_edit_address 
# TODO setup a second customer dictionary to pull data from.
# TODO Add steps in keywords
# Add Keywords to Test

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

Click Modify Button
  Log                            Opening Skip Modal...
  Click Button                   ${modifySubBtn}

Validate Subscriptions Tab In My Account
  Wait Until Element Is Visible  ${viewSubBtn}

Edit Payment
  Click Element                  ${editPaymentLink}
  Wait Until Element Is Visible  ${changePaymentSaveBtn}
  Click Element                  ${useNewCardRadio}
  Wait Until Element Is Visible  ${newCardNumberField} 
  Input Text                     ${newCardNumberField}  ${newCardNumberValue} 
  Input Text                     ${newCardExpField}     ${newCardExpValue}
  Input Text                     ${newCardCVCField}     ${newCardCVCValue}
  Click Button                   ${changePaymentSaveBtn}

Click Account Settings Tab
  Click Element  ${accountSettingsTab}

Change Billing Address
  Click Element  ${changeBillingLink}
  Wait Until Element Is Visible

