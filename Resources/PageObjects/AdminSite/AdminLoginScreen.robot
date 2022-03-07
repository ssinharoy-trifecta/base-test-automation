*** Settings ***
Library                           SeleniumLibrary

*** Variables ***
${magentoAdmin}                   ${MAGENTO_SHOP_HOME}/admin
${adminUsernameField}             xpath://*[@id="username"]
${adminPasswordField}             xpath://*[@id="login"]
${adminSignInButton}              xpath://*[@id="login-form"]/fieldset/div[3]/div[1]/button
${adminForgotPasswordLink}        xpath://*[@id="login-form"]/fieldset/div[3]/div[2]/a

***Keywords***
Navigate to Magento Admin
  Go To                           ${magentoAdmin}
  Wait Until Element Is Visible   ${adminUsernameField}