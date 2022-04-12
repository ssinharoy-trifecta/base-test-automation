*** Settings ***
Library 	SeleniumLibrary
Library 	../../Libraries/random_email_generator.py

*** Variables ***
${email}

*** Test Cases ***
Log eMail
	Log email address

*** Keywords ***
Log email address
	${email}	Generate_Email
	Log to Console 	${email}
	