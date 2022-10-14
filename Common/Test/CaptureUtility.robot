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
  [Tags]  Desktop
  FOR     ${item}                    IN             @{screenResolutionList}
          Set Window Size            ${item.width}  ${item.height}
          FOR                        ${yScroll}     IN  @{scrollDestinationList}
            Execute Javascript       window.scrollTo(0,${yScroll})
            Capture Page Screenshot  ${item.width}x${item.height}Scrolled${yScroll}.png
          END
  END

#TODO Mobile Browser Compatability Captures. See Browserstack.robot TODO
