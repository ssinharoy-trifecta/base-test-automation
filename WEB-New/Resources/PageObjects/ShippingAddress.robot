*** Settings ***
Resource            ../../../WEB-New/Resources/Settings.robot

*** Variables ***
#Shipping Information Page Elements
${shippingFirstNameField}     id = shipping_first_name
${shippingLastNameField}      id = shipping_last_name
${shippingAddressField}       id = shipping_address_1
${shippingCityField}          id = shipping_city
${shippingZipField}           id = shipping_postcode
${shippingPhoneField}         id = billing_phone
${continueToBillingFormBtn}   id = proceed-to-step-4

*** Keywords ***
Complete Shipping Address Form
  Check If Second Sub Notification Appears
  Input Text                ${shippingFirstNameField}  ${customerInfo.firstName}
  Input Text                ${shippingLastNameField}   ${customerInfo.lastName}
  Input Text                ${shippingAddressField}    ${customerInfo.address1}
  Input Text                ${shippingCityField}       ${customerInfo.city}
  Input Text                ${shippingZipField}        ${customerInfo.zip}
  Input Text                ${shippingPhoneField}      ${customerInfo.phone}
  Check If Second Sub Notification Appears
  Click Button              ${continueToBillingFormBtn}