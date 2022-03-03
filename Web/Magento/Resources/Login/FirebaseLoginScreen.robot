*** Settings ***
Library  SeleniumLibrary
Library  BuiltIn
Library  DateTime

*** Variables ***
# These are the environment variable values. The default will use QA1
${ENV}                              qa1
&{ENVIRONMENT}	                    qa1=qa1	 qa2=qa2  qa3=qa3  uat1=uat1  uat2=uat2  uat3=uat3
# This builds out the various common launch points URLs
${MAGENTO_SHOP_HOME}                https://test-magento-app-trifecta-${ENVIRONMENT.${ENV}}.trifecta.dev/
${MAGENTO_ADMIN}                    ${MAGENTO_SHOP_HOME}/admin
${MAGENTO_SHOP_CREATE_USER}         ${MAGENTO_SHOP_HOME}/customer/account/create/
${MAGENTO_SHOP_LOGIN}               ${MAGENTO_SHOP_HOME}/customer/account/login/
${BaseURL}  https://woocommerce-fhabtezion-1.trifecta.dev
${LoginURL}  ${BaseURL}/firebase-login/
${SignupURL}  ${BaseURL}/firebase-signup/
${CurrentDate}
${EMAIL}

# Common Assets
${LoginUsernameField}  xpath://*[@id="fb-email"]
${LoginPassword}  xpath://*[@id="fb-password"]
${HideShowPasswordButton}  xpath://*[@id="toggle-password"]
${NewOrExistingUserLabel}  xpath://*[@id="content-block"]/div[6]/div/div/div/div/div/p
${CreateAccountOrSignInLink}  ${NewOrExistingUserLabel}/a
${FacebookSignInButton}  xpath://*[@id="fb-facebook"]
${GoogleSignInButton}  xpath://*[@id="fb-google"]
${AppleSignInButton}  xpath://*[@id="fb-apple"]

# Login Assets
${ForgotPasswordLink}  xpath://*[@id="fb-login"]/p[2]/a
${LogInButton}  xpath://*[@id="fb-submit-button"]
${InvalidLoginEmailMessage}  xpath://*[@id="fb-login"]/div[1]/div[2]
${InvalidSignUpEmailMessage}  xpath://*[@id="fb-signup"]/div[1]/div[2]
${InvalidLoginPasswordMessage}  xpath://*[@id="fb-login"]/div[2]/div[3]
${InvalidSignUpPasswordMessage}  xpath://*[@id="fb-signup"]/div[2]/div[3]
${NewUserErrorMessages}  xpath://*[@id="fb-error-message"]

# Sign Up Assets
${SigningUpAgreementLabel}  xpath://*[@id="fb-signup"]/p[2]
${PrivacyPolicyLink}  ${SigningUpAgreementLabel}/a
${SignUpButton}  xpath://*[@id="fb-signup-button"]

# Forgotten Password Screens

*** Keywords ***
# Click Things
Click LogInButton
    Click Element  ${LogInButton}

Click SignUpButton
    Click Element  ${SignUpButton}

Click FacebookSignInButton
    Click Element  ${FacebookSignInButton}

Click GoogleSignInButton
    Click Element  ${GoogleSignInButton}

Click AppleSignInButton
    Click Element  ${AppleSignInButton}

Click HideShowPasswordButton
    Click Element  ${HideShowPasswordButton}

Click CreateAccountOrSignInLink
    Click Element  ${CreateAccountOrSignInLink}

Click ForgotPasswordLink
    Click Element  ${ForgotPasswordLink}

Click PrivacyPolicyLink
    Click Element  ${xpath://*PrivacyPolicyLink}

# Load URLs
Navigate To Login
    Go To  ${MAGENTO_SHOP_LOGIN}
    Wait Until Element Is Visible  ${LogInButton}

Navigate To Sign Up
    Go To  ${MAGENTO_SHOP_CREATE_USER}
    Wait Until Element Is Visible  ${SignUpButton}

# Validations
Validate InvalidLoginEmailMessage
    Element Text Should Be  ${InvalidLoginEmailMessage}  Please enter a valid email address

Validate InvalidSignUpEmailMessage
    Element Text Should Be  ${InvalidSignUpEmailMessage}  Please enter a valid email address

Validate InvalidLoginPasswordMessage
    Element Text Should Be  ${InvalidLoginPasswordMessage}  Please enter a password

Validate InvalidSignUpPasswordMessage
    Element Text Should Be  ${InvalidSignUpPasswordMessage}  Please enter a password

Validate Email Already Exists Message
    Element Text Should Be  ${NewUserErrorMessages}  This email already has an associated account.

Validate Account Not Created Message
    Element Text Should Be  ${NewUserErrorMessages}  There was an error, your account was not created. Please try again.

Validate Bad EMail or Password Message
    Element Text Should Be  ${NewUserErrorMessages}  You have entered an invalid email or password.

# Functions
Create New Email Address
    ${CurrentDate}=  Get Current Date  result_format=%m-%d-%y.%H.%M.%S.%s
    ${EMAIL}  Set Variable  selenium+${CurrentDate}\@trifectanutrition.com
    # Log to Console  ${EMAIL}
    Return From Keyword  ${EMAIL}

UsernamePassword Sign Up
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  5s
    Click Element  ${LoginUsernameField}
    ${CurrentDate}=  Get Current Date  result_format=%m-%d-%y.%H.%M.%S.%s
    ${EMAIL}  Set Variable  selenium+${CurrentDate}\@trifectanutrition.com
    Log to Console  ${EMAIL}
    Input Text  ${LoginUsernameField}  ${EMAIL}  clear = True
    Click Element  ${LoginPassword}
    Input Text  ${LoginPassword}  tester123  clear = True
    Sleep  1s
    Click SignUpButton