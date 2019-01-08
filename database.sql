-- 1. How do you get all users from Chicago?
SELECT * FROM "accounts" WHERE "city" = 'chicago';
-- 2. How do you get all users with usernames that contain the letter a?
SELECT * FROM "accounts" WHERE "username" LIKE '%a%';
-- 3. The bank is giving a new customer bonus! How do you update all records with an account 
-- balance of 0.00 and a transactions_attempted of 0? Give them a new account balance of 10.00.
SELECT * FROM "accounts" WHERE "account_balance" = 0.00 AND "transactions_completed" = 0;
UPDATE "accounts" SET "account_balance" = 10.00 WHERE "user_id" = 5;
-- 4. How do you select all users that have attempted 9 or more transactions?
SELECT * FROM "accounts" WHERE "transactions_completed" > 8;
-- 5. How do you get the username and account balance of the 3 users with the highest balances,
-- sorted highest to lowest balance? NOTE: Research LIMIT
SELECT "username", "account_balance" FROM "accounts" ORDER BY "account_balance" DESC LIMIT 3;
-- 6. How do you get the username and account balance of the 3 users with the lowest balances, 
-- sorted lowest to highest balance?
SELECT "username", "account_balance" FROM "accounts" ORDER BY "account_balance" ASC LIMIT 3;
-- 7. How do you get all users with account balances that are more than $100?
SELECT * FROM "accounts" WHERE "account_balance" > 100.00;
-- 8. How do you add a new account?
INSERT INTO accounts (username, city, transactions_completed, transactions_attempted, account_balance) VALUES ('britt', 'st. paul', 0, 00, 0);
-- 9. The bank is losing money in Miami and Phoenix and needs to unload low transaction customers:
-- How do you delete users that reside in miami OR phoenix and have completed fewer than 5 transactions.
DELETE FROM "accounts" WHERE ("city" = 'miami' OR "city" = 'phoenix') AND "transactions_completed" < 5;


-- STRETCH GOALS
-- Anthony moved to Santa Fe.
SELECT * FROM "accounts" WHERE "username" = 'anthony';
UPDATE "accounts" SET "city" = 'santa fe' WHERE "user_id" = 5;
-- Grace closed her account.
SELECT * FROM "accounts" WHERE "username" = 'grace';
DELETE FROM "accounts" WHERE "user_id" = 9;
-- Travis made a withdrawl of $20,000. What's their new balance? NOTE: Research RETURNING
UPDATE "accounts" SET "account_balance" = "account_balance" - 20000.00 WHERE "username" = 'travis'
	RETURNING "account_balance";
-- The Bank needs to track last names. NOTE: Research ALTER TABLE https://www.postgresql.org/docs/10/static/sql-altertable.html
ALTER TABLE "accounts" ADD "user_lastname" VARCHAR(60);