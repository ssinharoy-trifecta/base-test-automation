*** Settings ***
Library         SeleniumLibrary

*** Variables ***


*** Keywords ***
Select category and go to specific product page
  Click link  Classics
  Wait until page contains  Salmon, Sweet Potato, Mixed Vegetables Meal
  Click link  Salmon, Sweet Potato, Mixed Vegetables Meal