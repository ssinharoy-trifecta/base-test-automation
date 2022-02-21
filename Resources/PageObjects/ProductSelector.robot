*** Settings ***
Library         SeleniumLibrary

*** Variables ***


*** Keywords ***
Select_Category_And_Go_To_Specific_Product_Page
  Click link  Classics
  Wait until page contains  Salmon, Sweet Potato, Mixed Vegetables Meal
  Click link  Salmon, Sweet Potato, Mixed Vegetables Meal