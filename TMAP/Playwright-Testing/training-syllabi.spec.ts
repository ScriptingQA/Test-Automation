import { test, expect } from '@playwright/test';

test('TMAP training syllabi PDF links work', async ({ context, page }) => {
  await page.goto(
    'https://www.tmap.net/page/training-syllabi-sample-exams-and-tools/'
  );

  const links = [
    /Syllabus QCFT \(EN\)/i,
    /Sample Exam QCFT \(EN\)/i,
    /Syllabus PERF \(EN\)/i,
    /Sample Exam PERF \(EN\)/i,
  ];

  for (const linkText of links) {
    const pagePromise = context.waitForEvent('page');

    await page.getByRole('link', { name: linkText }).click();

    const pdfPage = await pagePromise;

    // Wait until the PDF request happens on the new page
    const response = await pdfPage.waitForResponse(
      resp =>
        resp.url().toLowerCase().endsWith('.pdf') &&
        resp.status() === 200
    );

    expect(response.ok()).toBeTruthy();

    await pdfPage.close();
  }
});