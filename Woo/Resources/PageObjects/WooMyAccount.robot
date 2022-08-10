*** Settings ***
Library         SeleniumLibrary

*** Variables ***
# Skip elements
${skipWeeksModalBtn}           id = ts-sw-open-btn
${skipWeek2Btn}                id = wcts-2-skip-button
${skipWeek3Btn}                id = wcts-3-skip-button
${skipWeek4Btn}                id = wcts-4-skip-button
${closeSkipModalBtn}           xpath = //*[@id="wcts_skip_content"]/button
${unskipWeek2Btn}              id = wcts-2-unskip-button
${unskipWeek3Btn}              id = wcts-3-unskip-button
${unskipWeek4Btn}              id = wcts-4-unskip-button
# Skip Lists
@{skipWeeksList}
...                            ${skipWeek2Btn}
...                            ${skipWeek3Btn}
...                            ${skipWeek4Btn}
...                            ${closeSkipModalBtn}
@{unskipWeeksList}
...                            ${unskipWeek2Btn}
...                            ${unskipWeek3Btn}
...                            ${unskipWeek4Btn}
...                            ${closeSkipModalBtn}

${modifySubBtn}                id = ts-ps-open-btn
${viewSubBtn}                  xpath = //*[@id="content-block"]/div[4]/div/div/div/div/div/div[2]/table/tbody/tr[1]/td[6]/a/button
# Update Payment Info elements
${editPaymentLink}             xpath = //*[@id="content-block"]/div[4]/div/div/div/div/div/div[2]/div[2]/div[3]/div[6]/a
${changePaymentSaveBtn}        id = place_order
${useNewCardRadio}             xpath = //*[@for="wc-authorize-net-cim-credit-card-use-new-payment-method"]
${newCardNumberField}          xpath = //*[@id="wc-authorize-net-cim-credit-card-account-number"]
${newCardExpField}             id = wc-authorize-net-cim-credit-card-expiry
${newCardCVCField}             xpath = //*[@id="wc-authorize-net-cim-credit-card-csc"]

${accountSettingsTab}          xpath = //*[@id="mya-scrolling-menu"]/div/ul/li[3]/a
# Change Billing Address elements
${changeBillingLink}           xpath = //*[@id="content-block"]/div[4]/div/div/div/div/div/div[2]/table/tbody/tr[4]/td[2]/a
${billingFirstNameField}       id = billing_first_name
${billingLastNameField}        id = billing_last_name
${billingStreetAddressField}   id = billing_address_1
${billingCityField}            id = billing_city 
${billingZipField}             id = billing_postcode
${billingPhoneField}           id = billing_phone
${updateAllBillingCheckbox}    xpath = //*[@id="update_all_subscriptions_addresses"]
${saveAddressBtn}              id = ts_edit_address
&{changeCustInfo}=             &{customerInfo2}
# Change Shipping Address Elements
${changeShippingLink}          xpath = //*[@id="content-block"]/div[4]/div/div/div/div/div/div[2]/div[2]/div[3]/div[2]/a
${shippingFirstNameField}      id = shipping_first_name
${shippingLastNameField}       id = shipping_last_name
${shippingStreetAddressField}  id = shipping_address_1
${shippingCityField}           id = shipping_city 
${shippingZipField}            id = shipping_postcode
${deliveryModalBtn}            xpath = //*[@id="ts-shipping-notification"]/div/div/div[3]/div/div/button

${backToSubscriptionsLink}     xpath = //*[@id="content-block"]/div[4]/div/div/div/div/div/a

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
  Log                            Opening Product Selector to modify subscription...
  Sleep                          1s
  Click Button                   ${modifySubBtn}

Validate Subscriptions Tab In My Account
  Wait Until Element Is Visible  ${viewSubBtn}

Edit Payment
  Click Element                  ${editPaymentLink}
  Wait Until Element Is Visible  ${changePaymentSaveBtn}
  Click Element                  ${useNewCardRadio}
  Wait Until Element Is Visible  ${newCardNumberField} 
  Input Text                     ${newCardNumberField}  ${cardNumber1.number} 
  Input Text                     ${newCardExpField}     ${cardNumber1.exp}
  Input Text                     ${newCardCVCField}     ${cardNumber1.cvv}
  Click Button                   ${changePaymentSaveBtn}

Click Account Settings Tab
  Click Element  ${accountSettingsTab}

Change Billing Address
  Wait For And Click Element     ${changeBillingLink}
  Wait Until Element Is Visible  ${billingFirstNameField}
  Input Text                     ${billingFirstNameField}      ${changeCustInfo.firstName}
  Input Text                     ${billingLastNameField}       ${changeCustInfo.lastName}
  Input Text                     ${billingStreetAddressField}  ${changeCustInfo.address1}
  Input Text                     ${billingCityField}           ${changeCustInfo.city}
  Input Text                     ${billingZipField}            ${changeCustInfo.zip}
  Input Text                     ${billingPhoneField}          ${changeCustInfo.phone}
  Click Element                  ${updateAllBillingCheckbox}
  Click Button                   ${saveAddressBtn}

Validate Account Settings Tab
  Wait Until Element Is Visible  ${changeBillingLink}

Change Shipping Address
  Click Element                  ${changeShippingLink}
  Wait For And Click Button      ${deliveryModalBtn}
  Sleep                          1s
  Input Text                     ${shippingFirstNameField}      ${changeCustInfo.firstName}
  Input Text                     ${shippingLastNameField}       ${changeCustInfo.lastName}
  Input Text                     ${shippingStreetAddressField}  ${changeCustInfo.address1}
  Input Text                     ${shippingCityField}           ${changeCustInfo.city}
  Input Text                     ${shippingZipField}            ${changeCustInfo.zip}
  Click Button                   ${saveAddressBtn}

Validate Customer Subscription View Load
  Wait Until Element Is Visible  ${backToSubscriptionsLink}
