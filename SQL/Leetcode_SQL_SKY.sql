-- 1148. Article Views I
SELECT DISTINCT author_id id
FROM Views
WHERE author_id = viewer_id ORDER BY id ASC;


-- 1683. Invalid Tweets
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) >15;


-- 1378. Replace Employee ID With The Unique Identifier
SELECT U.unique_id, E.name
FROM EMPLOYEES E LEFT JOIN EmployeeUNI U on E.id = U.id;


-- 1068. Product Sales Analysis I
SELECT product_name , s.year, s.price
FROM Sales s JOIN Product p on s.product_id = p.product_id;

--
