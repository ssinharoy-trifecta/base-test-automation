*** Settings ***
Documentation
...   Common Keywords and Variables to be used across all Features
Library                         SeleniumLibrary
Resource                        ../../Resources/PageObjects/CustomerCreate.robot

*** Variables ***
# This allows you to submit which browser you want to leverage, but the default is Chrome
${BROWSER}                      chrome
# These are the environment variable values. The default will use QA1
${ENV}                          qa1
# This builds out the various common launch points URLs
${MAGENTO_SHOP_HOME}            https://test-magento-app-trifecta-${ENV}.trifecta.dev/
# This aids in generating dynamic eMail addresses for user creation
${urlForNavigation}             about:blank

*** Keywords ***
Begin Browser Test
  [Arguments]                   ${urlForNavigation}
  Log                           "Browser Test is starting!"
  Open Browser                  ${urlForNavigation}       ${BROWSER}

End Browser Test
  Log                           "Browser Test is ending!"
  Close All Browsers

Begin Maximize Browser Test
  Log                           "Browser Test is starting at maximum size!"
  Set Window Size               2000                      1600

Scroll To Element
  Documentation	
  ...   This function addresses a MoveTargetOutOfBoundsException that occurs in Firefox when using 
  ...   the `Scroll Element Into View` keyword.  Please reference WEB-4456
  [Arguments]                   ${locator}
  ${x}=                         Get Horizontal Position   ${locator}
  ${y}=                         Get Vertical Position     ${locator}
  Execute Javascript            window.scrollTo(${x}, ${y})