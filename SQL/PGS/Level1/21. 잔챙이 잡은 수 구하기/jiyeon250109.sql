-- 잡은 물고기 중 길이가 10cm 이하인 물고기의 수를 출력
-- 물고기의 수를 나타내는 컬럼 명은 FISH_COUNT

SELECT COUNT(*) AS FISH_COUNT
FROM FISH_INFO
WHERE LENGTH IS NULL
