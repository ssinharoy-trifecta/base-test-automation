# Introduction
This is the new home repository for Test Automation.  This should comprise of two primary folders with a number of 
subfolders beneath it:
	* Mobile - For all mobile related test scripts
	* Web - For all web related test scripts

## Mobile
TBD - Probably includes two sub folders for Android and iOS?

## Web
This contains four primary subfolders:
	* Libraries - For any Python files needed for custom scripting. This includes the TestRail Python file
	* Resources - For all Robot files that contain reusable keyword definitions such as Setup / Tear Down functions.  
	Subfolders will include common functions as broken down by unique web pages and functional areas of the code.
	* Results - For all result logs.
	* Tests - For all Robot test script files.  Subfolders will contain test scripts grouped by functional areas of the 
	code

There may be subfolders under each of these that break functionality down further into more succinct groupings.  This 
will be updated as more test scripts are created.

### Robot Framework
Robot Framework is the chosen scripting language for Web test automation.  In order to configure your environment to 
use it, please run the following command line script:
	* `pip install -U -r requirements.txt`

#### Webdriver files
Once installed, you'll need to add the correct selenium path to your PATH variable.  You'll need to add either `mac`, 
`linux`, or `win` to the `${PWD}/SeleniumDrivers/<your OS>`.  For Macs, it should look like the following command.  
This may be best to be added to your `.bash_profile`:
	* `export PATH=${PWD}/SeleniumDrivers/mac:/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH`
Conversely, you should be able to add all the paths in case you want to run the others.  It would look like this:
	* `export PATH=${PWD}/SeleniumDrivers/mac:${PWD}/SeleniumDrivers/linux:${PWD}/SeleniumDrivers/win:/Library/
	Frameworks/Python.framework/Versions/3.9/bin:$PATH`
These are the most recent drivers, so you may need to update your browsers to the latest versions.  We should try to 
stay up to date with these and should update whenever our browsers auto-update.  These are the driver versions:
	* Firefox - 0.29.1
	* Chrome - 93.0.4577.63
	* MS Edge - 93.0.961.47
	* Safari - 14.1.2

#### PythonPath
You'll also likely need to update your PYTHONPATH if you're using any of the included python files in the Libraries 
folder.  
	* `export PYTHONPATH=${PWD}/RobotFramework:${PWD}/RobotFramework/Libraries:/Library/Frameworks/Python.framework/
	Versions/3.9/bin`

## GitIgnore
The .gitignore file will automatically ignore all the result log files and not commit them to the repo.  It also is 
also ignoring the `__pycache__` and `.DS_Store` folders.