# Introduction
This is the new home repository for Test Automation.  This should comprise of two primary folders with a number of subfolders beneath it:
	* Mobile - For all mobile related test scripts
	* Web - For all web related test scripts

## Mobile
TBD - Probably includes two sub folders for Android and iOS?

## Web
This contains four primary subfolders:
	* Libraries - For any Python files needed for custom scripting. This includes the TestRail Python file
	* Resources - For all Robot files that contain reusable keyword definitions such as Setup / Tear Down functions.  Subfolders will include common functions as broken down by unique web pages and functional areas of the code.
	* Results - For all result logs.
	* Tests - For all Robot test script files.  Subfolders will contain test scripts grouped by functional areas of the code

There may be subfolders under each of these that break functionality down further into more succinct groupings.  This will be updated as more test scripts are created.

### Robot Framework
Robot Framework is the chosen scripting language for Web test automation.  In order to configure your environment to use it, please run the following command line script:
	* `pip install -U -r requirements.txt`

Once installed, you'll need to run the following commands to set your PATH and PYTHONPATH orientations.  This may be best to be added to your `.bash_profile`:
	* `export PATH=${PWD}/RobotFramework:${PWD}/RobotFramework/PythonLibraries:${PWD}/SeleniumDrivers:/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH`
	* `export PYTHONPATH=${PWD}/RobotFramework:${PWD}/RobotFramework/PythonLibraries:${PWD}/SeleniumDrivers:${PWD}:/Library/Frameworks/Python.framework/Versions/3.9/bin`

## GitIgnore
The .gitignore file will automatically ignore all the result log files and not commit them to the repo.  It also is also ignoring the `__pycache__` and `.DS_Store` folders.