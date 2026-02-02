import { test, expect } from '@playwright/test';
import * as path from 'path';
import * as fs from 'fs';

test('TC-005: Download all files from download-templates page', async ({ page }) => {
  test.setTimeout(3 * 60 * 1000);

  await page.goto('https://www.tmap.net/page/download-templates/');

  const downloadDir = path.resolve(process.cwd(), 'downloads-templates');
  fs.mkdirSync(downloadDir, { recursive: true });

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
