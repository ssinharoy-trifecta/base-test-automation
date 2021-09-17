*** Settings ***
Library 	DateTime

*** Test Cases ***
Log eMail
	Log email address

*** Keywords ***
Log email address
	${CurrentDate}=  Get Current Date  result_format=%m-%d-%y.%H.%M.%S.%s
	Log to Console	${CurrentDate}
	${email}	Set Variable	selenium+${CurrentDate}\@trifectanutrition.com
	Log to Console	${email}