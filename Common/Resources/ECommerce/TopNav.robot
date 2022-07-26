*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${minicartBtn}  xpath = //*[@id="html-body"]/div[2]/header/div[1]/div[2]/ul/li/a
${accountBtn}   xpath = //*[@id="html-body"]/div[2]/header/div[1]/div[2]/a[1]

*** Keywords ***
Navigate To App
  Click Link    App

Navigate To FAQ
  Click Link    FAQ

Navigate To Health Articles
  Click Link    Resources
  Click Link    Health Articles
  Sleep         2s

Navigate To How It Works
  Click Link    How It Works

Navigate To Nutrition Articles
  Click Link    Resources
  Click Link    Nutrition Articles
  Sleep         2s

Navigate To Testimonials
  Click Link    Testimonials

Navigate To Tools
  Click Link    Resources
  Click Link    Tools
  Sleep         2s

Navigate To Product Selector
  Log           Going to Product Selector from header button...
  Click Link    ${minicartBtn}

Navigate To Account Redirects
  Log           Clicking account button in header...
  Click Link    ${accountBtn}
