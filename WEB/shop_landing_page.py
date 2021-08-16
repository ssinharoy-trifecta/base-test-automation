from selenium import webdriver
from elements import GetElement
from assertions import AssertText
# from setupteardown import SeleniumSetupTearDown

class ValidateShopHome():
	def quickCheck(driver):
		driver.implicitly_wait(30)
		AssertText.validate_text(GetElement.find_single_element(driver, 'xpath', '//*[@id="content-block"]/div[6]/h1[1]'),
		'Meal Plan Delivery')
		return
	def validatePageTitle(driver):
		print(driver.title)
		AssertText.test_title(driver, 'Home -Trifecta Nutrition Organic Meal Delivery')
		return
class NavigateShop():
	def navToLogin(driver):
		ClickAccountIcon = GetElement.find_single_element(driver,'xpath','//*[@id="Account"]')
		ClickAccountIcon.click()
		return
# browser_type = 'Chrome'
# launch_url =  'https://woocommerce-trifecta-qa-3.trifecta.dev/'
# driver = SeleniumSetupTearDown.load_url(SeleniumSetupTearDown(browser_type),launch_url)
# ValidateShopHome.quickCheck(driver)