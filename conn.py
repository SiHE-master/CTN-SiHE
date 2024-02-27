from selenium import webdriver

url = "http://1.2.3.4/"

options = webdriver.FirefoxOptions()
options.add_argument('--headless')
# driver = webdriver.Firefox(firefox_options=options)
driver = webdriver.Firefox(executable_path='/usr/local/bin/geckodriver')
driver.get(url)
driver.maximize_window()
driver.find_element_by_name("username").clear()
driver.find_element_by_name("username").send_keys("10105552")
driver.find_element_by_name("password").clear()
driver.find_element_by_name("password").send_keys("D201477500zp")
driver.find_element_by_id("mobilelogin_submit").click()
driver.quit()
