*** Settings ***
Library 	SeleniumLibrary
Library 	RPA.Browser.Selenium
# Library 	random_email_generator
# Library		TestRailAPIClient   testrail_server_name    tester_user_name    tester_user_password    run_id


*** Variables ***
${env}
&{environment}	qa1=woocommerce-trifecta-qa-1	qa2=woocommerce-trifecta-qa-2	qa3=woocommerce-trifecta-qa-3	staging=woocommerce-trifecta-staging-1
${url}	https://${environment.${env}}.trifecta.dev/

*** Test Cases ***
Purchase a Meal Plan
	# [Tags] testrailid=8696
	Open Shop
	# Open The Clean Meal Plan
	# Add Plan to Cart
	# Navigate through Checkout
	# Validate Successful Checkout
	# Validate Account
	# Log Out

Purchase a Meal Plan with a Recurring Item Coupon
	# [Tags] testrailid=8697
	Open Shop
	# Open The Clean Meal Plan
	# Add Plan to Cart
	# Navigate through Checkout
	# Validate Successful Checkout
	# Validate Account
	# Log Out

Purchase an A La Carte Subscription
	# [Tags] testrailid=8708
	Open Shop
	# Open The Clean Meal Plan
	# Add Plan to Cart
	# Navigate through Checkout
	# Validate Successful Checkout
	# Validate Account
	# Log Out

*** Keywords ***
Open Shop
	Open Available Browser	 ${url}
	Sleep	 4s
	Close Browser