from selenium import webdriver
from elements import GetElement
from assertions import AssertText

class ValidateAcctHome():
	def validateMenus(driver):
		driver.implicitly_wait(180)
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
		return
	def validatePageTitle(driver):
		print(driver.title)
		AssertText.test_title(driver, 'My Account - Trifecta Nutrition')
		return

class NavigateAcct():
	def logoutOfAccount(driver):
		logOutMenuItem = GetElement.find_single_element(driver, 'xpath','//*[@id="tf-logout-btn"]')
		logOutMenuItem.click()
		return
