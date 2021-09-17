#!/bin/bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Update path to point to Homebrew
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# Install PyEnv, supporting PyEnv files, and Python3 
brew install pyenv
brew install python
brew install openssl readline sqlite3 xz zlib

# Install Pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

# Update the Bash Profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init --path)"' >> ~/.profile

# Update Path and PythonPath System variables
echo 'export PATH=${PWD}/SeleniumDrivers/mac:${PWD}/SeleniumDrivers/linux:${PWD}/SeleniumDrivers/win:/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH' >> ~/.profile
echo 'export PYTHONPATH=${PWD}/RobotFramework:${PWD}/RobotFramework/Libraries:/Library/Frameworks/Python.framework/Versions/3.9/bin:$PYTHONPATH' >> ~/.profile

# Enable AutoCompletion for PyEnv
echo 'eval "$(pyenv init -)"' >> ~/.bashrc 

# Enable PyEnv
source ~/.profile

# Pip Install the items in the Requirements.txt file
pip3 install -U -r requirements.txt

# PyEnv install Python 3.9.1
pyenv install 3.9.1

# Set 3.9.1 as the Python Version
pyenv global 3.9.1