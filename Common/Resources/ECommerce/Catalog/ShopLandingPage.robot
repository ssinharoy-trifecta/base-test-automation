*** Settings ***
Library                           SeleniumLibrary

*** Variables ***
${shopHomePageHeader}             xpath://*[@id="maincontent"]/div[1]/h1/span

***Keywords***
Navigate to Magento Shop Home
  Go To                           ${MAGENTO_SHOP_HOME}
  Wait Until Element Is Visible   ${shopHomePageHeader}