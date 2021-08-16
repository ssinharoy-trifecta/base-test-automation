from selenium import webdriver
from elements import GetElement
from assertions import AssertText
from datetime import datetime

class ValidateLoginPg():
	def validateLoginTab(driver):
		# Validate the Login Tab is active
		driver.implicitly_wait(30)
		defaultLoginTab = GetElement.find_single_element(driver, 'xpath','//*[@id="tf-login-tab"]')
		# print(defaultLoginTab.get_attribute('class'))
		AssertText.validate_element_attribute(defaultLoginTab,'col tf-tab active-login','class')
		defaultSignUpTab = GetElement.find_single_element(driver,'xpath','//*[@id="tf-signup-tab"]')
		# print(defaultSignUpTab.get_attribute('class'))
		AssertText.validate_element_attribute(defaultSignUpTab,'col tf-tab','class')
		defaultLoginButton = GetElement.find_single_element(driver, 'xpath','//*[@id="tf-action-btn"]')
		# print(defaultLoginButton.text)
		AssertText.validate_text(defaultLoginButton,'LOG IN')
		return
	def validateSignInTab(driver):
		# validate the Sign Up Tab is active
		defaultLoginTab = GetElement.find_single_element(driver, 'xpath','//*[@id="tf-login-tab"]')
		# print(defaultLoginTab.get_attribute('class'))
		AssertText.validate_element_attribute(defaultLoginTab,'col tf-tab','class')
		defaultSignUpTab = GetElement.find_single_element(driver,'xpath','//*[@id="tf-signup-tab"]')
		# print(defaultSignUpTab.get_attribute('class'))
		AssertText.validate_element_attribute(defaultSignUpTab,'col tf-tab active-signup','class')
		defaultLoginButton = GetElement.find_single_element(driver, 'xpath','//*[@id="tf-action-btn"]')
		# print(defaultLoginButton.text)
		AssertText.validate_text(defaultLoginButton,'SIGN UP')
		return
	def validatePageTitle(driver):
		# Validate you're on the Authentication screen
		print(driver.title)
		AssertText.test_title(driver, 'Trifecta Authentication')
		return

class NavigateLogin():
	def navigateToSignUp(driver):
		# Click the Sign Up Tab
		defaultSignUpTab = GetElement.find_single_element(driver,'xpath','//*[@id="tf-signup-tab"]')
		defaultSignUpTab.click()
		return
	def navigateSignUpNewUser(driver):
		# Click into the EMail/Password fields, fill them out, then click the Sign Up button
		eMailLoginField = GetElement.find_single_element(driver,'xpath','//*[@id="validationEmail"]')
		eMailLoginField.click()
		eMailLoginField.clear()
		eMailLoginField.send_keys(RandomEmail.generateEMail())
		eMailPasswordField = GetElement.find_single_element(driver,'xpath','//*[@id="validationPassword"]')
		eMailPasswordField.click()
		eMailPasswordField.clear()
		eMailPasswordField.send_keys('tester123')
		defaultLoginButton = GetElement.find_single_element(driver, 'xpath','//*[@id="tf-action-btn"]')
		defaultLoginButton.click()
		return
class RandomEmail():
	def generateEMail():
		today = datetime.now()
		today=today.strftime("%m-%d-%y.%H.%M.%S.%s")
		eMail = 'selenium+' + today + '@trifectanutrition.com'
		return eMail
