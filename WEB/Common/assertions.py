from selenium import webdriver

class AssertText():
	def validate_text(element, TextToValidate):
		try:
			assert TextToValidate in element.text
		except AssertionError:
			print("FAIL: '" + TextToValidate + "' does not exist")
	def validate_element_attribute(element, TextToValidate, attribute):
		try:
			assert TextToValidate in element.get_attribute(attribute)
		except AssertionError:
			print("FAIL: Element Attribute '" + attribute + "' is not equal to '" + TextToValidate + "'")
	def validate_css(element, TextToValidate, CSSProperty):
		try:
			assert TextToValidate in element.value_of_css_property(CSSProperty)
		except AssertionError:
			print("FAIL: CSSProperty '" + CSSProperty + "' is not equal to '" + TextToValidate + "'")
	def test_title(Driver, TextToValidate):
		driver = Driver
		try:
			assert TextToValidate in driver.title
		except AssertionError:
			print("FAIL: '" + TextToValidate + "' title not found")