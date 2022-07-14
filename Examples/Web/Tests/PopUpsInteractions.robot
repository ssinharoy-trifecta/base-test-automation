*** Settings ***
Documentation
...  This file provides examples on how to interact with popup windows from social providers.
...  Additional Documentation can be found:
...  https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Switch Browser
...  https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Switch Window
...  https://forum.robotframework.org/t/switch-browser-it-works-but-not-visible-at-screen/2180
...  Video demo: https://www.youtube.com/watch?v=D0LOql-_3-s
...  example cli command: robot -v runLocal:yes -d results Examples/Web/Tests/PopUpsInteractions.robot

*** Settings ***
Library            SeleniumLibrary
Resource           ../../Common/Resources/Common.robot

Suite Setup         Common.Begin Suite Test
Suite Teardown      Common.End Suite Test   ${testRunID}
Test Setup          Common.Begin Browser Test  
...                 https://woocommerce-trifecta-qa-1.trifecta.dev/sign-up
...                 ${runlocal}
...                 ${configBS}
Test Teardown       Common.End Browser Test

*** Variables ***
${facebookSignUpBtn}   id = fb-facebook
${googleSignUpBtn}     id = fb-google
${appleSignUpBtn}      id = fb-apple
${facebookEmailField}  id = email
${googleEmailField}    id = identifierId
${appleEmailField}     id = account_name_text_field
${popUpTestEmail}=     Naraka@trifecta.com

*** Test Cases ***
Test Facebook Popups
  Interact With Social Login Popups  ${facebookSignUpBtn}  ${facebookEmailField}

Test Google Popups
  Interact With Social Login Popups  ${googleSignUpBtn}    ${googleEmailField}

Test Apple Popups
  Interact With Social Login Popups  ${appleSignUpBtn}     ${appleEmailField}

*** Keywords ***
Interact With Social Login Popups
  [Arguments]
  ...                       ${socialSignUpBtn}
  ...                       ${socialPopUpEmailField}
  Click Button              ${socialSignUpBtn}
  Sleep                     5s
  #The following 4 lists can be used to identify the open windows to be interacted with.
  @{WindowHandles}=         Get Window Handles
  #@{WindowNames}=           Get Window Names
  #@{WindowTitle}=           Get Window Titles
  #WindowIdentifier wasn't working the same as the others, but between Handles, Names, and Titles, we should be able to deal with popups effectively.
  #@{WindowIdentifier}=      Get Window Identifiers
  Switch Window             ${WindowHandles}[1]
  Input Text                ${socialPopUpEmailField}            ${popUpTestEmail}
  Sleep                     5s

