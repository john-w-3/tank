Fetch an Amazon product page using Playwright with the stealth plugin to bypass bot detection. Extract and display:

- Product title, brand, price (and any sale/list price)
- Star rating and number of reviews
- Size/style options if applicable
- Feature bullet points
- Technical specs / product details table
- Best Sellers Rank
- Top review highlights (themes, pros, cons)

Use this Node.js script pattern via Bash:

```
node -e "
const { chromium } = require('playwright-extra');
const stealth = require('puppeteer-extra-plugin-stealth')();
chromium.use(stealth);
(async () => {
  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage();
  await page.goto('THE_URL', { waitUntil: 'domcontentloaded', timeout: 30000 });
  await page.waitForTimeout(2000);
  // Extract title
  const title = await page.\$eval('#productTitle', el => el.textContent.trim()).catch(() => 'N/A');
  // Extract price
  const price = await page.\$eval('.a-price .a-offscreen', el => el.textContent.trim()).catch(() => 'N/A');
  // Extract rating
  const rating = await page.\$eval('#acrPopover .a-icon-alt', el => el.textContent.trim()).catch(() => 'N/A');
  const reviewCount = await page.\$eval('#acrCustomerReviewText', el => el.textContent.trim()).catch(() => 'N/A');
  // Extract feature bullets
  const bullets = await page.\$\$eval('#feature-bullets li .a-list-item', els => els.map(e => e.textContent.trim()).filter(t => t.length > 0)).catch(() => []);
  // Extract tech specs
  const specs = await page.\$\$eval('#productDetails_techSpec_section_1 tr, #prodDetails .a-row', els => els.map(e => e.textContent.trim())).catch(() => []);
  // Extract detail table
  const details = await page.\$\$eval('.a-keyvalue tr, #detailBullets_feature_div li', els => els.map(e => e.textContent.trim())).catch(() => []);
  // Full page text for anything missed
  const bodyText = await page.\$eval('body', el => el.innerText).catch(() => '');
  console.log(JSON.stringify({ title, price, rating, reviewCount, bullets, specs, details, bodyText }, null, 2));
  await browser.close();
})();
"
```

Replace THE_URL with the Amazon URL provided as $ARGUMENTS. Clean the URL to just the /dp/ASIN path if needed.

After extracting, present the product info clearly formatted in markdown, then give an assessment of whether it's a good fit for the shrimp tank project (6-gallon Aqueon Frameless cube, Neocaridina shrimp, sponge filter + air pump setup).
