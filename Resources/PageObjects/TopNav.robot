*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${minicartBtn}  xpath = //*[@id="html-body"]/div[2]/header/div[1]/div[2]/ul/li/a

*** Keywords ***
Navigate_To_App
  click link  App

Navigate_To_FAQ
  click link  FAQ

Navigate_To_Health_Articles
  click link  Resources
  click link  Health Articles
  sleep  2s

Navigate_To_How_It_Works
  click link  How It Works

Navigate_To_Nutrition_Articles
  click link  Resources
  click link  Nutrition Articles
  sleep  2s

Navigate_To_Testimonials
  click link  Testimonials

Navigate_To_Tools
  click link  Resources
  click link  Tools
  sleep  2s

Navigate_To_Product_Selector
  Log  Going to Product Selector from header button...
  click link  ${minicartBtn}