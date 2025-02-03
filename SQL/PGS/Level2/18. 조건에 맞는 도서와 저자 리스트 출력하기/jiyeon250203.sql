-- '경제' 카테고리에 속하는 도서들의 도서 ID(BOOK_ID), 저자명(AUTHOR_NAME), 출판일(PUBLISHED_DATE) 리스트를 출력
-- 결과는 출판일을 기준으로 오름차순
SELECT B.BOOK_ID, A.AUTHOR_NAME, DATE_FORMAT(B.PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK B
    LEFT JOIN AUTHOR A ON B.AUTHOR_ID = A.AUTHOR_ID
WHERE CATEGORY LIKE '%경제%'
ORDER BY B.PUBLISHED_DATE
