import { test, expect } from '@playwright/test';
import * as path from 'path';
import * as fs from 'fs';

test('TC-004: Download all files from download-tools page', async ({ page }) => {
  await page.goto('https://www.tmap.net/page/download-tools');

  // Download map in project root
  const downloadDir = path.resolve(process.cwd(), 'downloads-tools');
  fs.mkdirSync(downloadDir, { recursive: true });

  // Verzamel alle download-URLs
  const urls = await page.$$eval(
    'a[href]',
    (links: HTMLAnchorElement[]) =>
      links
        .map(link => link.href)
        .filter(href =>
          href.match(/\.(xlsx|xls|doc|docx|pdf|zip)$/i)
        )
  );

  expect(urls.length).toBeGreaterThan(0);
  console.log(`Found ${urls.length} downloadable files`);

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
