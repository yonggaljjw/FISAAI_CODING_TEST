--  동물 보호소에 들어온 동물 이름 중, 이름에 "EL"이 들어가는 **개**의 아이디와 이름을 조회
-- 결과는 이름 순으로 조회해주세요. 단, 이름의 대소문자는 구분하지 않음
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE NAME LIKE "%EL%" AND ANIMAL_TYPE = 'Dog'
ORDER BY NAME

