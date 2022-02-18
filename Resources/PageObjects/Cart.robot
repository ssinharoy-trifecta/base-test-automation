*** Settings ***
Library         SeleniumLibrary

*** Variables ***


*** Keywords ***
Close cart
  sleep  1s
  click button  id = btn-minicart-close

Go to checkout
  Click button  id = top-cart-btn-checkout