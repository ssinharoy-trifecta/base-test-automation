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

# Download and extract Selenium drivers into virtual environment location that is part of the PATH
# While these are hard-coded, the script only needs a starting version and will update with the
# latest version later in the script
if [[ ${OSTYPE} == 'linux-gnu'* ]]; then
    #Download Chromedriver
    curl https://chromedriver.storage.googleapis.com/103.0.5060.53/chromedriver_linux64.zip \
      > env/bin/chromedriver_linux64.zip
    #Download Geckdriver
    curl -L https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-linux64.tar.gz \
      > env/bin/geckodriver-v0.31.0-linux64.tar.gz
    #Download Edge
    curl https://msedgedriver.azureedge.net/103.0.1264.62/edgedriver_linux64.zip \
      > env/bin/edgedriver_linux64.zip
    #Unzip the files
    tar -xvf env/bin/geckodriver-v0.31.0-linux64.tar.gz  -C env/bin/
    unzip -o env/bin/chromedriver_linux64.zip -d env/bin/ 
    unzip -o env/bin/edgedriver_linux64.zip -d env/bin/ 
elif [[ ${OSTYPE} == 'darwin'* ]]; then
    #Download Chromedriver
    curl https://chromedriver.storage.googleapis.com/103.0.5060.53/chromedriver_mac64.zip \
      > env/bin/chromedriver_mac64.zip
    #Download Geckdriver
    curl -L https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-macos.tar.gz \
      > env/bin/geckodriver-v0.31.0-macos.tar.gz
    #Download Edge
    curl https://msedgedriver.azureedge.net/103.0.1264.62/edgedriver_mac64.zip \
      > env/bin/edgedriver_mac64.zip
    #Unzip the files
    tar -xvf env/bin/geckodriver-v0.31.0-macos.tar.gz  -C env/bin/
    unzip -o env/bin/chromedriver_mac64.zip -d env/bin/
    unzip -o env/bin/edgedriver_mac64.zip -d env/bin/
elif [[ ${OSTYPE} == 'cygwin'* || ${OSTYPE} == 'msys' ]]; then
    #Download Chromedriver
    curl https://chromedriver.storage.googleapis.com/103.0.5060.53/chromedriver_win32.zip \
      > env\bin\chromedriver_win32.zip
    #Download Geckdriver
    curl -L https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-win64.zip \
      > env\bin\geckodriver-v0.31.0-win64.zip
    #Download Edge
    curl https://msedgedriver.azureedge.net/103.0.1264.62/edgedriver_win64.zip \
      > env\bin\edgedriver_win64.zip
    powershell -command "Expand-Archive env\bin\chromedriver_win32.zip env\bin\ -Force"
    powershell -command "Expand-Archive env\bin\geckodriver-v0.31.0-win64.zip env\bin\ -Force"
    powershell -command "Expand-Archive env\bin\edgedriver_win64.zip env\bin\ -Force"
else 
    echo "ERROR: Unknown OS type";
fi

# Pip Install the items in the Requirements.txt file
pip3 install -U -r requirements.txt
webdrivermanager chrome firefox

echo "========================================================================"
echo "A Python virtual environment has been created for you.
This virtual environment contains all the python libraries required to run
Robot test cases.

Make sure to activate the virtual environment by running in the terminal -
\"source env/bin/activate\"

When you are finished working make sure to deactivate by running -
\"deactivate\""
echo "========================================================================"
