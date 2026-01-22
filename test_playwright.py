import os
from playwright.sync_api import sync_playwright

#Testcase 1 - Correct login
def testcase_1():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=False)
        page = browser.new_page()
        page.goto("https://the-internet.herokuapp.com/login")
        page.fill("#username", "tomsmith")
        page.fill("#password", "SuperSecretPassword!")
        page.click("button[type='submit']")
        page.wait_for_selector("text=You logged into a secure area!")
        print("PRACTICE TEST PASSED: Login successful")

        browser.close()

#Testcase 2 - Wrong Username
def testcase_2():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=False)
        page = browser.new_page()
        page.goto("https://practicetestautomation.com/practice-test-login/")
        page.fill("#username", "wronguser")
        page.fill("#password", "Password123")
        page.click("#submit")
        page.wait_for_selector("text=Your username is invalid!")
        print("NEGATIVE TEST: Wrong username handled correctly")

        browser.close()

#Testcase 3 - Wrong Password
def testcase_3():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=False)
        page = browser.new_page()
        page.goto("https://practicetestautomation.com/practice-test-login/")
        page.fill("#username", "student")
        page.fill("#password", "WrongPassword")
        page.click("#submit")
        page.wait_for_selector("text=Your password is invalid!")
        print("NEGATIVE TEST: Wrong password handled correctly")

        browser.close()

DOWNLOAD_DIR = "C:/Users/rgunes/Downloads/playwright"
FILENAME = "tmpu0qoxd7t.txt"

def testcase_4():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=False)
        page = browser.new_page()

        page.goto("https://the-internet.herokuapp.com/download")

        with page.expect_download() as download_info:
            page.click(f"text={FILENAME}")

        download = download_info.value

        file_path = os.path.join(DOWNLOAD_DIR, FILENAME)
        download.save_as(file_path)

        if os.path.exists(file_path):
            print(f"Download gelukt: {file_path}")
        else:
            raise Exception("Download mislukt: bestand niet gevonden")

        browser.close()

testcase_4()

