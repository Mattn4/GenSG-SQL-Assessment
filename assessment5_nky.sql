-- What are the Top 25 schools (.edu domains)?
SELECT COUNT() AS "Number of students", email_domain 
FROM users
GROUP BY email_domain
ORDER BY COUNT() DESC
LIMIT 25;


-- How many .edu learners are located in New York? Answer: 50 
-- Note: West New York is excluded as it is not part of New York 
SELECT COUNT() AS "Number of students", city 
FROM users 
WHERE city = "New York";


-- The mobile_app column contains either mobile-user or NULL. 
-- How many of these Codecademy learners are using the mobile app? Answer: 330
SELECT COUNT() AS "Number of students", mobile_app 
FROM users 
WHERE mobile_app != "";
--  or can write as: WHERE mobile_app = "mobile-user"


-- query for the sign up counts for each hour
SELECT COUNT() AS "Number of students", 
	strftime('%H', sign_up_at) AS Hour
FROM users
GROUP BY Hour
ORDER BY Hour ASC;


-- Do different schools (.edu domains) prefer different courses?
SELECT users.email_domain, 
COUNT() FILTER (WHERE learn_cpp != "") AS "Learn C++",
COUNT() FILTER (WHERE learn_sql != "") AS "learn SQL",
COUNT() FILTER (WHERE learn_html != "") AS "Learn HTML",
COUNT() FILTER (WHERE learn_javascript != "") AS "Learn JavaScript",
COUNT() FILTER (WHERE learn_java != "") AS "Learn Java"
FROM progress
INNER JOIN users ON progress.user_id = users.user_id
GROUP BY users.email_domain
ORDER BY users.email_domain ASC
LIMIT 50;

-- This query is to check if count for the query above is correct
-- SELECT users.email_domain, progress.* 
-- FROM progress
-- INNER JOIN users ON progress.user_id = users.user_id
-- ORDER BY users.email_domain ASC
-- LIMIT 100;


-- What courses are the New Yorkers students taking?
-- Note: West New York is excluded as it is not part of New York 
SELECT progress.*, users.city
FROM progress
INNER JOIN users ON progress.user_id = users.user_id
WHERE users.city = "New York";


-- What courses are the Chicago students taking? (includes West Chicago)
SELECT progress.*, users.city
FROM progress
INNER JOIN users ON progress.user_id = users.user_id
WHERE users.city LIKE "%Chicago%";

