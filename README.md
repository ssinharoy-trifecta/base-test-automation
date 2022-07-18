# Introduction
This is the **base-test-automation** repository. Test scripts are created using Robot Framework, which is a generic open 
source test automation framework. 
[robotframework.org](https://robotframework.org/)

We will be using the Robot framework to write test cases that will in turn use a Selenium library to emulate an end user
working with a web browser.  
[SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)

## Installation
In order to configure your environment to use Robot, please run either of the following scripts.  
There's one for ZSH and one for Bash depending on what you're using:  
- Bash: `RobotFrameworkSetup.sh`
- ZSH:  `RobotFrameworkSetup.zsh`

These scripts should - 
1. confirm that the system has Python3 installed
2. create a python virtual environment
3. install all required libraries to run Robot test cases

It is assumed that the testing systems will have required browsers installed in order for Robot and Selenium.

After running the script make sure to activate the virtual environment by running in the terminal -  
`source env/bin/activate`

When you are done testing in that repository make sure to deactivate your python virtual environment -  
`deactivate`
### Updating Packages
Packages are updated via the `requirements.txt` file, please run the following command from the CLI:

- `pip3 install -U -r requirements.txt`

Conversely, you can just rerun the two setup scripts: 
- Bash: `RobotFrameworkSetup.sh`
- ZSH:  `RobotFrameworkSetup.zsh`

#### Uninstalling packages
You can uninstall the packages and their associated support packages by running:
- `pip3 uninstall -r removalRequirements.txt -y`

### Selenium WebDrivers
As part of the Setup Script, Selenium WebDrivers will downloaded to the 
`env/bin` directory and extracted.  These are currently hardcoded to a build 
number but because the Setup Script also installs `webdriver-manager`, it will 
automatically update the Selenium Webdriver based on the currently used version 
of the browser on the host computer.  Safari, for Mac, will need to manually be 
updated from time to time.

## Test Automation Organization
The directory structure follows a pattern of thinking that is relative to the Features our Trifecta teams implement
across all products.

### Examples
This `Examples` directory contains a good deal of POC code that the QA team initially created when evaluating Robot as a 
potential framework. Reference this code as needed but with a skeptical eye. The industry moves quickly and it is highly
likely that libraries in use are deprecated.

As we add or find good examples we should continue to add to this directory so that future developers/team members can 
have reference code to look at.

### Resources
This `Resources` directory contains the lower levels of abstractions for Robot tests. Think of "resources" here as components
of pages or locators and functionality in various pages or screens that tests will work through. Resources here could also 
be common Keywords or variables that can be utilized through all test scripts that we create over time. These resource files
will contain core keyword definitions that will be using the Robot builtin or SeleniumLibrary Keyword calls in order to
perform the core underlying work of tests. These abstractions should allow test cases at higher levels of execution to remain 
relatively untouched if we need to change things.

Resources here are thus broken down into major areas. We should expect that this will be updated as more test scripts are
created -
- `UIObjs` - User Interface objects
	- `PageObjs` - Web Page Objects
	- `ScreenObjs` - Mobile Screen Objects
### Test
This `Test` directory contains the Robot test files specific to the feature workflows we need to test. The directory
structure here is broken down based on `Feature` first. As you dig down into the Feature you should see Product level
directories where Robot files will exist that are specific to a feature behavior/workflow on that product.

There are `Stress` and `System` directories as well that will eventually contain load/stress level tests and system 
level tests that are covering areas beyond a single feature.

We should expect that this will be updated as more test scripts are created -
- `Feature`
- `Stress`
- `System`

### Results
This `Results` directory is where test results will end up. The contents of this directory are added to the 
.gitignore file for the repository. Results should not be committed to the repository ever. Results instead
should be uploaded to our test management SaaS - TestRail.

### Robot Framework
For reference, we should always use Python 3.9.1 until we decide to change.  Robot Framework and it's supporting 
counterparts are also locked to versions as specified in the requirements.txt file.  

## Launching Robot Framework Scripts
Scripts can be launched with the following Command Line Interface parameters:
- Environment: `-v env:qa1`
- Browser: `-v browser:ff`
- Results Directory: `-d Results`

Example: 
`robot -v env:qa3 -v browser:ff -d results Common/Test/Feature/ECommerce/SubscriptionMgmt/SubMgmt.robot`

List of variables and tags that can be passed through CLI command:
https://trifectanutrition.atlassian.net/wiki/spaces/TN/pages/1735196673/Robot+Framework+CLI+Variables+and+Tags

## APPS Test Automation

## Running iOS Test Automation Script on BrowserStack Cloud Real Device
- Have the Trifecta App .ipa file on hand (download from Firebase App Distribution)
- Name the .ipa file `TrifectaAppiOS.ipa`
- Drag and drop the `TrifectaAppiOS.ipa` file to the `iOS/Resources/System` folder in this repository
- Run the command to launch the iOS Test Run on BrowserStack Cloud Real Device:
`robot -d iOS/Results iOS/Test/System/SystemSmokeTestiOS.robot`
- The script will automatically upload the `TrifectaAppiOS.ipa` file to BrowserStack Cloud and perform testing against that build
- Navigate to `https://app-automate.browserstack.com/dashboard/v2/builds` to obtain Test Run results

## Running Android Test Automation Script on BrowserStack Cloud Real Device
- Have the Trifecta App .apk file on hand (download from Firebase App Distribution)
- Name the .apk file `TrifectaAppAndroid.apk`
- Drag and drop the `TrifectaAppAndroid.apk` file to the `Android/Resources/System` folder in this repository
- Run the following command to launch the Android Test Run on BrowserStack Cloud Real Device:
`robot -d Android/Results Android/Test/System/SystemSmokeTestAndroid.robot`
- The script will automatically upload the `TrifectaAppAndroid.apk` file to BrowserStack Cloud and perform testing against that build
- Navigate to `https://app-automate.browserstack.com/dashboard/v2/builds` to obtain Test Run results
