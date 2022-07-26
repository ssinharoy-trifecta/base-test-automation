*** Settings ***
Documentation
...   Common Keywords and Variables to be used across all customer flow features.

Resource  ../PageObjects/WooTopNav.robot
Resource  ../PageObjects/WooProductSelector.robot
Resource  ../PageObjects/WooCart.robot
Resource  ../PageObjects/WooCheckout.robot
Resource  ../PageObjects/WooThankYou.robot

*** Keywords ***
Add A Single Meal Plan To Cart
  WooTopNav.Navigate To Product Selector
  WooProductSelector.Validate Product Selector Page Load
  WooProductSelector.Add Meal Plan

Continue To Checkout
  WooCart.Click Checkout

Complete Checkout Forms
  WooCheckout.Validate Checkout Step 2 Page Load
  WooCheckout.Complete Create Your Account Form
  WooCheckout.Complete Shipping Address Form

Complete Checkout Transaction
  WooCheckout.Place Order
  WooThankYou.Validate Thank You Page Load

Complete Checkout
  Complete Checkout Forms
  Complete Checkout Transaction

Add A La Carte To Cart
  WooTopNav.Navigate To Product Selector
  WooProductSelector.Validate Product Selector Page Load
  WooProductSelector.Add A La Carte Product

Complete Checkout From Product Selector
  Continue To Checkout
  Complete Checkout


