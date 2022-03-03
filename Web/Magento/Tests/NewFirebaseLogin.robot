*** Settings ***
Library  SeleniumLibrary
Library  BuiltIn
Resource  ../Resources/Login/FirebaseLoginScreen.robot
Resource  ../../Woo/Resources/Elements/UserAccount/DashboardTab.robot

Test Setup  Open Browser  about:blank  ${BROWSER}
Test Teardown   Close All Browsers

*** Variables ***
${BROWSER}  chrome  #options=add_argument("--incognito")


*** Test Cases ***
Sign Up With Username and Password
    [Tags]  testrailid=6029
	FirebaseLoginScreen.Navigate to Login
	FirebaseLoginScreen.Click CreateAccountOrSignInLink
	FirebaseLoginScreen.UsernamePassword Sign Up
    Sleep  5s
	# Change this when this is fixed.  It should take you to the Dashboard
    Wait Until Element Is Visible  xpath://*[@id="content-block"]/div[6]/h1[1]
	Element Text Should Be  xpath://*[@id="content-block"]/div[6]/h1[1]  Meal Plan Delivery
    # Wait Until Element Is Visible  ${LogoutMenuLink}
    # DashboardTab.Validate Common UI Elements
    # DashboardTab.Navigate to Logout

Sign Up With Invalid Usernames and Passwords
    [Tags]  testrailid=6027
    # Test no eMail address error
	FirebaseLoginScreen.Navigate to Sign Up
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginPassword}  tester123  clear = True
    Click SignUpButton
    Sleep  1s
    FirebaseLoginScreen.Validate InvalidSignUpEmailMessage
    # Refresh and test username only error
	FirebaseLoginScreen.Navigate to Sign Up
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginUsernameField}  test  clear = True
    Input Text  ${LoginPassword}  tester123  clear = True
    Click SignUpButton
    Sleep  1s
    FirebaseLoginScreen.Validate InvalidSignUpEmailMessage
    # Validate all special characters for an eMail address
    FirebaseLoginScreen.Navigate to Sign Up
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginUsernameField}  `~!@#$%^&*()_+=-{}|\][:"';<>?/.,  clear = True
    Input Text  ${LoginPassword}  tester123  clear = True
    Click SignUpButton
    Sleep  1s
    FirebaseLoginScreen.Validate InvalidSignUpEmailMessage
    # Refresh and test partial eMail with`test@test`
	FirebaseLoginScreen.Navigate to Sign Up
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginUsernameField}  test@test  clear = True
    Input Text  ${LoginPassword}  tester123  clear = True
    Click SignUpButton
    Sleep  1s
    FirebaseLoginScreen.Validate Account Not Created Message
    # Refresh and test partial eMail with`test@test.c`
	FirebaseLoginScreen.Navigate to Sign Up
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginUsernameField}  test@test.c  clear = True
    Input Text  ${LoginPassword}  tester123  clear = True
    Click SignUpButton
    Sleep  1s
    FirebaseLoginScreen.Validate Account Not Created Message
    # Validate no characters for Password fail to create a password
	FirebaseLoginScreen.Navigate to Sign Up
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginUsernameField}  scott.ozawa+test1@trifectanutrition.com  clear = True
    Click Element  ${LoginPassword}
    Click SignUpButton
    Sleep  1s
    FirebaseLoginScreen.Validate InvalidSignUpPasswordMessage
    # Validate 5 characters or less for Password fail to create a password
	FirebaseLoginScreen.Navigate to Sign Up
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginUsernameField}  scott.ozawa+test1@trifectanutrition.com  clear = True
    Input Text  ${LoginPassword}  12345  clear = True
    Click SignUpButton
    Sleep  1s
    FirebaseLoginScreen.Validate Account Not Created Message

Sign Up With Already Existing Account
    [Tags]  testrailid=6028
    # Validate Signing up with an already existing account
    FirebaseLoginScreen.Navigate to Sign Up
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginUsernameField}  scott.ozawa+test1@trifectanutrition.com  clear = True
    Input Text  ${LoginPassword}  tester321  clear = True
    Click SignUpButton
    Sleep  1s
    FirebaseLoginScreen.Validate Account Not Created Message

Log In With Username and Password
    [Tags]  testrailid=6009
    FirebaseLoginScreen.Navigate to Login
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginUsernameField}  scott.ozawa+test1@trifectanutrition.com  clear = True
    Click Element  ${LoginPassword}
    Input Text  ${LoginPassword}  tester321  clear = True
    Click Element  ${LogInButton}
    Sleep  5s
    # Change this when this is fixed.  It should take you to the Dashboard
    Wait Until Element Is Visible  xpath://*[@id="content-block"]/div[6]/h1[1]
    Element Text Should Be  xpath://*[@id="content-block"]/div[6]/h1[1]  Meal Plan Delivery
    # Wait Until Element Is Visible  ${LogoutMenuLink}
    # DashboardTab.Validate Common UI Elements
    # DashboardTab.Navigate to Logout

Log In With Invalid eMail Address or Password
    [Tags]  testrailid=6010
    #  Validate Bad Email, Good Password
    FirebaseLoginScreen.Navigate to Login
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginUsernameField}  `~!@#$%^&*()_+=-{}|\][:"';<>?/.,  clear = True
    Input Text  ${LoginPassword}  tester123  clear = True
    Click LogInButton
    FirebaseLoginScreen.Validate InvalidLoginEmailMessage
    # Refresh and Validate Good Email, Bad Password
    FirebaseLoginScreen.Navigate to Login
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginUsernameField}  scott.ozawa+test1@trifectanutrition.com  clear = True
    Input Text  ${LoginPassword}  tester123!  clear = True
    Click LogInButton
    FirebaseLoginScreen.Validate InvalidLoginEmailMessage
    # Refresh and Test no eMail address error
    FirebaseLoginScreen.Navigate to Login
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginPassword}  tester123  clear = True
    Click LogInButton
    FirebaseLoginScreen.Validate InvalidLoginEmailMessage
    # Refresh and Test Username Email Part only error
    FirebaseLoginScreen.Navigate to Login
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginUsernameField}  test  clear = True
    Input Text  ${LoginPassword}  tester123  clear = True
    Click LogInButton
    FirebaseLoginScreen.Validate InvalidLoginEmailMessage
    # Refresh and Validate Partial Email with`test@test`
    FirebaseLoginScreen.Navigate to Login
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginUsernameField}  test@test  clear = True
    Input Text  ${LoginPassword}  tester123  clear = True
    Click LogInButton
    Sleep  1s
    FirebaseLoginScreen.Validate Bad EMail or Password Message
    # Refresh and Validate Partial Email with`test@test.c`
    FirebaseLoginScreen.Navigate to Login
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginUsernameField}  test@test.c  clear = True
    Input Text  ${LoginPassword}  tester123  clear = True
    Click LogInButton
    Sleep  1s
    FirebaseLoginScreen.Validate Bad EMail or Password Message
    # Validate no characters for Password fail to login
    FirebaseLoginScreen.Navigate to Login
    Wait Until Element Is Visible  ${LoginUsernameField}
    Sleep  1s
    Click Element  ${LoginUsernameField}
    Input Text  ${LoginUsernameField}  scott.ozawa+test1@trifectanutrition.com  clear = True
    Click Element  ${LoginPassword}
    Click LogInButton
    FirebaseLoginScreen.Validate InvalidLoginPasswordMessage

