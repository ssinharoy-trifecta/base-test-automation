*** Settings ***
Documentation
...   These tests will be used to execute general utility with the Robot framework.

Resource            ../Resources/Common.robot
Resource            ../Resources/DataFiles/ScreenResolutions.robot

Suite Setup         Common.Begin Suite Test
Suite Teardown      Common.End Suite Test   
...                 ${testRunID}
...                 ${envPath}
Test Setup          Common.Begin Browser Test
...                 ${TEST_URL}
...                 ${runlocal}
...                 ${configBS}
...                 ${envPath}
Test Teardown       Common.End Browser Test

*** Variables ***

*** Test Cases ***
Desktop Browser Resolution Compatability Captures
  [Tags]                   Desktop
  Sleep                    1s
  Capture Page Screenshot  ${windowWidth}x${windowHeight}.png
  FOR                      ${item}  IN  @{screenResolutionList}
                           Screenshot At Desired Resolution  ${item.width}  ${item.height}
  END

#TODO Mobile Browser Compatability Captures. See Browserstack.robot TODO
