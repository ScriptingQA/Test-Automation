import { test, expect } from '@playwright/test';

test('User can log in successfully', async ({ page }) => {
  // 1. Open the login page
  await page.goto('https://practicetestautomation.com/practice-test-login/');

  // 2. Fill in username
  await page.locator('#username').fill('student');

  // 3. Fill in password
  await page.locator('#password').fill('Password123');

  // 4. Click the Login button
  await page.locator('#submit').click();

  // 5. Verify login was successful
  await expect(page).toHaveURL(/logged-in-successfully/);
  await expect(page.locator('h1')).toHaveText('Logged In Successfully');
});
