*** Settings ***
Resource            ../../../WEB-New/Resources/Settings.robot

*** Variables ***
${newUserSignInEmail}       id = fb-email
${newUserSignInPassword}    id = fb-password
${SignInBtn}                id = fb-submit-button
${forgotPasswordLink}       id = fb-forgot-password
${createAccountLink}        id = fb=create-account-link
${signInWithFacebookBtn}    id = fb-facebook
${signInWithGoogleBtn}      id = fb-google
${signInWithAppleBtn}       id = fb-apple

*** Keywords ***
Click Forgot Password Link
    Click Link  ${forgotPasswordLink}

Click Sign In Button
Click Create Account Link
Click Sign In with Facebook Button
Click Sign In with Google Button
Click Sign In with Apple Button

