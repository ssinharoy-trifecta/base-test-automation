*** Variables ***
${thankYouConfirmationBtn}  xpath = //*[@id="trifecta-checkout"]/div/div/div/div/div/div/div[1]/div[2]/div[3]/div/button

*** Keywords ***
Validate Thank You Page Load
  Wait Until Element Is Visible  ${thankYouConfirmationBtn}  timeout=30
