import json
import requests
import os
from robot.api import logger
from TestRailAPIClient import JsonDict, TestRailAPIClient

# https://www.gurock.com/testrail/docs/api/reference/results/
# additional documentation to continue to review
# http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#listener-interface
# https://stackoverflow.com/questions/54152481/parse-robot-frameworks-output-xml
# https://stackoverflow.com/questions/61237288/can-i-get-the-failed-test-case-names-using-robot-api
# https://stackoverflow.com/questions/64029520/robot-framework-api-getting-test-suite-subsuite-results-and-test-case-results
# This may be useful to leverage
# https://robot-framework.readthedocs.io/en/latest/autodoc/robot.model.html?highlight=testcase%20object#module-robot.model.testcase
# https://robot-framework.readthedocs.io/en/latest/_modules/robot/result/resultbuilder.html
# https://robot-framework.readthedocs.io/en/latest/_modules/robot/result/visitor.html

class TestRailListener(object):
	def __init__():
		#establish a connection to TR here?

	def end_test():
		####
		# Grab the tags and parse for TestRail IDs
		# Grab them and dump them into some sort of array/dictionary
		# From there, grab the results
		# Add each result to the array/Dictionary
		# Generate the JSON doc
		# Push the contents to TestRail
		####
	def getTestRailTags():
		# Could parse for `testrailid`, `defects`,`references`
		# Using the split command, you can parse based on the `=`
		# Then the tag name is on the left, tag value is on the right
		# Account for the no-tags and multi tags case
		return tagDictionary
	def parseResultsLogs(tagDictionary):
		# get the link/path(?) to the report file
		# If the attributes are pass, then set the correct status
		# Or set it if the status doesn't exist
		# Update the results dictionary
		return resultsDictionary
	def generateJSON(resultsDictionarly):
		# Translate the dictionary into JSON
		return resultsJSON
	def sendToTestRail(resultsJSON):
		# Connect to TestRail
		# Post to TestRail
