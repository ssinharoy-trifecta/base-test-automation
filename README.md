# base-test-automation
This repo is to be used as the new home base for test automation script development.  Initially, all new work will go into the WEB, Android, and iOS directories as applicable.  

As we create common libraries, that will get split out into a separate folder.  

As a future state, test assets that are applicable to a given repository will be removed from this repo and pushed to the more applicable repositories.  For example, login screens will all eventually go to the Login Server repo, the "trifecta-auth" repo.  

Coding principles and architecture ideals to consider are:

* Contain common functions into a series of basic libraries such as
	* Navigation
	* Validation
	* Try/Catch
	* Error handling
* Contain common navigations into a series of basic libraries based around functionality such as
	* Logins
	* Cart purchases
	* Editing subscription cart
	* Editing shipments/skip dates
	* Editing addresses
	* Editing payment methods
	* Shop navigation
	* Product validation
	* Admin UI
* Create singluar scripts that encapsulate a combination of navigations and common functions
* Create a master script that calls each script.  Master scripts can be broken out into Sanity, Smoke, and Regression suites.  It needs to be able to run tests in parallel
* Create separate data files for use in Data Driven Testing

A master suite script will allow us to quickly add/remove test scripts without significant edits.

Encapsulating navigations and functions allows us to create the test script once, then only make changes if the overall flow of the user interface changes.  An example of needing to update this would be to update the onboarding flow for the Mobile Apps.  This will include the ability to run validation points and report back.  This will provide the ability to address wait states.  This is where you would include references to data files for Data Driven Testing

Capturing the individual navigations into a single library allows us to have a single file that needs to be updated if/when the UI is changing.  Since this is strictly navigation, this allows the user to only need to address navigational issues in.  This will be specific to finding elements and interacting with them.

Capturing reusable features such as locating items, assertions, wait states, file I/O, and randomization functions will allow users to spend less time re-writing the same code regularly and focus time on developing the logic for test execution.