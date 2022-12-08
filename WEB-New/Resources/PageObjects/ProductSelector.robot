*** Settings ***
Resource            ../../../WEB-New/Resources/Settings.robot

*** Variables ***
#Meal Plan Product Selector Card Elements
${paleoMealPlanTitle}               Paleo Meal Plan
${vegetarianMealPlanTitle}          Vegetarian Meal Plan
${veganMealPlanTitle}               Vegan Meal Plan
${ketoMealPlanTitle}                Keto Meal Plan
${whole30ApprovedMealPlanTitle}     Whole30 Approved Meal Plan
${cleanMealPlanTitle}               Clean Meal Plan

#Meal Prep Product Selector Card Elements
${proteinMealPrepFrontCard}         Shrimp
${carbohydrateMealPrepFrontCard}    Quinoa and Brown Rice
${vegetablesMealPrepFrontCard}      Asparagus
${addBtnproteinMealPrepCardFront}
${addBtnproteinMealPrepCardBack}

#Classics Product Selector Card Elements
${classicsItemFrontCard}

*** Keywords ***
Navigate to Paleo Meal Plan Product Detail Page
     Click Link    ${paleoMealPlanTitle}

Navigate to Vegetarian Meal Plan Product Detail Page
    Click Link    ${vegetarianMealPlanTitle}

Navigate to Vegan Meal Plan Product Detail Page
    Click Link    ${veganMealPlanTitle}

Navigate to Keto Meal Plan Product Detail Page
    Click Link    ${ketoMealPlanTitle}

Navigate to Whole30Approved Meal Plan Product Detail Page
    Click Link    ${whole30ApprovedMealPlanTitle}

Navigate to Clean Meal Plan Product Detail Page
    Click Link    ${cleanMealPlanTitle}






