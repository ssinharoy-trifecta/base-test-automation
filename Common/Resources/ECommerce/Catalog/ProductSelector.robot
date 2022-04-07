*** Settings ***
Library                     SeleniumLibrary

*** Variables ***


*** Keywords ***
Select Category And Go To Specific Product Page
  Click Link                Classics
  Wait Until Page Contains  Salmon, Sweet Potato, Mixed Vegetables Meal
  Click Link                Salmon, Sweet Potato, Mixed Vegetables Meal
