*** Variables ***
${loginUrlRob}  https://test-magento-app-trifecta-uat3.trifecta.dev/customer/account/login

&{dangaCustData}              
...                       firstName=Dangan          
...                       lastName=Ronpa
...                       email=danganronpa2@trifecta.com      
...                       password=F4rF4r4w4y

&{mickeyCustData}              
...                       firstName=Micke          
...                       lastName=Y
...                       email=Mickey@trifecta.com      
...                       password=$MouseClubhouse!

&{dragonCustData}              
...                       firstName=Dragon          
...                       lastName=Lash
...                       email=Ognis@trifecta.com      
...                       password=Password!

@{CUSTLISTROB}
...                       ${dangaCustData}
...                       ${mickeyCustData}
...                       ${dragonCustData}
