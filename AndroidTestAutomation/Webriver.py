from appium import webdriver


class Driver:
    def __init__(self):
        desired_cap = {
            'platformName': 'Android',
            'deviceName': 'SM-A102U1',
            'appPackage': 'com.n_ix.pocket_wod',
            'appActivity': 'com.n_ix.pocket_wod.activities.auth.AuthActivity'
        }
        self.instance = webdriver.Remote('http://localhost:4723/wd/hub', desired_cap)


