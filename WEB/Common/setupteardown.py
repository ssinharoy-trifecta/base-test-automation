from selenium import webdriver
from selenium.webdriver.chrome.service import Service


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
		self.driver.get(url_to_launch)
		return self.driver

	def tear_down(Driver):
		Driver.close()
		Driver.quit()
		return

# 'Chrome'
# launch_url =  'https://woocommerce-trifecta-qa-3.trifecta.dev/'

# driver = SeleniumSetupTearDown.load_url(SeleniumSetupTearDown(browser_type),launch_url)
# print(driver.title)
# browser_type = 