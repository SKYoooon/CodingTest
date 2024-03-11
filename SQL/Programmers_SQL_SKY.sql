--재구매가 일어난 상품과 회원 리스트 구하기
SELECT
    user_id,
    product_id
FROM
    online_sale
GROUP BY
    user_id,
    product_id
HAVING
    COUNT(1)>1
ORDER BY
    user_id ASC,
    product_id DESC

 
--********
--********


--강원도에 위치한 생산공장 목록 출력하기
SELECT
    factory_id,
    factory_name,
    address
FROM
    food_factory
WHERE
    address like '강원도%'


--********
--********


--과일로 만든 아이스크림 고르기/ 1. JOIN 2. USING
SELECT
    F.FLAVOR
FROM
    FIRST_HALF F
JOIN
    ICECREAM_INFO I
ON
    F.FLAVOR = I.FLAVOR
WHERE
    F.TOTAL_ORDER > 3000
    AND I.INGREDIENT_TYPE = 'fruit_based'
ORDER BY
    F.FLAVOR DESC;

--------

SELECT
    FLAVOR
FROM
    FIRST_HALF
JOIN
    ICECREAM_INFO USING(FLAVOR)
WHERE
    TOTAL_ORDER>3000
AND INGREDIENT_TYPE = 'fruit_based'
ORDER BY
    TOTAL_ORDER DESC;


--********
--********


--인기있는 아이스크림
SELECT
    FLAVOR
FROM
    FIRST_HALF
ORDER BY
    TOTAL_ORDER DESC,
    SHIPMENT_ID ASC
    

--********
--********


--흉부외과 또는 일반외과 의사 목록 출력하기
SELECT
    DR_NAME,
    DR_ID,
    MCDP_CD,
    DATE_FORMAT(HIRE_YMD, '%Y-%m-%d') HIRE_YMD
FROM
    doctor
WHERE
    MCDP_CD IN ('CS','GS')
ORDER BY
    HIRE_YMD DESC,
    DR_NAME ASC


--********
--********


--12세 이하인 여자 환자 목록 출력하기
SELECT
    PT_NAME,
    PT_NO,
    GEND_CD,
    AGE,
    IFNULL(TLNO, 'NONE') TLNO
FROM
    patient
WHERE
    AGE <=12
    AND GEND_CD = "W"
ORDER BY
    AGE DESC,
    PT_NAME ASC;