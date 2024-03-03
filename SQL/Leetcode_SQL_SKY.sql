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

-- 1581. Customer Who Visited but Did Not Make Any Transactions
SELECT V.customer_id,COUNT(*) count_no_trans
FROM Visits V LEFT JOIN Transactions T ON T.visit_id=V.visit_id
WHERE T.visit_id IS NULL
GROUP BY customer_id;

-- 1934. Confirmation Rate
SELECT 
    s.user_id,
    ROUND(
        IFNULL(
            (SELECT COUNT(*) FROM Confirmations WHERE user_id = s.user_id AND action = 'confirmed')/
            (SELECT COUNT(*) FROM Confirmations WHERE user_id = s.user_id),
            0),
            2
    ) AS confirmation_rate
FROM 
    Signups s;
-- IFNULL사용


-- 1934. Confirmation Rate 
SELECT s.user_id,
    ROUND(AVG(IF(c.action="confirmed",1,0)),2) AS confirmation_rate
FROM Signups s LEFT JOIN Confirmations c ON s.user_id= c.user_id
GROUP BY user_id;
-- 조인 사용

-- 197. Rising Temperature
SELECT 
    w2.id
FROM 
    Weather w1, Weather w2
WHERE 
    DATEDIFF(w2.recordDate, w1.recordDate) = 1 
AND 
    w2.temperature > w1.temperature;
-- datediff

WITH PreviousWeatherData AS
(
    SELECT 
        id,
        recordDate,
        temperature, 
        LAG(temperature, 1) OVER (ORDER BY recordDate) AS PreviousTemperature,/
        LAG(recordDate, 1) OVER (ORDER BY recordDate) AS PreviousRecordDate
    FROM 
        Weather
)
SELECT 
    id 
FROM 
    PreviousWeatherData
WHERE 
    temperature > PreviousTemperature
AND 
    recordDate = DATE_ADD(PreviousRecordDate, INTERVAL 1 DAY);
-- lag

--1661. Average Time of Process per Machine
SELECT a.machine_id,
    ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
FROM Activity a,
    Activity b
WHERE
    a.machine_id = b.machine_id
AND
    a.process_id = b.process_id
AND
    a.activity_type = 'start'
AND
    b.activity_type = 'end'
GROUP BY machine_id
-- 테이블 분리

SELECT 
    machine_id,
    ROUND(SUM(CASE WHEN activity_type='start' THEN timestamp*-1 ELSE timestamp END)*1.0
    / (SELECT COUNT(DISTINCT process_id)),3) AS processing_time
FROM 
    Activity
GROUP BY machine_id
--CASE WHEN

--577. Employee Bonus
SELECT
    e.name, b.bonus
FROM 
    employee e
LEFT JOIN 
    bonus b
ON
     e.empID = b.empID 
WHERE
     b.bonus <1000
OR
     b.bonus IS NULL;

--
SELECT
    st.student_id,
    st.student_name,
    su.subject_name,
    (
        SELECT COUNT(*)
        FROM examinations ex
        WHERE ex.student_id = st.student_id
        AND ex.subject_name = su.subject_name
    ) attended_exams
FROM
    students st
CROSS JOIN
    subjects su
ORDER BY
    st.student_id, su.subject_name;
--서브쿼리, crossjoin

