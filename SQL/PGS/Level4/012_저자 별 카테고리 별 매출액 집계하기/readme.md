# [저자 별 카테고리 별 매출액 집계하기](https://school.programmers.co.kr/learn/courses/30/lessons/144856)


###### 문제 설명


다음은 어느 한 서점에서 판매중인 도서들의 도서 정보(`BOOK`), 저자 정보(`AUTHOR`) 테이블입니다.


`BOOK` 테이블은 각 도서의 정보를 담은 테이블로 아래와 같은 구조로 되어있습니다.




| Column name | Type | Nullable | Description |
| --- | --- | --- | --- |
| BOOK\_ID | INTEGER | FALSE | 도서 ID |
| CATEGORY | VARCHAR(N) | FALSE | 카테고리 (경제, 인문, 소설, 생활, 기술) |
| AUTHOR\_ID | INTEGER | FALSE | 저자 ID |
| PRICE | INTEGER | FALSE | 판매가 (원) |
| PUBLISHED\_DATE | DATE | FALSE | 출판일 |


`AUTHOR` 테이블은 도서의 저자의 정보를 담은 테이블로 아래와 같은 구조로 되어있습니다.




| Column name | Type | Nullable | Description |
| --- | --- | --- | --- |
| AUTHOR\_ID | INTEGER | FALSE | 저자 ID |
| AUTHOR\_NAME | VARCHAR(N) | FALSE | 저자명 |


`BOOK_SALES` 테이블은 각 도서의 날짜 별 판매량 정보를 담은 테이블로 아래와 같은 구조로 되어있습니다.




| Column name | Type | Nullable | Description |
| --- | --- | --- | --- |
| BOOK\_ID | INTEGER | FALSE | 도서 ID |
| SALES\_DATE | DATE | FALSE | 판매일 |
| SALES | INTEGER | FALSE | 판매량 |




---


##### 문제


`2022년 1월`의 도서 판매 데이터를 기준으로 저자 별, 카테고리 별 매출액(`TOTAL_SALES = 판매량 * 판매가`) 을 구하여, 저자 ID(`AUTHOR_ID`), 저자명(`AUTHOR_NAME`), 카테고리(`CATEGORY`), 매출액(`SALES`) 리스트를 출력하는 SQL문을 작성해주세요.   

결과는 저자 ID를 오름차순으로, 저자 ID가 같다면 카테고리를 내림차순 정렬해주세요.




---


##### 예시


예를 들어 `BOOK` 테이블과 `AUTHOR` 테이블, `BOOK_SALES` 테이블이 다음과 같다면




| BOOK\_ID | CATEGORY | AUTHOR\_ID | PRICE | PUBLISHED\_DATE |
| --- | --- | --- | --- | --- |
| 1 | 인문 | 1 | 10000 | 2020\-01\-01 |
| 2 | 경제 | 1 | 9000 | 2021\-02\-05 |
| 3 | 경제 | 2 | 9000 | 2021\-03\-11 |



| AUTHOR\_ID | AUTHOR\_NAME |
| --- | --- |
| 1 | 홍길동 |
| 2 | 김영호 |



| BOOK\_ID | SALES\_DATE | SALES |
| --- | --- | --- |
| 1 | 2022\-01\-01 | 2 |
| 2 | 2022\-01\-02 | 3 |
| 1 | 2022\-01\-05 | 1 |
| 2 | 2022\-01\-20 | 5 |
| 2 | 2022\-01\-21 | 6 |
| 3 | 2022\-01\-22 | 2 |
| 2 | 2022\-02\-11 | 3 |


2022년 1월의 도서 별 총 매출액은 도서 ID 가 1 인 도서가 총 3권 \* 10,000원 \= 30,000원, 도서 ID 가 2 인 도서가 총 14권 \* 9,000 \= 126,000원 이고, 도서 ID 가 3 인 도서가 총 2권 \* 9,000 \= 18,000원 입니다.


저자 별 카테고리 별로 매출액을 집계하면 결과는 다음과 같습니다.




| AUTHOR\_ID | AUTHOR\_NAME | CATEGORY | TOTAL\_SALES |
| --- | --- | --- | --- |
| 1 | 홍길동 | 인문 | 30000 |
| 1 | 홍길동 | 경제 | 126000 |
| 2 | 김영호 | 경제 | 18000 |


그리고 저자 ID, 카테고리 순으로 내림차순 정렬하면 다음과 같이 나와야 합니다.




| AUTHOR\_ID | AUTHOR\_NAME | CATEGORY | TOTAL\_SALES |
| --- | --- | --- | --- |
| 1 | 홍길동 | 인문 | 30000 |
| 1 | 홍길동 | 경제 | 126000 |
| 2 | 김영호 | 경제 | 18000 |


