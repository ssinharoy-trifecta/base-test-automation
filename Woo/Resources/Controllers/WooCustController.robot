*** Settings ***
Documentation
...   Common Keywords and Variables to be used across all customer flow features.

Resource  ../PageObjects/WooTopNav.robot
Resource  ../PageObjects/WooProductSelector.robot
Resource  ../PageObjects/WooCart.robot
Resource  ../PageObjects/WooCheckout.robot
Resource  ../PageObjects/WooThankYou.robot
Resource  ../PageObjects/WooMyAccount.robot

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
  WooProductSelector.Add A La Carte Product  ${catSelectorProteinTab}  ${proteinInfoBtn}  10

Complete Checkout From Product Selector
  Continue To Checkout
  Complete Checkout

Go To My Account
  WooTopNav.Click Header Account Element
  WooMyAccount.Validate My Account Loaded

Skip All Weeks
  WooMyAccount.Open Skip Weeks Modal
  WooMyAccount.Click All Skip Buttons In Skip Modal
  WooMyAccount.Validate All Weeks Are Skipped

Modify Existing Subscription Items
  WooMyAccount.Click Modify Button
  WooProductSelector.Validate Product Selector Page Load
  WooProductSelector.Add A La Carte Product  ${catSelectorProteinTab}  ${proteinInfoBtn}  12
  WooCart.Save Subscription Modify
  WooProductSelector.Agree To Changes Affect Delivery On Notification 
  WooMyAccount.Validate My Account Loaded

Purchase Meal Plan Complete Flow
  Add A Single Meal Plan To Cart
  Complete Checkout From Product Selector

Edit And Save New Billing Address
  WooMyAccount.Click Account Settings Tab
  WooMyAccount.Change Billing Address
  WooMyAccount.Validate Account Settings Tab

Edit And Save New Shipping Address
  WooMyAccount.Change Shipping Address
  WooMyAccount.Validate Customer Subscription View Load

Add Second Subscription
  Go To  ${WOOCOMMERCE_SHOP_HOME}
  Add A Single Meal Plan To Cart
  Continue To Checkout
  WooCheckout.Confirm Adding A Second Subscription
  WooCheckout.Complete Shipping Address Form
  Complete Checkout Transaction

Go To My Account After Completing Subscription
  WooCustController.Purchase Meal Plan Complete Flow
  WooCustController.Go To My Account
