*** Settings ***
Library			RequestsLibrary
Resource		../Integrations/API.robot
Variables		testrail_env.py
Documentation
...		You'll need to update the testrail_env.py file with the TestRail User, password, and API Key
...		This is found in LastPass

*** Variables ***
${baseURL}          ${TESTRAIL_URL}
${getURL}           index.php?/api/v2/get_case/8696
${singleCasePost}   index.php?/api/v2/add_result_for_case/326/8696
${multiCasePost}    index.php?/api/v2/add_results_for_cases/326
${headers}          Authorization=Basic		Content-Type=application/json	accept=application/json
@{authData}         ${TESTRAIL_USER}			${TESTRAIL_APIKEY}
${passFailStatus}
${passFailComment}

*** Test Cases ***
Sample Get Request
	[Documentation]
	...		Returns the contents of the Purchase A Meal Plan test case 
	API.GET Request And Fetch Status Code		${baseURL}		${getURL}		@{authData}

Sample Post Request
	[Documentation]
	...											Posts a result to the Purchase A Meal Plan 
	${passFailStatus}=			Set Variable					1
	${passFailComment}=			Set Variable					This is a test from rob ot
	${dictJSON}=						Create Dictionary			status_id=${passFailStatus}     comment=${passFailComment}
	API.Send POST Request		${baseURL}		
	...											${dictJSON}
	...											${singleCasePost}
	...											@{authData}

Sample Post Request For Cases
	[Documentation]
	...		Post the results for 2 cases, Purchase a Meal Plan and Purchase a Meal Plan with a 1 Time Coupon
	# TODO: Parameterize Run ID, TestCase ID, and Case Results
	# TODO: Each Test needs to save off it's results?
	# TODO: For each result, add it to the list using looping
	# Dictionary for result set 1
	${handWritten1}=				Create Dictionary		case_id=8696			status_id=5		comment=This fails because I said so
	# Dictionary for result set 2
	${handWritten2}=				Create Dictionary		case_id=8697			status_id=1		comment=This passes because I said so
	# Add all results to a list
	${handWritten3}=				Create List					${handWritten1}		${handWritten2}
	# Results list is added to a final dictionary for submission
	${handWrittenFinal}=		Create Dictionary		results=${handWritten3}
	Log											'${handWrittenFinal}'
	# Post created
	API.Send POST Request		${baseURL}		
	...											${handWrittenFinal}
	...											${multiCasePost}
	...											@{authData}
