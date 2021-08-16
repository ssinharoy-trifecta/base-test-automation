from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time
import sys

# open a browser(optional to do multiple types)
# navigate to the shop
# navigate to the login page
# navigate to the sign up tab
# enter an eMail and password
# Click the sign up button
# log out

class SeleniumSetupTearDown():
	"""This sets up Selenium to launch and be torn down.  Since this is used frequently,
	it could be leveraged for a fast set up/shut down of any script"""
	def __init__(self, browser_type):
		self.driver = self.browser_switcher(browser_type)
		return 

	def chrome_browser(self):
		browser_path = '/Users/scottozawa/Downloads/chromedriver'
		driver = webdriver.Chrome(executable_path=browser_path)
		return driver

	def firefox_browser(self):
		browser_path = '/Users/scottozawa/Downloads/geckodriver'
		driver = webdriver.firefox(executable_path=browser_path)
		return driver

	def safari_browser(self):
		browser_path = '/usr/bin/safaridriver'
		driver = webdriver.safari(executable_path=browser_path)
		return driver

	def browser_switcher(self, browser_type):
		if browser_type.lower() == 'chrome':
			driver = self.chrome_browser()
		elif browser_type.lower() == 'firefox':
			driver = self.firefox_browser()
		elif browser_type.lower() == 'safari':
			driver = self.safari_browser()
		else: 
			driver = self.chrome_browser()
		return driver

	def load_url(self, url_to_launch):
		# driver = self(browser_type)		
		self.driver.get(launch_url)
		return self.driver

	def tear_down(Driver):
		driver.close()
		driver.quit()
		return

class GetElement():
	def find_single_element(Driver, LocatorType, UniqueID):
		element = Driver 
		try:
			return element.find_element(LocatorType, UniqueID)
		except:
			e = sys.exc_info()[0] 
			print(UniqueID + ' threw an exception as follows:')
			print(e)
		return
	def find_multiple_elements(Driver, LocatorType, UniqueID):
		element = Driver 
		try:
			return element.find_elements(LocatorType, UniqueID)
		except:
			e = sys.exc_info()[0] 
			print(UniqueID + ' threw an exception as follows:')
			print(e)
		return

class AssertText():
	def validate_text(element, TextToValidate):
		try:
			assert TextToValidate in element.text
		except AssertionError:
			print("FAIL: '" + TextToValidate + "' does not exist")
		return
	def validate_element_attribute(element, TextToValidate, attribute):
		try:
			assert TextToValidate in element.get_attribute(attribute)
		except AssertionError:
			print("FAIL: Element Attribute '" + attribute + "' is not equal to '" + TextToValidate + "'")
		return
	def validate_css(element, TextToValidate, CSSProperty):
		try:
			assert TextToValidate in element.value_of_css_property(CSSProperty)
		except AssertionError:
			print("FAIL: CSSProperty '" + CSSProperty + "' is not equal to '" + TextToValidate + "'")
		return
	def test_title(Driver, TextToValidate):
		driver = Driver
		try:
			assert TextToValidate in driver.title
		except AssertionError:
			print("FAIL: '" + TextToValidate + "' title not found")
		return

# class Navigate():
# 	def send
# This is your setup but wasn't working as a setup block in the class above
# It wasn't passing the driver back
browser_type = 'Chrome'
# browser_type = 'Firefox'
# browser_type = 'Safari'
launch_url =  'https://woocommerce-trifecta-qa-3.trifecta.dev/'

# Load the shop home page
driver = SeleniumSetupTearDown.load_url(SeleniumSetupTearDown(browser_type),launch_url)
print(driver.title)
AssertText.test_title(driver, 'Home -Trifecta Nutrition Organic Meal Delivery')
AssertText.validate_text(GetElement.find_single_element(driver, 'xpath', '//*[@id="content-block"]/div[6]/h1[1]'),
	'Meal Plan Delivery')
time.sleep(5)

# Navigate to the login screen
ClickAccountIcon = GetElement.find_single_element(driver,'xpath','//*[@id="Account"]')
ClickAccountIcon.click()
time.sleep(5)

