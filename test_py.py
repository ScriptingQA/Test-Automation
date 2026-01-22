from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def perform_valid_login(driver):
    driver.find_element(By.ID, "username").send_keys("student")
    driver.find_element(By.ID, "password").send_keys("Password123")
    driver.find_element(By.ID, "submit").click()

def perform_invalid_username(driver):
    driver.find_element(By.ID, "username").send_keys("wronguser")
    driver.find_element(By.ID, "password").send_keys("Password123")
    driver.find_element(By.ID, "submit").click()

def perform_invalid_password(driver):
    driver.find_element(By.ID, "username").send_keys("student")
    driver.find_element(By.ID, "password").send_keys("incorrectPassword")
    driver.find_element(By.ID, "submit").click()

def testcase_1():
    driver = webdriver.Chrome()
    driver.get("https://practicetestautomation.com/practice-test-login/")

    WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.ID, "username"))
    )
    
    perform_valid_login(driver)

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

    perform_invalid_username(driver)

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

    perform_invalid_password(driver)

    WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.ID, "error"))
    )

    assert "Your password is invalid!" in driver.page_source
    print("TC3 PASSED")

    driver.quit()

#testcase_3()

#Testcase 4
def testcase_4():
    driver = webdriver.Chrome()
    wait = WebDriverWait(driver, 15)
    driver.get("https://practicetestautomation.com/practice-test-login/")

    wait.until(EC.visibility_of_element_located((By.ID, "username")))
    perform_valid_login(driver)

    wait.until(EC.url_contains("logged-in-successfully"))

    wait.until(
        EC.element_to_be_clickable((By.XPATH, "//a[text()='Practice']"))
    ).click()

    wait.until(
        EC.element_to_be_clickable((By.XPATH, "//a[text()='Test Exceptions']"))
    ).click()

    wait.until(EC.visibility_of_element_located((By.ID, "row1")))

    driver.find_element(By.ID, "add_btn").click()

    wait.until(EC.text_to_be_present_in_element(
        (By.ID, "confirmation"), "Row 2 was added"
    ))

    input_row2 = wait.until(
        EC.element_to_be_clickable((By.CSS_SELECTOR, "#row2 input"))
    )

    input_row2.clear()
    input_row2.send_keys("Potato")

    print("TC4 PASSED: Favorite food added")

    driver.quit()

#testcase_4()

#Testcase_5()
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def testcase_5():
    driver = webdriver.Chrome()
    wait = WebDriverWait(driver, 10)

    try:
        driver.get("https://practicetestautomation.com/practice-test-exceptions/")
        driver.maximize_window()

        wait.until(EC.element_to_be_clickable((By.ID, "add_btn"))).click()

        input_field = wait.until(
            EC.visibility_of_element_located((By.CSS_SELECTOR, "#row2 input"))
        )
        input_field.send_keys("Potato")

        wait.until(
            EC.text_to_be_present_in_element(
                (By.TAG_NAME, "body"), "Row 2 was added"
            )
        )

        wait.until(
            EC.element_to_be_clickable(
                (By.CSS_SELECTOR, '#row2 button[name="Save"]')
            )
        ).click()

        wait.until(
            EC.text_to_be_present_in_element(
                (By.TAG_NAME, "body"), "Row 2 was saved"
            )
        )

        print("✅ Test geslaagd")

    finally:
        driver.quit()

testcase_5()


