# راهنمای وب پنل‌های سرطان ژنوم

این بسته یک وب‌اپ استاتیک و واکنش‌گراست. صفحهٔ اصلی از `catalog.js` داده می‌خواند و بدون اتصال Supabase هم کار می‌کند. با تنظیم Project URL و Publishable Key، فهرست پنل‌ها را از Supabase می‌خواند.

## راه‌اندازی Supabase

1. در Supabase یک پروژه بسازید.
2. از منوی SQL Editor یک Query جدید باز کنید. محتوای `supabase/schema.sql` را اجرا کنید.
3. Query دیگری باز کنید و محتوای `supabase/seed.sql` را اجرا کنید.
4. از Connect یا Settings → API Keys، Project URL و Publishable Key پروژه را بردارید.
5. در `index.html`، شیء `cfg` را با مقادیر پروژه تکمیل کنید:

```js
const cfg = {
  supabaseUrl: 'https://YOUR_PROJECT.supabase.co',
  supabasePublishableKey: 'sb_publishable_...'
};
```

Publishable Key برای کد مرورگر ساخته شده و سیاست‌های RLS دسترسی آن را محدود می‌کنند. Secret Key را در `index.html` یا GitHub قرار ندهید. [مستندات رسمی کلیدهای Supabase](https://supabase.com/docs/guides/getting-started/api-keys)

## انتشار در GitHub Pages

1. فایل ZIP را از حالت فشرده خارج کنید.
2. در GitHub یک مخزن جدید بسازید.
3. محتوای پوشه را در ریشهٔ مخزن بارگذاری کنید؛ یعنی `index.html` باید مستقیماً در کنار `catalog.js` و پوشه‌های `assets` و `supabase` باشد.
4. در مخزن، Settings → Pages را باز کنید.
5. در Build and deployment، گزینهٔ Deploy from a branch را بزنید؛ شاخهٔ `main` و پوشهٔ `/(root)` را انتخاب و Save کنید.
6. پس از پایان انتشار، نشانی GitHub Pages در همان بخش نمایش داده می‌شود.

[راهنمای رسمی انتشار GitHub Pages از شاخه](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)

## فایل‌ها و داده‌ها

- `index.html`: رابط وب، جست‌وجو، فیلتر سرطان و اتصال Supabase.
- `catalog.js`: کاتالوگ محلی شامل ۱۶ پنل، از جمله **OncoMap**.
- `assets/`: لوگو و فونت‌های IRANYekanX.
- `supabase/schema.sql`: ساخت جدول‌ها، ایندکس‌ها و سیاست‌های فقط خواندنی.
- `supabase/seed.sql`: دادهٔ اولیهٔ پنل‌ها و نشانگرها.

سیاست‌های RLS فقط خواندن عمومی را مجاز می‌کنند؛ اطلاعات بیمار و دادهٔ پروندهٔ تشخیصی در این پروژه ذخیره نمی‌شود. داده‌های ژنی OncoMap فقط شامل نمادهایی است که در فهرست‌های آزموده‌شدهٔ گزارش فنی صریحاً درج شده‌اند. راهنماهای پزشکی و زمان پاسخ را برای استفادهٔ عملی با مرکز تطبیق دهید.
