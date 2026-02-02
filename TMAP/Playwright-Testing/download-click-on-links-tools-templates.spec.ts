import { test, expect } from '@playwright/test';

test('From checklist page, click Download tools via checklists', async ({ page }) => {
  await page.goto('https://www.tmap.net/page/download-checklists/');

  await page.getByRole('link', { name: 'Download tools' }).click();

  await expect(page).toHaveURL(/\/page\/download-tools/);
});

test('From checklist page, click Download templates via checklists', async ({ page }) => {
  await page.goto('https://www.tmap.net/page/download-checklists/');

  await page.getByRole('link', { name: 'Download templates' }).click();

  await expect(page).toHaveURL(/\/page\/download-templates/);
});

test('From checklist page, click Download checklists via tools', async ({ page }) => {
  await page.goto('https://www.tmap.net/page/download-tools/');

  await page.getByRole('link', { name: 'Download checklists' }).click();

  await expect(page).toHaveURL(/\/page\/download-checklists/);
});

test('From checklist page, click Download templates via tools', async ({ page }) => {
  await page.goto('https://www.tmap.net/page/download-tools/');

  await page.getByRole('link', { name: 'Download templates' }).click();

  await expect(page).toHaveURL(/\/page\/download-templates/);
});

test('From checklist page, click Download checklists via templates', async ({ page }) => {
  await page.goto('https://www.tmap.net/page/download-templates/');

  await page.getByRole('link', { name: 'Download checklists' }).click();

  await expect(page).toHaveURL(/\/page\/download-checklists/);
});

test('From checklist page, click Download tools via templates', async ({ page }) => {
  await page.goto('https://www.tmap.net/page/download-templates/');

  await page.getByRole('link', { name: 'Download tools' }).click();

  await expect(page).toHaveURL(/\/page\/download-tools/);
});