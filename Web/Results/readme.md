The Results folder is where all the .xml and .html files will be deposited when using the `-d results` command line 
switch when running robot.  For example, the following files will be deposited when the following is run:
`robot -d results Web/Tests/trial.robot`
	* log.html
	* output.html
	* report.html

The three files above are to be included in the .gitignore file so should not ever be recognized by Git nor committed 
to the code repository.