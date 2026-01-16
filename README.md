# UI Test Automation Portfolio

This repository contains frontend UI test automation examples implemented using Robot Framework and Python with Selenium.

The project demonstrates how the same functional scenarios can be automated using both a keyword-driven approach and a code-driven approach.

---

## Project Scope

This project automates functional UI scenarios for demo web applications, focusing on real user behavior and UI validation.

Covered areas include:
- Login functionality
- Negative authentication scenarios
- UI state validation
- Form interaction
- Cart and checkout flows
- Error handling and timeout behavior

---

## Technologies Used

- Robot Framework
- SeleniumLibrary
- Python
- Selenium WebDriver
- Google Chrome
- Visual Studio Code

---

## Project Structure

The repository contains the following files:
- test.robot  
  Robot Framework test cases

- login_keywords.resource  
  Reusable Robot Framework keywords

- test_py.py  
  Python Selenium test cases

---

## Robot Framework Keywords

Reusable keywords are defined in the file login_keywords.resource.

### Authentication Keywords

- Perform Valid Login  
  Logs in with valid credentials and verifies successful login

- Perform Invalid Username  
  Attempts login with an incorrect username and validates the error message

- Perform Invalid Password  
  Attempts login with an incorrect password and validates the error message

### SauceDemo Keywords

- Perform Valid Login SauceDemo  
  Logs in to SauceDemo with a standard user

- Information Buyer  
  Fills in buyer information during checkout

- Overview Checkout  
  Validates the checkout overview page content

---

## Robot Framework Test Cases

The Robot Framework test cases are implemented in test.robot.

### Authentication Tests

- Login With Valid Credentials
- Login With Invalid Username
- Login With Invalid Password

### UI and Functional Tests

- UI State Validation  
  Verifies page content, element visibility, URL state, and absence of error messages

- TimeoutException  
  Verifies behavior when elements do not appear within the expected time

### Practice Test Automation Scenarios

- Login And Add Your Favorite Foods
- Go To Link And Save Your Favorite Food
- Change Disabled Text With Edit

### SauceDemo End-to-End Scenario

- Add To Cart – SauceDemo  
  Logs in, adds products to the cart, verifies cart count, completes checkout, validates total price, and confirms order completion

---

## Python Selenium Test Cases

Python Selenium tests are implemented in test_py.py.

- Testcase 1 – Valid Login  
  Verifies successful login using valid credentials

- Testcase 2 – Invalid Username  
  Verifies error message when an incorrect username is used

- Testcase 3 – Invalid Password  
  Verifies error message when an incorrect password is used

Each Python test:
- Opens the browser
- Performs the test steps
- Validates the expected result using assertions
- Closes the browser

---

## How to Run Robot Framework Tests

To run the Robot Framework test cases:
- Open a terminal
- Navigate to the project directory
- Run the following command:

robot test.robot

During execution:
- The browser opens and executes the tests
- Robot Framework generates a report and log file
- Results can be reviewed in the generated report

---

## How to Run Python Selenium Tests

To run the Python Selenium test cases:
- Open a terminal
- Navigate to the project directory
- Open test_py.py
- Uncomment the testcase you want to execute
- Run the script using:

python test_py.py

Only the uncommented testcase will run.

---

## Key Concepts Demonstrated

- Frontend UI automation
- Keyword-driven testing with Robot Framework
- Code-driven testing with Python Selenium
- Explicit waits instead of static sleeps
- UI validation using assertions
- End-to-end checkout flow automation

---

## Notes

- Selenium version 4 automatically manages browser drivers
- No manual WebDriver installation is required
- This project focuses on functional coverage and learning, not production framework complexity

---

## Purpose of This Repository

This repository serves as:
- A learning project for UI test automation
- A personal automation portfolio
- A demonstration of Robot Framework and Python Selenium skills
- A reference for translating Robot Framework tests into Python
