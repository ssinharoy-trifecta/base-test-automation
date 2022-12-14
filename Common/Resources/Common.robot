*** Settings ***
Documentation
...   Common Keywords and Variables to be used across all Features
Library                         SeleniumLibrary
Variables                       GetEnvVars.py
Resource                        Integrations/Browserstack.robot
Resource                        Integrations/TestRail.robot

*** Variables ***
# This allows you to submit which browser you want to leverage, but the default is Chrome
${BROWSER}                      chrome
# These are the environment variable values. The default will use QA1
${WOO_ENV}                      qa-3
${MAG_ENV}                      qa1
# This builds out the various common launch points URLs
${MAGENTO_SHOP_HOME}            https://test-magento-app-trifecta-${MAG_ENV}.trifecta.dev/
${WOOCOMMERCE_SHOP_HOME}        https://woocommerce-trifecta-${WOO_ENV}.trifecta.dev/
${TEST_URL}                     ${WOOCOMMERCE_SHOP_HOME}
# This aids in generating dynamic eMail addresses for user creation
${urlForNavigation}             about:blank
# Hubspot url parameters to add products from HS domain to Woo shop.
${hsBundleParams}               ${WOOCOMMERCE_SHOP_HOME}?bundle_data=%7B%22bundleName%22%3A%22budget_bundle%22%2C%22bundleData%22%3A%5B%7B%22sku%22%3A%22BP1302%22%2C%22qty%22%3A2%7D%2C%7B%22sku%22%3A%22BP1305%22%2C%22qty%22%3A2%7D%2C%7B%22sku%22%3A%22BP1304%22%2C%22qty%22%3A2%7D%2C%7B%22sku%22%3A%22BC1618%22%2C%22qty%22%3A2%7D%2C%7B%22sku%22%3A%22BC1628%22%2C%22qty%22%3A2%7D%5D%7D
${hsMealPlanParams}             ${WOOCOMMERCE_SHOP_HOME}checkout/?hs_add_var_id=243704&parent_id=765&meal_preferences=FS,WF
# This keyword is to run locally or through Browserstack. Browserstack is default
${runLocal}                     no
# Screen size variables
${windowWidth}                  1500
${windowHeight}                 1100
&{windowSize}
...                             width=${windowWidth}
...                             height=${windowHeight}
${envPath}                      ${PATH_TO_ENV}
@{TESTRUN_RESULTS_LIST}

*** Keywords ***
Begin Browser Test
  [Arguments]                                     ${urlForNavigation}       
  ...                                             ${runLocal}
  ...                                             ${configBS}
  ...                                             ${envPath}
  Log                                             Browser Test is starting!
  IF                                              '${runLocal}' == 'no'
    Browserstack.Setup Browserstack For WEB       ${urlForNavigation}      
    ...                                           ${configBS}      
    ...                                           ${envPath}
  ELSE       
    Open Browser                                  ${urlForNavigation}       ${BROWSER}
  END
  Begin Maximize Browser Test

End Browser Test
  TestRail.Gather Test Results
  Close All Browsers

Begin Suite Test
  Set Global Variable   @{TESTRUN_RESULTS_LIST}

End Suite Test
  [Arguments]           ${testRunID}    ${envPath}
  ${returnedResponse}=  TestRail.Post Test Suite Results to TestRail    ${testRunID}    ${envPath}
  Log                   '${returnedResponse}'

Begin Maximize Browser Test
  Log                           Browser Test is starting at maximum size!
  Set Window Size               ${windowSize.width}  ${windowSize.height}

Scroll To Element
  Documentation  
  ...   This function addresses a MoveTargetOutOfBoundsException that occurs in Firefox when using 
  ...   the `Scroll Element Into View` keyword.  Please reference WEB-4456
  [Arguments]                   ${locator}
  ${x}=                         Get Horizontal Position   ${locator}
  ${y}=                         Get Vertical Position     ${locator}
  Execute Javascript            window.scrollTo(${x}, ${y})

Wait For And Click Element
  [Arguments]                    ${element}
  Wait Until Element Is Visible  ${element}
  Click Element                  ${element}

Wait For And Click Button
  [Arguments]                    ${button}
  Wait Until Element Is Visible  ${button}
  Click Button                   ${button}
