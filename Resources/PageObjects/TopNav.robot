*** Settings ***
Library         SeleniumLibrary

*** Variables ***


*** Keywords ***
Navigate to App
  click link  App

Navigate to FAQ
  click link  FAQ

Navigate to HealthArticles
  click link  Resources
  click link  Health Articles
  sleep  2s

Navigate to HowItWorks
  click link  How It Works

Navigate to NutritionArticles
  click link  Resources
  click link  Nutrition Articles
  sleep  2s

Navigate to Testimonials
  click link  Testimonials

Navigate to Tools
  click link  Resources
  click link  Tools
  sleep  2s

Navigate to ProductSelector
  click link  xpath = //*[@id="html-body"]/div[2]/header/div[1]/div[2]/ul/li/a