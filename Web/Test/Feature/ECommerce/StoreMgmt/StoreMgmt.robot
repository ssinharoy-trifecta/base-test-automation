*** Settings ***
Documentation   Test cases for Store Management Feature of the ECommerce Product
Library         SeleniumLibrary
Resource        ../../../../Common/Resources/Common.robot
Test Setup      Begin Browser Test  ${MAGENTO_SHOP_HOME}  ${runlocal}
Test Teardown   End Browser Test

*** Variables ***

*** Test Cases ***
Site admin can create new user
    Log     ${runlocal}
    # Open Browser
    # Navigate to Admin Portal Landing 
    # Login As User Admin
    # Navigate to User Admin Screen
    # Create a New User
    # Verify New User Exists
    # Logout
    # Close Browser
