from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


#Testcase 1
def testcase_1():
    driver = webdriver.Chrome()
    driver.get("https://practicetestautomation.com/practice-test-login/")

    WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.ID, "username"))
    )

    driver.find_element(By.ID, "username").send_keys("student")
    driver.find_element(By.ID, "password").send_keys("Password123")
    driver.find_element(By.ID, "submit").click()

    assert "Logged In Successfully" in driver.page_source
    print("TC1 PASSED")

    driver.quit()

#testcase_1() - Only running this Testcase. Put in Terminal: python test_py.py

#Testcase 2
def testcase_2():
    driver = webdriver.Chrome()
    driver.get("https://practicetestautomation.com/practice-test-login/")

    WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.ID, "username"))
    )

    driver.find_element(By.ID, "username").send_keys("wronguser")
    driver.find_element(By.ID, "password").send_keys("Password123")
    driver.find_element(By.ID, "submit").click()

    WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.ID, "error"))
    )

    assert "Your username is invalid!" in driver.page_source
    print("TC2 PASSED")

    driver.quit()

#testcase_2()

#Testcase 3
def testcase_3():
    driver = webdriver.Chrome()
    driver.get("https://practicetestautomation.com/practice-test-login/")

    WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.ID, "username"))
    )

    driver.find_element(By.ID, "username").send_keys("student")
    driver.find_element(By.ID, "password").send_keys("incorrectPassword")
    driver.find_element(By.ID, "submit").click()

    WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.ID, "error"))
    )

    assert "Your password is invalid!" in driver.page_source
    print("TC3 PASSED")

    driver.quit()

#testcase_3()
