*** Settings ***
Documentation
...   These tests will be used to execute general utility with the Robot framework.

Resource            ..Resources/Common.robot

Suite Setup         Common.Begin Suite Test
Suite Teardown      Common.End Suite Test   
...                 ${testRunID}
...                 ${envPath}
Test Setup          Common.Begin Browser Test
...                 ${WOOCOMMERCE_SHOP_HOME}
...                 ${runlocal}
...                 ${configBS}
...                 ${envPath}
Test Teardown       Common.End Browser Test

*** Variables ***

*** Test Cases ***
Browser Compatability Captures
  Repeat keyword        3
  Common.Take Screenshot
  Common.Resize Window  
  Common.Take Screenshot
  Common.Resize Window  windowHeight  windowWidth
  Common.Take
  