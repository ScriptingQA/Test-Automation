from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


# --- Keyword (functie) ---
def perform_valid_login(driver):
    driver.find_element(By.ID, "username").send_keys("student")
    driver.find_element(By.ID, "password").send_keys("Password123")
    driver.find_element(By.ID, "submit").click()


# --- Test ---
driver = webdriver.Chrome()
driver.get("https://practicetestautomation.com/practice-test-login/")

WebDriverWait(driver, 10).until(
    EC.visibility_of_element_located((By.ID, "username"))
)

perform_valid_login(driver)

WebDriverWait(driver, 10).until(
    EC.visibility_of_element_located((By.TAG_NAME, "h1"))
)

assert "Logged In Successfully" in driver.page_source
driver.save_screenshot("after_login.png")
#print("TEST PASSED: Login successful") - Als je screenshot wilt nemen.

driver.quit()
