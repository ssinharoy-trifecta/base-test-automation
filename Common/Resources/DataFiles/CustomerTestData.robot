# TODO: Use data driven tests and expand dictionaries to use a wide variety of customer data.

*** Variable ***
${testCaseEmail}          selenium+default@trifectanutrition.com
${firstName}              Elden
${lastName}               Ring
${password}               tester123!
${address1}               428 Ti Street   
${address2}               Suite 800
${city}                   Sacramento
${zip}                    34122
${phone}                  5305648388 
#Customer Dictionary
&{customerInfo}
...                       firstName=${firstName}
...                       lastName=${lastName}
...                       email=${testCaseEmail}
...                       password=${password}
...                       address1=${address1}
...                       address2=${address2}
...                       city=${city}
...                       zip=${zip}
...                       phone=${phone}
