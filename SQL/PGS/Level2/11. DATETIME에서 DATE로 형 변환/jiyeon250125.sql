-- 각 동물의 아이디와 이름, 들어온 날짜 조회
--  결과는 아이디 순으로 조회
SELECT ANIMAL_ID, NAME, DATE_FORMAT(DATETIME, '%Y-%m-%d') AS DATETIME
FROM ANIMAL_INS
ORDER BY ANIMAL_ID