# Validate you're on the Authentication screen
print(driver.title)
AssertText.test_title(driver, 'Trifecta Authentication')

# Validate the Login Tab is active
defaultLoginTab = GetElement.find_single_element(driver, 'xpath','//*[@id="tf-login-tab"]')
# print(defaultLoginTab.get_attribute('class'))
AssertText.validate_element_attribute(defaultLoginTab,'col tf-tab active-login','class')
defaultSignUpTab = GetElement.find_single_element(driver,'xpath','//*[@id="tf-signup-tab"]')
# print(defaultSignUpTab.get_attribute('class'))
AssertText.validate_element_attribute(defaultSignUpTab,'col tf-tab','class')
defaultLoginButton = GetElement.find_single_element(driver, 'xpath','//*[@id="tf-action-btn"]')
# print(defaultLoginButton.text)
AssertText.validate_text(defaultLoginButton,'LOG IN')

# Click the Sign Up Tab
defaultSignUpTab.click()
time.sleep(5)

# validate the Sign Up Tab is active
defaultLoginTab = GetElement.find_single_element(driver, 'xpath','//*[@id="tf-login-tab"]')
# print(defaultLoginTab.get_attribute('class'))
AssertText.validate_element_attribute(defaultLoginTab,'col tf-tab','class')
defaultSignUpTab = GetElement.find_single_element(driver,'xpath','//*[@id="tf-signup-tab"]')
# print(defaultSignUpTab.get_attribute('class'))
AssertText.validate_element_attribute(defaultSignUpTab,'col tf-tab active-signup','class')
# print(defaultLoginButton.text)
AssertText.validate_text(defaultLoginButton,'SIGN UP')

# Click into the EMail/Password fields, fill them out, then click the Sign Up button
eMailLoginField = GetElement.find_single_element(driver,'xpath','//*[@id="validationEmail"]')
eMailLoginField.click()
eMailLoginField.clear()
eMailLoginField.send_keys('scott.ozawa+selenium-08.03.21a@trifectanutrition.com')
eMailPasswordField = GetElement.find_single_element(driver,'xpath','//*[@id="validationPassword"]')
eMailPasswordField.click()
eMailPasswordField.clear()
eMailPasswordField.send_keys('tester123')
defaultLoginButton.click()

# Validate the dashboard
# wait for page to load
driver.implicitly_wait(30)
dashboardMenuItem = GetElement.find_single_element(driver, 'xpath','//*[@id="first-menu"]/a')
AssertText.validate_text(dashboardMenuItem,'Dashboard')
subscriptionsMenuItem = GetElement.find_single_element(driver, 'xpath','//*[@id="mya-scrolling-menu"]/div/ul/li[2]/a')
AssertText.validate_text(subscriptionsMenuItem,'Subscriptions')
acctSettingsMenuItem = GetElement.find_single_element(driver, 'xpath','//*[@id="mya-scrolling-menu"]/div/ul/li[3]/a')
AssertText.validate_text(acctSettingsMenuItem,'Account Settings')
referMenuItem = GetElement.find_single_element(driver, 'xpath','//*[@id="mya-scrolling-menu"]/div/ul/li[4]/a')
AssertText.validate_text(referMenuItem,'Refer Friends')
logOutMenuItem = GetElement.find_single_element(driver, 'xpath','//*[@id="tf-logout-btn"]')
AssertText.validate_text(logOutMenuItem,'Logout')
print(driver.title)
AssertText.test_title(driver, 'My Account - Trifecta Nutrition')

# Click the Logout button
logOutMenuItem.click()

# Validate the Shop page
# wait for page to load
driver.implicitly_wait(30)
AssertText.validate_text(GetElement.find_single_element(driver, 'xpath', '//*[@id="content-block"]/div[6]/h1[1]'),
	'Meal Plan Delivery')
print(driver.title)
AssertText.test_title(driver, 'Home -Trifecta Nutrition Organic Meal Delivery')

# close the browser
time.sleep(30)
SeleniumSetupTearDown.tear_down(driver)