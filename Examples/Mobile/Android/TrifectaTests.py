import unittest
from Tri import Trifecta
from Webdriver import Driver


class HappyPath(unittest.TestCase):
    def setUp(self):
        self.driver = Driver()

    def test_happy_path(self):
        test_log_in = Trifecta(self.driver)
        test_log_in.login()

        test_weight_card = Trifecta(self.driver)
        test_weight_card.weight_card()

        test_water_card = Trifecta(self.driver)
        test_water_card.water_card()


    def tearDown(self):
        self.driver.instance.quit()

if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(HappyPath)
    unittest.TextTestRunner(verbosity=1).run(suite)