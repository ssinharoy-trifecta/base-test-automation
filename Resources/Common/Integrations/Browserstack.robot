*** Variables ***
#Common
${BS_REMOTE_URL}    hub-cloud.browserstack.com/wd/hub
${BS_USER}          tylerthomas6    
${BS_KEY}           FQtVoY5xMMxVa9bh1c1Z
${BS_APP}           bs://362fd79ea6457c0bbd9feb481bfe4ec65dbbc2d7
${BS_IDLE_TIMEOUT}  5

#APPS - iOS specific
${BS_DEVICE}        iPhone 13
${BS_iOS_VERSION}   15
${BS_PROJECT}       iOS Test Run
${BS_BUILD}         browserstack-build-1  
${BS_NAME}          iOS_Test_Run

#WEB
${BS_OS}                Windows
${BS_PC_OS_VERSION}     10
${BS_BROWSER}           chrome
${BS_BROWSER_VERSION}   98
