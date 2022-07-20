import sys
from dotenv import dotenv_values

def Retrieve_DotEnv(path_to_dotenv):
  # If called via Robot, the `path_to_dotenv` is passed as a parameter:
  #   ${envVars}=  GetEnvVars.Retrieve_DotEnv  ${pathToDotEnv}
  # If called via CLI, it is also passed as a parameter:
  #   "python3 tests/Robot/Common/Resources/GetEnvVars.py '.env'"
  myDotEnv = dotenv_values(path_to_dotenv)
  return myDotEnv

print(Retrieve_DotEnv(str(sys.argv[1])))
