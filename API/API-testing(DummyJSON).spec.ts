import { test, expect } from '@playwright/test';

test('API - get products 1 to 3', async ({ request }) => {

  for (let id = 1; id <= 3; id++) {

    const response = await request.get(`https://dummyjson.com/products/${id}`);

    expect(response.status()).toBe(200);

    const body = await response.json();

    console.log(
      'ID:', body.id,
      'Title:', body.title,
      'Price:', body.price
    );
  }

});

test('API - product does not exist', async ({ request }) => {
  const response = await request.get('https://dummyjson.com/products/99999');

  expect(response.status()).toBe(404);
});


