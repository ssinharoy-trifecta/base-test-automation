*** Settings ***
Documentation   This will house all automated Shopping Experience Test Scenarios
Library         SeleniumLibrary
Resource        /Users/sreya.sinharoy/PycharmProjects/base-test-automation/WEB-New/Resources/PageObjects/WooTopNav.robot
Resource        /Users/sreya.sinharoy/PycharmProjects/base-test-automation/WEB-New/Resources/PageObjects/WooProductSelector.robot

*** Variables ***

*** Test Cases ***
#Scratch Tests to ensure Keywords within TopNav.robot file are working as expected
Test Top Nav Keywords
    Open Browser    https://woocommerce-trifecta-qa-3.trifecta.dev/     Chrome
    WooTopNav.Navigate to Meal Plans Product Selector Page
    WooTopNav.Navigate to Meal Prep Product Selector Page
    WooTopNav.Navigate to Classics Product Selector Page
    WooTopNav.Navigate to Snacks Product Selector Page
    WooTopNav.Navigate to Gift Cards Product Selector Page
    WooTopNav.Open Shopping Cart
    WooTopNav.Go To My Account

#Scratch Tests to ensure Keywords within ProductSelector.robot file are working as expected
Test Product Selector Keywords
    [Tags]  TestPS
    Open Browser    https://woocommerce-trifecta-qa-3.trifecta.dev/     Chrome
    WooTopNav.Navigate to Meal Plans Product Selector Page
    WooProductSelector.Navigate to Paleo Meal Plan PDP




