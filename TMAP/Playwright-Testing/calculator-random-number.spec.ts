import { test, expect } from '@playwright/test';

test('TMAP Suite link works correctly', async ({ context, page }) => {
  await page.goto(
    'https://www.tmap.net/page/training-syllabi-sample-exams-and-tools/'
  );

  await Promise.all([
    page.waitForNavigation(),
    page.getByRole('link', { name: 'TMAP Suite' }).click(),
  ]);

  await expect(page).toHaveTitle(/TMAP Suite/i);
});

test('TMAP Calculator link works correctly', async ({ context, page }) => {
  await page.goto(
    'https://www.tmap.net/page/training-syllabi-sample-exams-and-tools/'
  );

  await Promise.all([
    page.waitForNavigation(),
    page.getByRole('link', { name: 'Calculator' }).click(),
  ]);

  await expect(page).toHaveTitle(/TMAP Calculator/i);
});


test.only('Calculator calculates correct result for random expression', async ({ page }) => {
  // 1. Open calculator page
  await page.goto('https://www.tmap.net/page/tmap-calculator/');

  // 2. Possible buttons
  const digits = ['0','1','2','3','4','5','6','7','8','9'];
  const operators = ['+','-','*'];

  // 3. Helper to pick random item
  const pickRandom = (list: string[]) =>
    list[Math.floor(Math.random() * list.length)];

  // 4. Pick random digits and operator
  const d1 = pickRandom(digits);
  const d2 = pickRandom(digits);
  const d3 = pickRandom(digits);
  const op = pickRandom(operators);
  const d4 = pickRandom(digits);

  // 5. Build numbers
  const leftNumber = Number(`${d1}${d2}${d3}`);
  const rightNumber = Number(d4);

  // 6. Calculate expected result
  let expectedResult: number;

  switch (op) {
    case '+':
      expectedResult = leftNumber + rightNumber;
      break;
    case '-':
      expectedResult = leftNumber - rightNumber;
      break;
    case '*':
      expectedResult = leftNumber * rightNumber;
      break;
    default:
      throw new Error('Unsupported operator');
  }

  console.log(`Expression tested: ${leftNumber} ${op} ${rightNumber} = ${expectedResult}`);

  // 7. Click buttons on calculator
  await page.getByRole('button', { name: d1 }).click();
  await page.getByRole('button', { name: d2 }).click();
  await page.getByRole('button', { name: d3 }).click();
  await page.getByRole('button', { name: op }).click();
  await page.getByRole('button', { name: d4 }).click();
  await page.getByRole('button', { name: '=' }).click();

  // 8. Read display value DIRECTLY from browser context
  const actualValue = await page.evaluate(() => {
    const display = document.getElementById('display') as HTMLInputElement | null;
    return display?.value ?? '';
  });

  // 9. Clean the value
  const cleanedValue = actualValue.replace(/[^0-9\-]/g, '');

  console.log(`Calculator shows: "${actualValue}" → cleaned: "${cleanedValue}"`);

  // 10. Compare expected vs actual
  expect(Number(cleanedValue)).toBe(expectedResult);
});
