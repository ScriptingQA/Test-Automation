import { test, expect } from '@playwright/test';
import * as path from 'path';
import * as fs from 'fs';

test('TC-003: Download all XLSX and DOC files from checklist page', async ({ page }) => {
  await page.goto('https://www.tmap.net/page/download-checklists/');

  const downloadDir = path.resolve(process.cwd(), 'downloads');
  fs.mkdirSync(downloadDir, { recursive: true });

  const urls = await page.$$eval(
    'a[href*=".xlsx"], a[href*=".doc"], a[href*=".docx"]',
    (links: HTMLAnchorElement[]) => links.map(link => link.href)
  );

  expect(urls.length).toBeGreaterThan(0);
  console.log(`Found ${urls.length} files`);

  for (const url of urls) {
    const [download] = await Promise.all([
      page.waitForEvent('download'),
      page.evaluate(url => {
        window.location.href = url;
      }, url),
    ]);

    const filePath = path.join(
      downloadDir,
      download.suggestedFilename()
    );

    await download.saveAs(filePath);
    console.log(`Downloaded: ${download.suggestedFilename()}`);
  }
});


