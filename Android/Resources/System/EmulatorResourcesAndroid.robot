*** Keywords ***

Launch Android Application on Emulator
    Open Application    http://localhost:4723/wd/hub
    ...                 platformName=Android
    ...                 platformVersion=12
    ...                 deviceName=99051FFBA006Z4
    ...                 appPackage=com.n_ix.pocket_wod
    ...                 appActivity=MainActivity