# Sign Up With Facebook
#     FirebaseLoginScreen.Navigate to Sign Up
#     FirebaseLoginScreen.Click FacebookSignInButton
#     # Record against pop up FB Login window
# Sign Up With Bad Facebook
#     FirebaseLoginScreen.Navigate to Sign Up
#     FirebaseLoginScreen.Click FacebookSignInButton
#     # Record against pop up FB Login window
# Sign Up With Google
#     FirebaseLoginScreen.Navigate to Sign Up
#     FirebaseLoginScreen.Click GoogleSignInButton
#     # Record against pop up Google Login window
# Sign Up With 2fa Google
#     FirebaseLoginScreen.Navigate to Sign Up
#     FirebaseLoginScreen.Click GoogleSignInButton
#     # Record against pop up Google Login window
# Sign Up With Bad Google
#     FirebaseLoginScreen.Navigate to Sign Up
#     FirebaseLoginScreen.Click GoogleSignInButton
#     # Record against pop up Google Login window
# Sign Up With Apple
#     FirebaseLoginScreen.Navigate to Sign Up
#     FirebaseLoginScreen.Click AppleSignInButton
#     # Record against pop up Apple Login window
# Sign Up With Obfuscated Apple
#     FirebaseLoginScreen.Navigate to Sign Up
#     FirebaseLoginScreen.Click AppleSignInButton
#     # Record against pop up Apple Login window
# Sign Up With Bad Apple
#     FirebaseLoginScreen.Navigate to Sign Up
#     FirebaseLoginScreen.Click AppleSignInButton
#     # Record against pop up Apple Login window



# Log In With Facebook
#     FirebaseLoginScreen.Navigate to Login
#     FirebaseLoginScreen.Click FacebookSignInButton
#     # Record against pop up FB Login window
# Log In With Bad Facebook
#     FirebaseLoginScreen.Navigate to Login
#     FirebaseLoginScreen.Click FacebookSignInButton
#     # Record against pop up FB Login window
# Log In With Google
#     FirebaseLoginScreen.Navigate to Login
#     FirebaseLoginScreen.Click GoogleSignInButton
#     # Record against pop up Google Login window
# Log In With 2fa Google
#     FirebaseLoginScreen.Navigate to Login
#     FirebaseLoginScreen.Click GoogleSignInButton
#     # Record against pop up Google Login window
# Log In With Bad Google
#     FirebaseLoginScreen.Navigate to Login
#     FirebaseLoginScreen.Click GoogleSignInButton
#     # Record against pop up Google Login window
# Log In With Apple
#     FirebaseLoginScreen.Navigate to Login
#     FirebaseLoginScreen.Click AppleSignInButton
#     # Record against pop up Apple Login window
# Log In With Obfuscated Apple
#     FirebaseLoginScreen.Navigate to Login
#     FirebaseLoginScreen.Click AppleSignInButton
#     # Record against pop up Apple Login window
# Log In With Bad Apple
#     FirebaseLoginScreen.Navigate to Login
#     FirebaseLoginScreen.Click AppleSignInButton
#     # Record against pop up Apple Login window

# Forgot Password
#     FirebaseLoginScreen.Navigate to Login
#     FirebaseLoginScreen.Click ForgotPasswordLink
#     # Record against Forgotten Password Screens
# Forgot Password Bad User
#     FirebaseLoginScreen.Navigate to Login
#     FirebaseLoginScreen.Click ForgotPasswordLink
#     # Record against Forgotten Password Screens
# Show Password
#     FirebaseLoginScreen.Navigate to Login
#     Wait Until Element Is Visible  ${LoginPassword}
#     Click Element  ${LoginPassword}
#     Input Text  ${LoginPassword}  tester123  clear = True
#     FirebaseLoginScreen.Click HideShowPasswordButton
#     #Validate text of the login field == tester123

*** Keywords ***
