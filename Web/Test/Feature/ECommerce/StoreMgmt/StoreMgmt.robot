*** Settings ***
Documentation   Test cases for Store Management Feature of the ECommerce Product
Library         SeleniumLibrary
Resource        ../../../../Common/Resources/Common.robot

*** Variables ***

*** Test Cases ***
Site admin can create new user
    # Open Browser
    Common.Begin Browser Test       ${urlForNavigation}
    # Navigate to Admin Portal Landing 
    # Login As User Admin
    # Navigate to User Admin Screen
    # Create a New User
    # Verify New User Exists
    # Logout
    # Close Browser
    Common.End Browser Test