import { test, expect } from '@playwright/test';

test('From checklist page, click Download templates', async ({ page }) => {
  await page.goto('https://www.tmap.net/page/download-checklists/');

  await page.getByRole('link', { name: 'Download templates' }).click();

  await expect(page).toHaveURL(/\/page\/download-templates/);
});
