# TODO: Use data driven tests and expand dictionaries to use a wide variety of customer data.

*** Variable ***
# Customer 1
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

# Customer 2
${testCaseEmail2}         multiversus@trifectanutrition.com
${firstName2}             Super
${lastName2}              Man
${password2}              BugsBunny123!
${address1_2}             1001 Finn Street
${address2_2}             
${city2}                  Jake
${zip2}                   10027
${phone2}                 7282022100 
#Customer Dictionary
&{customerInfo2}
...                       firstName=${firstName2}
...                       lastName=${lastName2}
...                       email=${testCaseEmail2}
...                       password=${password2}
...                       address1=${address1_2}
...                       address2=${address2_2}
...                       city=${city2}
...                       zip=${zip2}
...                       phone=${phone2}
