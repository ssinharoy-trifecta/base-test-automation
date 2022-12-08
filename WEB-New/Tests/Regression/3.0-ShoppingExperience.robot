*** Settings ***
Documentation   This will house all automated Shopping Experience Test Scenarios
Library         SeleniumLibrary
Resource        /Users/sreya.sinharoy/PycharmProjects/base-test-automation/WEB-New/Resources/PageObjects/WooTopNav.robot

*** Variables ***

*** Test Cases ***
Customer can checkout with a Meal Plan
    [Documentation]     This is some basic info about test
    [Tags]              TestRailID  Regression  ShoppingExperience
    #Set window position
    #Set window size
    #Selenium Timer
    #Selenium Speed
    Open Browser    https://woocommerce-trifecta-qa-3.trifecta.dev/     Chrome

*** Test Cases ***