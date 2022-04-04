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
If packages are updated via the `requirements.txt` file, please run the following command from the CLI:
`pip3 install -U -r requirements.txt`
Conversely, you can just rerun the two setup scripts: 
- Bash: `RobotFrameworkSetup.sh`
- ZSH:  `RobotFrameworkSetup.zsh`

## Test Automation Organization
The directory structure follows a pattern of thinking that is relative to the Features our Trifecta teams implement
across all products. 

### SeleniumDrivers
This `SeleniumDrivers` directory contains drivers required in order for Selenium to be able to actually use the browsers we
want to support. There are drivers specific to the machine/OS type that is executing the test cases. Occasionally these
drivers will need to be updated. There is a python package installed called `webdriver-manager` that can almost be used to
manage these drivers. It works fine at this time for Chrome and Firefox, but other drivers will need to be manually
downloaded and moved into this directory. The installation script referenced above will move these drivers into a location
that Robot can reference them when running tests.  Edge and Safari will need to manually be updated from time to time.

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
`robot -v env:qa3 -v browser:ff -d results test/Feature/SubMgmt.robot`

## Launching iOS Test Run on Browserstack
Run the following command in order to launch and run iOS Test Run on BrowserStack emulator
`robot -d Results/iOSTestResults Test/Feature/MobileTests/iOSTestRun.robot`
- results will be outputted in Results/iOSTestResults folder