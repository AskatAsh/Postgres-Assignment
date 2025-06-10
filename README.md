# PostgreSQL সম্পর্কে প্রশ্নোত্তর

## ১. PostgreSQL কী?

PostgreSQL একটি শক্তিশালী, ওপেন সোর্স অবজেক্ট-রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম (DBMS) যা ডেটা সংরক্ষণ, পরিচালনা ও বিশ্লেষণে ব্যবহৃত হয়। এর মাধ্যমে টেবিল আকারে তথ্য সংরক্ষণ, পরিবর্তন ও পরিচালনা করা যায়।

## ২. PostgreSQL-এ ডেটাবেস স্কিমার উদ্দেশ্য কী?

ডেটাবেস স্কিমা হলো ডেটাবেসের কাঠামো বা নকশা, যা টেবিল, ভিউ, ফাংশন ইত্যাদি সংগঠিত ও আলাদা রাখতে সাহায্য করে।

ডাটা কি ধরণের হতে পারে এবং একটি টবিল এর সাথে অন্য টেবিল এর রিলেশন কি হতে পারে তা স্কিমা এর মাধ্যমে করে যায়।

উদাহরণ:

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    total NUMERIC(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## ৩. প্রাইমারি কি এবং ফরেন কি কী?

- **প্রাইমারি কি:** একটি টেবিলের প্রতিটি রেকর্ডকে ইউনিকভাবে চিহ্নিত করে।

উদাহরণ:

```sql
CREATE TABLE my_user (
    user_id PRIMARY KEY,
)
```

- **ফরেন কি:** অন্য টেবিলের প্রাইমারি কি-র সাথে সম্পর্ক স্থাপন করে, ডেটার ইন্টিগ্রিটি বজায় রাখে।

উদাহরণ:

```sql
CREATE TABLE shop_list (
    customer_id INTEGER REFERENCES my_user(user_id),
)
```

## ৪. VARCHAR এবং CHAR ডেটা টাইপের পার্থক্য কী?

- **VARCHAR:** পরিবর্তনশীল দৈর্ঘ্যের স্ট্রিং সংরক্ষণ করে, অতিরিক্ত স্পেস নষ্ট হয় না।
- **CHAR:** নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং সংরক্ষণ করে, কম দৈর্ঘ্যের হলে বাকি অংশ ফাঁকা থাকে।

উদাহরণ:

```sql
CREATE TABLE my_user (
    username VARCHAR(50),
    status CHAR(10)
)
```

## ৫. SELECT স্টেটমেন্টে WHERE ক্লজের উদ্দেশ্য কী?

WHERE ক্লজ নির্দিষ্ট শর্ত অনুযায়ী ডেটা ফিল্টার করতে ব্যবহৃত হয়।

উদাহরণ:

```sql
SELECT * FROM my_user
    WHERE username = 'Alamin';

SELECT * FROM my_user
    WHERE age > 18;
```

## ৬. LIMIT এবং OFFSET ক্লজ কী কাজে ব্যবহৃত হয়?

LIMIT নির্দিষ্ট সংখ্যক রেকর্ড দেখাতে এবং OFFSET নির্দিষ্ট সংখ্যক রেকর্ড বাদ দিতে ব্যবহৃত হয়। LIMIT OFFSET পেজিনেশন তৈরি করতে বেশি কাজে লাগে।

উদাহরণ:

```sql
SELECT * FROM my_user
    ORDER BY username
    LIMIT 24
    OFFSET 10;
```

উপরের উদাহরণ এ প্রথম ১০ টি বাদে পরবর্তি ২৪ টি ডাটা দেখাবে।

## ৭. UPDATE স্টেটমেন্ট দিয়ে কীভাবে ডেটা পরিবর্তন করা যায়?

UPDATE স্টেটমেন্ট ব্যবহার করে টেবিলের নির্দিষ্ট রেকর্ডের ডেটা পরিবর্তন করা যায়।

উদাহরণ:

```sql
UPDATE students SET name = 'Rahim' WHERE id = 1;
```

## ৮. JOIN অপারেশনের গুরুত্ব ও কাজ কী?

JOIN অপারেশন একাধিক টেবিলের ডেটা একত্রে দেখাতে ব্যবহৃত হয়, যাতে সম্পর্কিত তথ্য সহজে পাওয়া যায়।

JOIN এর প্রকারভেদঃ INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN, CROSS JOIN, NATURAL JOIN.

উদাহরণ:

```sql
SELECT * FROM my_user
    INNER JOIN shopping_list USING(user_id);
```

## ৯. GROUP BY ক্লজ ও তার ভূমিকা কী?

GROUP BY ক্লজ ডেটাকে নির্দিষ্ট কলামের মান অনুযায়ী গ্রুপ করে, যাতে প্রতিটি গ্রুপে অ্যাগ্রিগেট ফাংশন প্রয়োগ করা যায়।

GROUP BY ক্লজ ব্যবহার এর ক্ষেত্রে SELECT এর পরের কলাম নাম GROUP BY ক্লজ ব্যবহার করতে হবে অথবা অ্যাগ্রিগেট ফাংশন প্রয়োগ করতে হবে।

উদাহরণ:

```sql
SELECT * FROM my_user, avg(age) AS average_age
    GROUP BY my_user;
```

## ১০. PostgreSQL-এ COUNT(), SUM(), এবং AVG() অ্যাগ্রিগেট ফাংশন কীভাবে হিসাব করা যায়?

এই ফাংশনগুলো SELECT স্টেটমেন্টে ব্যবহার করে ডেটার সংখ্যা, যোগফল ও গড় নির্ণয় করা যায়।

COUNT() -> ডেটার সংখ্যা বের করে,
SUM() -> একাধিক ডাটা এর যোগফল বের করে একটি output দেয়, এবং
AVG() -> একাধিক ডাটা এর গড় বের করে।

উদাহরণ:

```sql
SELECT COUNT(*), SUM(salary), AVG(salary) FROM employees;
```
