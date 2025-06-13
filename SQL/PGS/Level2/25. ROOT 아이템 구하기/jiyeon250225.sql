-- 서브쿼리 사용
SELECT I.ITEM_ID, I.ITEM_NAME
FROM ITEM_INFO I
RIGHT JOIN (SELECT T.ITEM_ID
        FROM ITEM_TREE T
        WHERE T.PARENT_ITEM_ID IS NULL) A
        -- ITEM_TREE에서 PARENT_ITEM_ID이 NULL인 ITEM_ID
        ON A.ITEM_ID = I.ITEM_ID
ORDER BY I.ITEM_ID



-- JOIN 바로 사용
SELECT I.ITEM_ID, I.ITEM_NAME
FROM ITEM_INFO I
JOIN ITEM_TREE T ON I.ITEM_ID = T.ITEM_ID
WHERE T.PARENT_ITEM_ID IS NULL
ORDER BY 1
