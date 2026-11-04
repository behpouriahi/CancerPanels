# آموزش انتشار وب‌اپ ژنوم در Supabase و GitHub Pages

## بخش اول: آماده‌سازی دیتابیس Supabase

1. وارد [Supabase](https://supabase.com/dashboard) شوید و یک پروژهٔ جدید بسازید.
2. از منوی سمت چپ، **SQL Editor** را باز کنید و **New query** را بزنید.
3. فایل `supabase/run-all.sql` داخل بسته را با یک ویرایشگر متن باز کنید. همهٔ محتوا را انتخاب کنید (Mac: `Command+A`) و کپی کنید (`Command+C`).
4. به تب Supabase برگردید، داخل کادر SQL کلیک کنید، همهٔ متن قبلی را انتخاب و حذف کنید، سپس کد را بچسبانید (`Command+V`).
5. دکمهٔ **Run** را پایین یا بالای ادیتور بزنید؛ در مک می‌توانید `Command+Enter` را هم استفاده کنید. تا وقتی پیام موفقیت نمایش داده نشده، تب را نبندید.
6. برای اطمینان، در همان SQL Editor یک **New query** باز کنید، این را اجرا کنید و نتیجه را ببینید:

```sql
select count(*) from public.panel_catalog;
```

نتیجه باید `16` باشد. برای دیدن نام دقیق پنل OncoMap هم اجرا کنید:

```sql
select id, name from public.panel_catalog where name = 'OncoMap';
```

باید یک ردیف با نام `OncoMap` ببینید. فایل واحد، هم جدول‌ها و دسترسی خواندن را می‌سازد و هم ۱۶ پنل و نشانگرهای ژنی را وارد می‌کند.

7. از صفحهٔ پروژه، **Connect** را بزنید یا بروید به **Settings → API Keys**. این دو مقدار را بردارید:
   - **Project URL**، شبیه `https://abcdefgh.supabase.co`
   - **Publishable Key**، کلیدی که با `sb_publishable_` شروع می‌شود

از Secret Key استفاده نکنید. کلید Publishable برای برنامهٔ مرورگر است و سیاست‌های RLS دسترسی آن را فقط به خواندن محدود می‌کنند. جزئیات در [مستندات رسمی API Keys](https://supabase.com/docs/guides/getting-started/api-keys) آمده است.

## بخش دوم: وصل کردن صفحه به Supabase

1. در پوشهٔ بسته، فایل `index.html` را با یک ویرایشگر متن باز کنید.
2. عبارت `const cfg` را جست‌وجو کنید. این بخش را با مقدارهای پروژه عوض کنید:

```js
const cfg={
  supabaseUrl:'https://abcdefgh.supabase.co',
  supabasePublishableKey:'sb_publishable_کلید_پروژه'
};
```

3. فایل را ذخیره کنید. این صفحه علاوه بر دیتابیس، نسخهٔ محلی کاتالوگ را هم دارد؛ پس اگر اتصال Supabase هنوز تنظیم نشده باشد، صفحه با داده‌های محلی نمایش داده می‌شود.

## بخش سوم: انتشار فایل‌ها در GitHub Pages

1. ZIP را از حالت فشرده خارج کنید.
2. در GitHub یک **New repository** بسازید. برای مثال نام `genome-oncomap` را انتخاب کنید. مخزن را **Public** بگذارید تا GitHub Pages رایگان در دسترس باشد.
3. وارد مخزن شوید و **Add file → Upload files** را انتخاب کنید.
4. فایل‌ها و پوشه‌های داخل بسته را بارگذاری کنید. دقت کنید `index.html` باید در ریشهٔ مخزن باشد، کنار `catalog.js` و پوشه‌های `assets` و `supabase`؛ خود پوشهٔ `package` یا `outputs` را به‌عنوان یک لایهٔ اضافی بارگذاری نکنید.
5. پایین صفحه **Commit changes** را بزنید.
6. در مخزن به **Settings → Pages** بروید.
7. در **Build and deployment**، گزینهٔ **Deploy from a branch** را انتخاب کنید. سپس شاخهٔ `main` و پوشهٔ `/(root)` را انتخاب و **Save** کنید.
8. پس از انتشار، نشانی سایت در همین صفحه ظاهر می‌شود؛ معمولاً به شکل `https://USERNAME.github.io/REPOSITORY/` است.

برای مراحل رسمی به [راهنمای GitHub Pages](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site) مراجعه کنید.

## به‌روزرسانی بعدی

- اگر فقط ظاهر یا داده‌های محلی را تغییر دادید، فایل‌های تغییرکرده را دوباره در GitHub بارگذاری و Commit کنید.
- اگر پنل‌های Supabase را تغییر دادید، فایل `supabase/seed.sql` جدید را دوباره در SQL Editor اجرا کنید.
- این کاتالوگ عمومی است؛ هیچ اطلاعات بیمار، نمونهٔ واقعی یا نتیجهٔ آزمایش را در فایل‌ها یا جدول‌های عمومی قرار ندهید.
