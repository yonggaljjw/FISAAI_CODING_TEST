SELECT  A.PRODUCT_ID, A.PRODUCT_NAME, SUM(PRICE*AMOUNT) AS TOTAL_SALES
FROM FOOD_PRODUCT A, FOOD_ORDER B
WHERE A.PRODUCT_ID = B.PRODUCT_ID AND DATE_FORMAT(B.PRODUCE_DATE, '%Y-%m') = '2022-05'
GROUP BY A.PRODUCT_ID
ORDER BY TOTAL_SALES DESC, A.PRODUCT_ID