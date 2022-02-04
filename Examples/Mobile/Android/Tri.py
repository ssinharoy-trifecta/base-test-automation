from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from appium.webdriver.common.mobileby import MobileBy
from appium.webdriver.common.touch_action import TouchAction
from Webdriver import Driver


class Trifecta:
    def __init__(self, driver):
        self.driver = driver
        self.wait = WebDriverWait(self.driver.instance, 20)

    def login(self):
        self.driver.instance.implicitly_wait(20)
        get_started = self.driver.instance.find_element_by_id("com.n_ix.pocket_wod:id/getStartedButton")
        get_started.click()

        self.driver.instance.implicitly_wait(20)
        log_in = self.driver.instance.find_element_by_xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.widget.Button")
        log_in.click()

        self.driver.instance.implicitly_wait(20)
        tap_macros = self.driver.instance.find_element_by_xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[1]/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.LinearLayout[1]/android.view.ViewGroup/android.widget.TextView[2]")
        tap_macros.click()

    def weight_card(self):
        self.driver.instance.implicitly_wait(20)
        add_weight = self.driver.instance.find_element_by_xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout/androidx.cardview.widget.CardView[1]/android.view.ViewGroup/android.widget.TextView[3]")
        add_weight.click()

        self.driver.instance.implicitly_wait(20)
        weight_input_field = self.driver.instance.find_element_by_id("com.n_ix.pocket_wod:id/weightView")
        weight_input_field.click()
        
        self.driver.instance.implicitly_wait(20)
        input_weight = self.driver.instance.find_element_by_id("com.n_ix.pocket_wod:id/first_value_edit_text")
        input_weight.send_keys("200")

        self.driver.instance.implicitly_wait(20)
        tap_set = self.driver.instance.find_element_by_id("com.n_ix.pocket_wod:id/set_button")
        tap_set.click()

        self.driver.instance.implicitly_wait(20)
        tap_add_weight = self.driver.instance.find_element_by_id("com.n_ix.pocket_wod:id/addBtn")
        tap_add_weight.click()


    def water_card(self):
        self.driver.instance.implicitly_wait(20)
        add_water = self.driver.instance.find_element_by_xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout/androidx.cardview.widget.CardView[2]/android.view.ViewGroup/android.widget.TextView[3]")
        add_water.click()

        self.driver.instance.implicitly_wait(20)
        tap_8oz = self.driver.instance.find_element_by_id("com.n_ix.pocket_wod:id/add8ozBtn")
        tap_8oz.click()

        self.driver.instance.implicitly_wait(20)
        tap_add_water = self.driver.instance.find_element_by_id("com.n_ix.pocket_wod:id/addBtn")
        tap_add_water.click()

        self.driver.instance.implicitly_wait(20)
        add_water = self.driver.instance.find_element_by_xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout/androidx.cardview.widget.CardView[2]/android.view.ViewGroup/android.widget.TextView[3]")
        add_water.click()

        self.driver.instance.implicitly_wait(20)
        tap_12oz = self.driver.instance.find_element_by_id("com.n_ix.pocket_wod:id/add12ozBtn")
        tap_12oz.click()

        self.driver.instance.implicitly_wait(20)
        tap_add_water = self.driver.instance.find_element_by_id("com.n_ix.pocket_wod:id/addBtn")
        tap_add_water.click()

        self.driver.instance.implicitly_wait(20)
        add_water = self.driver.instance.find_element_by_xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/androidx.viewpager.widget.ViewPager/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout/androidx.cardview.widget.CardView[2]/android.view.ViewGroup/android.widget.TextView[3]")
        add_water.click()

        self.driver.instance.implicitly_wait(20)
        tap_16oz = self.driver.instance.find_element_by_id("com.n_ix.pocket_wod:id/add16ozBtn")
        tap_16oz.click()

        self.driver.instance.implicitly_wait(20)
        tap_add_water = self.driver.instance.find_element_by_id("com.n_ix.pocket_wod:id/addBtn")
        tap_add_water.click()