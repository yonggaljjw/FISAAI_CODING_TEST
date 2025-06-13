SELECT MEMBER_NAME, REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE,'%Y-%m-%d') AS REVIEW_DATE
FROM MEMBER_PROFILE A, REST_REVIEW B
WHERE A.MEMBER_ID = B.MEMBER_ID AND B.MEMBER_ID = (SELECT MEMBER_ID
                                                  FROM REST_REVIEW
                                                  GROUP BY MEMBER_ID
                                                  ORDER BY COUNT(MEMBER_ID) DESC
                                                  LIMIT 1)
ORDER BY REVIEW_DATE, REVIEW_TEXT