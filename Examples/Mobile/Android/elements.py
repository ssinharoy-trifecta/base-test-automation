from appium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from appium.webdriver.common.mobileby import MobileBy
from appium.webdriver.common.touch_action import TouchAction


desired_cap = {
  "platformName": "Android",
  "deviceName": "AppiumP",
  "appPackage": "com.n_ix.pocket_wod",
  "appActivity": "com.n_ix.pocket_wod.activities.auth.AuthActivity"
}

driver = webdriver.Remote('http://localhost:4723/wd/hub', desired_cap)


driver.implicitly_wait(10)

el1 = driver.find_element_by_id("com.n_ix.pocket_wod:id/getStartedButton")
el1.click()

driver.implicitly_wait(10)
el2 = driver.find_element_by_xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.widget.Button")
el2.click()

driver.implicitly_wait(20)
el3 = driver.find_element_by_xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout/androidx.cardview.widget.CardView[1]/android.view.ViewGroup/android.widget.TextView[3]")
el3.click()

driver.implicitly_wait(10)
el4 = driver.find_element_by_id("com.n_ix.pocket_wod:id/weightView")
el4.click()

driver.implicitly_wait(10)
el5 = driver.find_element_by_id("com.n_ix.pocket_wod:id/first_value_edit_text")
el5.send_keys("200")

driver.implicitly_wait(10)
el6 = driver.find_element_by_id("com.n_ix.pocket_wod:id/set_button")
el6.click()

driver.implicitly_wait(10)
el7 = driver.find_element_by_id("com.n_ix.pocket_wod:id/addBtn")
el7.click()

driver.implicitly_wait(10)
el8 = driver.find_element_by_xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout/androidx.cardview.widget.CardView[2]/android.view.ViewGroup/android.widget.TextView[3]")
el8.click()

driver.implicitly_wait(10)
el9 = driver.find_element_by_id("com.n_ix.pocket_wod:id/add12ozBtn")
el9.click()

driver.implicitly_wait(10)
el10 = driver.find_element_by_id("com.n_ix.pocket_wod:id/addBtn")
el10.click()




print('SUCCESS!!!')

driver.quit()