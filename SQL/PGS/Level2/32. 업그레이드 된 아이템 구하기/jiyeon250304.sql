-- 희귀도가 'RARE'인 아이템들의 모든 다음 업그레이드 아이템의 아이템 ID(ITEM_ID), 아이템 명(ITEM_NAME), 아이템의 희귀도(RARITY)를 출력
SELECT T.ITEM_ID, I.ITEM_NAME, I.RARITY
FROM ITEM_INFO I
JOIN ITEM_TREE T ON I.ITEM_ID=T.ITEM_ID 
WHERE T.PARENT_ITEM_ID IN 
    (SELECT ITEM_ID
     FROM ITEM_INFO 
     WHERE RARITY = 'RARE')
ORDER BY 1 DESC
-- 아이템 ID를 기준으로 내림차순