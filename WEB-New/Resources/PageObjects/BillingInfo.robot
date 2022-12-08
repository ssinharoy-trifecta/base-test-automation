*** Settings ***
Resource            ../../../WEB-New/Resources/Settings.robot

*** Variables ***
${billingEmailField}          id = billing_email
${accountPasswordField}       id = account_password
${accountPassword2Field}      id = account_password-2
${placeOrderBtn}              id = place_order

Complete Create Your Account Form
  ${customerInfo.email} =   CustomerCreate.Generate New eMail Address
  Input Text                ${billingEmailField}      ${customerInfo.email}
  Input Text                ${accountPasswordField}   ${customerInfo.password}
  Input Text                ${accountPassword2Field}  ${customerInfo.password}
  Click Button              ${continueToShippingFormBtn}

Click Place Order Button
  Check If Second Sub Notification Appears
  Click Button              ${placeOrderBtn}

Confirm Adding A Second Subscription
  Wait For And Click Element     ${activeSubModalAddBtn}

Check If Second Sub Notification Appears
  ${present}=     Run Keyword And Return Status  Element Should Be Visible  ${activeSubModalAddBtn}
  Run Keyword If  '${present}' == 'True'         Click Element              ${activeSubModalAddBtn}
  Sleep           1s