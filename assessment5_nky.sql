-- What are the Top 25 schools (.edu domains)?
SELECT COUNT(user_id), email_domain FROM users
GROUP BY email_domain
ORDER BY COUNT(user_id) DESC
LIMIT 25;


-- How many .edu learners are located in New York? Answer: 50 if exclude West New York
SELECT COUNT(user_id), city FROM users 
WHERE city = "New York";


-- The mobile_app column contains either mobile-user or NULL. 
-- How many of these Codecademy learners are using the mobile app? Answer: 330
SELECT COUNT(user_id), mobile_app FROM users 
WHERE mobile_app != "";
-- WHERE mobile_app = "mobile-user"


-- query for the sign up counts for each hour
SELECT COUNT(user_id),
   strftime('%H', sign_up_at)
FROM users
GROUP BY strftime('%H', sign_up_at)
ORDER BY strftime('%H', sign_up_at) ASC;


-- Do different schools (.edu domains) prefer different courses?
SELECT progress.*, users.email_domain
FROM progress
INNER JOIN users ON progress.user_id = users.user_id
ORDER BY users.email_domain ASC;


-- What courses are the New Yorkers students taking? (excludes West New York)
SELECT progress.*, users.city
FROM progress
INNER JOIN users ON progress.user_id = users.user_id
WHERE users.city = "New York";


-- What courses are the Chicago students taking? (excludes West Chicago)
SELECT progress.*, users.city
FROM progress
INNER JOIN users ON progress.user_id = users.user_id
WHERE users.city = "Chicago";

