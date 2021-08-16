import time
from setupteardown import SeleniumSetupTearDown
from shop_landing_page import ValidateShopHome, NavigateShop
from login_page import ValidateLoginPg, NavigateLogin
from account_home_page import ValidateAcctHome, NavigateAcct



# This is your setup but wasn't working as a setup block in the class above
# It wasn't passing the driver back
browser_type = 'Chrome'
# browser_type = 'Firefox'
# browser_type = 'Safari'
launch_url =  'https://woocommerce-trifecta-qa-3.trifecta.dev/'

# Load the shop home page
driver = SeleniumSetupTearDown.load_url(SeleniumSetupTearDown(browser_type),launch_url)

#validate the shop home page
ValidateShopHome.validatePageTitle(driver)
ValidateShopHome.quickCheck(driver)
time.sleep(5)

# Navigate to the login screen
NavigateShop.navToLogin(driver)
time.sleep(5)

# # Validate you're on the Authentication screen
ValidateLoginPg.validatePageTitle(driver)

# # Validate the Login Tab is active
ValidateLoginPg.validateLoginTab(driver)

# Click the Sign Up Tab
# defaultSignUpTab.click()
NavigateLogin.navigateToSignUp(driver)
time.sleep(5)

# validate the Sign Up Tab is active
ValidateLoginPg.validateSignInTab(driver)

# # Click into the EMail/Password fields, fill them out, then click the Sign Up button
NavigateLogin.navigateSignUpNewUser(driver)

# Validate the dashboard
ValidateAcctHome.validateMenus(driver)
ValidateAcctHome.validatePageTitle(driver)

# Click the Logout button
NavigateAcct.logoutOfAccount(driver)

# Validate the Shop page
ValidateShopHome.quickCheck(driver)
ValidateShopHome.validatePageTitle(driver)

# close the browser
time.sleep(5)
SeleniumSetupTearDown.tear_down(driver)