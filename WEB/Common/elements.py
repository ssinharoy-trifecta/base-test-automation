from selenium import webdriver
from selenium.webdriver.common.by import By
import sys

class GetElement():
	def find_single_element(Driver, LocatorType, UniqueID):
		element = Driver 
		try:
			return element.find_element(LocatorType, UniqueID)
		except:
			e = sys.exc_info()[0] 
			print(UniqueID + ' threw an exception as follows:')
			print(e)
	def find_multiple_elements(Driver, LocatorType, UniqueID):
		element = Driver 
		try:
			return element.find_elements(LocatorType, UniqueID)
		except:
			e = sys.exc_info()[0] 
			print(UniqueID + ' threw an exception as follows:')
			print(e)