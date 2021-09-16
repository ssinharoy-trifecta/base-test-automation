# browser types are found here:
# https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Open%20Browser
# To run this, use:
# robot -v plt:woo -v env:qa1 -v browser:ff RobotFramework/Resources/SampleCode/dynamiclaunch.robot
*** Settings ***
Library 	SeleniumLibrary

*** Variables ***
${plt}
&{platform}     woo=woocommerce     gento=magento       mag=magento
${env}
&{environment}	qa1=qa-1	qa2=qa-2	qa3=qa-3	qa4=qa-4	uat=uat-1	staging=staging-1
${shop-home}  https://${platform.${plt}}-trifecta-${environment.${env}}.trifecta.dev/
${my-account}   ${shop-home}/my-account
${woo-admin}    ${shop-home}/cms/wp-login.php
${magento-admin}    ${shop-home}/admin_130ihb
${browser}

*** Test Cases ***
Log Stuff
    Open Shop Home
    Close Browser
    Open My Account
    Close Browser
    Open Woo Admin
    Close Browser
    Open MAgento Admin
    Close Browser

*** Keywords ***
Open Shop Home
    Open Browser    ${shop-home}    ${browser}
    Sleep   5s

Open My Account
    Open Browser    ${my-account}    ${browser}
    Sleep   5s

Open Woo Admin
    Open Browser    ${woo-admin}    ${browser}
    Sleep   5s

Open Magento Admin
    Open Browser    ${magento-admin}    ${browser}
    Sleep   5s