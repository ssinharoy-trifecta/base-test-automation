*** Settings ***
Resource            ../../../Common/Resources/DataFiles/CustomerTestData.robot
Resource            ../../../Common/Resources/Authentication/CustomerCreate.robot

*** Variables ***
${billingEmailField}          id = billing_email
${accountPasswordField}       id = account_password
${accountPassword2Field}      id =account_password-2
${continueToShippingFormBtn}  id = proceed-to-step-3
${shippingFirstNameField}     id = shipping_first_name
${shippingLastNameField}      id = shipping_last_name
${shippingAddressField}       id = shipping_address_1
${shippingCityField}          id = shipping_city
${shippingZipField}           id = shipping_postcode
${shippingPhoneField}         id = billing_phone
${continueToBillingFormBtn}   id = proceed-to-step-4
${placeOrderBtn}              id = place_order
${activeSubModalAddBtn}       xpath = //*[@id="ts-duplicate-sub"]/div/div/div[3]/button

*** Keywords ***
Validate Checkout Step 2 Page Load
  Wait Until Element Is Visible  ${billingEmailField}

Complete Create Your Account Form
  ${customerInfo.email} =   CustomerCreate.Generate New eMail Address
  Input Text                ${billingEmailField}      ${customerInfo.email}
  Input Text                ${accountPasswordField}   ${customerInfo.password}
  Input Text                ${accountPassword2Field}  ${customerInfo.password}
  Click Button              ${continueToShippingFormBtn}

Complete Shipping Address Form
  Input Text                ${shippingFirstNameField}  ${customerInfo.firstName}
  Input Text                ${shippingLastNameField}   ${customerInfo.lastName}
  Input Text                ${shippingAddressField}    ${customerInfo.address1}
  Input Text                ${shippingCityField}       ${customerInfo.city}
  Input Text                ${shippingZipField}        ${customerInfo.zip}
  Input Text                ${shippingPhoneField}      ${customerInfo.phone}
  Click Button              ${continueToBillingFormBtn}

Place Order 
  Click Button              ${placeOrderBtn}

Confirm Adding A Second Subscription
  Wait Until Element Is Visible  ${activeSubModalAddBtn}
  Click Button                   ${activeSubModalAddBtn}
  Sleep                          1s
