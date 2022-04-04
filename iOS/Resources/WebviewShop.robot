*** Settings ***

Library    AppiumLibrary
Library    BuiltIn

*** Variables ***

${shopBtn}                  xpath=//XCUIElementTypeButton[@name="Shop"]
${shopCloseBtn}             xpath=//XCUIElementTypeButton[@name="ic sideMenu close"]
${shopBackBtn}              xpath=//XCUIElementTypeButton[@name="ic sideMenu back"]
${currentSubscriptionTxt}   xpath=//XCUIElementTypeOther[@name="Current Subscription"]
${nextDeliveryTxt}          xpath=//XCUIElementTypeStaticText[@name="Next Delivery"]
${faqTxt}                   xpath=//XCUIElementTypeStaticText[@name="Frequently Asked Questions"]
${subscriptionDetailsTxt}   xpath=//XCUIElementTypeStaticText[@name="Subscription Details"]
${modifyBtn}                xpath=//XCUIElementTypeButton[@name="Modify"]


*** Keywords ***
