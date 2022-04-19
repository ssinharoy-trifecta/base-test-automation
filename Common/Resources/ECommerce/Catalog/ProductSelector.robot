*** Settings ***
Library                     SeleniumLibrary

*** Variables ***


*** Keywords ***
# TODO Once products are merchandized we can get this setup better. 
Select Category And Go To Specific Product Page
  Click Link                Classics
  Wait Until Page Contains  Salmon, Sweet Potato, Mixed Vegetables Meal
  Click Link                Salmon, Sweet Potato, Mixed Vegetables Meal
