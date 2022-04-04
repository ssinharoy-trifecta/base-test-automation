#!/bin/bash

# confirm that Python3 is installed on the system
pythonVersion=$(python3 -V)

if [[ "$pythonVersion" == 'Python 3'* ]]; then
    echo "Python3 is installed";
else
    echo "Please install Python3 on this system";
    exit;
fi

# create virtual env
python3 -m venv env

# activate virtual env
source env/bin/activate

# Pip Install the items in the Requirements.txt file
pip3 install -U -r requirements.txt
webdrivermanager chrome firefox

# Move Selenium drivers into virtual environment location that is part of the PATH
if [[ ${OSTYPE} == 'linux-gnu'* ]]; then
    # move linux contents
    cp -r SeleniumDrivers/linux/ env/bin
elif [[ ${OSTYPE} == 'darwin'* ]]; then
    # move mac contents
    cp -r SeleniumDrivers/mac/ env/bin
elif [[ ${OSTYPE} == 'cygwin'* || ${OSTYPE} == 'msys' ]]; then
    # move win contents
    cp -r SeleniumDrivers/win/ env/bin
else 
    echo "ERROR: Unknown OS type";
fi
echo "========================================================================"
echo "A Python virtual environment has been created for you.
This virtual environment contains all the python libraries required to run
Robot test cases.

Make sure to activate the virtual environment by running in the terminal -
\"source env/bin/activate\"

When you are finished working make sure to deactivate by running -
\"deactivate\""
echo "========================================================================"