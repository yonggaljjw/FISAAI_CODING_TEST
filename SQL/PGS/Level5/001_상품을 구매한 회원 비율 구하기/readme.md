# [상품을 구매한 회원 비율 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/131534)


###### 문제 설명


다음은 어느 의류 쇼핑몰에 가입한 회원 정보를 담은 `USER_INFO` 테이블과 온라인 상품 판매 정보를 담은 `ONLINE_SALE` 테이블 입니다. `USER_INFO` 테이블은 아래와 같은 구조로 되어있으며 `USER_ID`, `GENDER`, `AGE`, `JOINED`는 각각 회원 ID, 성별, 나이, 가입일을 나타냅니다.




| Column name | Type | Nullable |
| --- | --- | --- |
| USER\_ID | INTEGER | FALSE |
| GENDER | TINYINT(1\) | TRUE |
| AGE | INTEGER | TRUE |
| JOINED | DATE | FALSE |


`GENDER` 컬럼은 비어있거나 0 또는 1의 값을 가지며 0인 경우 남자를, 1인 경우는 여자를 나타냅니다.


`ONLINE_SALE` 테이블은 아래와 같은 구조로 되어있으며 `ONLINE_SALE_ID`, `USER_ID`, `PRODUCT_ID`, `SALES_AMOUNT`, `SALES_DATE`는 각각 온라인 상품 판매 ID, 회원 ID, 상품 ID, 판매량, 판매일을 나타냅니다.




| Column name | Type | Nullable |
| --- | --- | --- |
| ONLINE\_SALE\_ID | INTEGER | FALSE |
| USER\_ID | INTEGER | FALSE |
| PRODUCT\_ID | INTEGER | FALSE |
| SALES\_AMOUNT | INTEGER | FALSE |
| SALES\_DATE | DATE | FALSE |


동일한 날짜, 회원 ID, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재합니다.




---


##### 문제


`USER_INFO` 테이블과 `ONLINE_SALE` 테이블에서 2021년에 가입한 전체 회원들 중 상품을 구매한 회원수와 상품을 구매한 회원의 비율(\=2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원 수)을 년, 월 별로 출력하는 SQL문을 작성해주세요. 상품을 구매한 회원의 비율은 소수점 두번째자리에서 반올림하고, 전체 결과는 년을 기준으로 오름차순 정렬해주시고 년이 같다면 월을 기준으로 오름차순 정렬해주세요.




---


##### 예시


예를 들어 `USER_INFO` 테이블이 다음과 같고 




| USER\_ID | GENDER | AGE | JOINED |
| --- | --- | --- | --- |
| 1 | 1 | 26 | 2021\-06\-01 |
| 2 | NULL | NULL | 2021\-06\-25 |
| 3 | 0 | NULL | 2021\-06\-30 |
| 4 | 0 | 31 | 2021\-07\-03 |
| 5 | 1 | 25 | 2022\-01\-09 |
| 6 | 1 | 33 | 2022\-02\-14 |


`ONLINE_SALE` 이 다음과 같다면




| ONLINE\_SALE\_ID | USER\_ID | PRODUCT\_ID | SALES\_AMOUNT | SALES\_DATE |
| --- | --- | --- | --- | --- |
| 1 | 1 | 54 | 1 | 2022\-01\-01 |
| 2 | 1 | 3 | 2 | 2022\-01\-25 |
| 3 | 4 | 34 | 1 | 2022\-01\-30 |
| 4 | 6 | 253 | 3 | 2022\-02\-03 |
| 5 | 2 | 31 | 2 | 2022\-02\-09 |
| 6 | 5 | 35 | 1 | 2022\-02\-14 |
| 7 | 5 | 57 | 1 | 2022\-02\-18 |


2021년에 가입한 회원은 `USER_ID`가 1, 2, 3, 4 인 회원들로 총 4명 입니다. `ONLINE_SALE` 테이블에서 해당 회원들에 대한 판매 데이터는 다음과 같습니다.




| ONLINE\_SALE\_ID | USER\_ID | PRODUCT\_ID | SALES\_AMOUNT | SALES\_DATE |
| --- | --- | --- | --- | --- |
| 1 | 1 | 54 | 1 | 2022\-01\-01 |
| 2 | 1 | 3 | 2 | 2022\-01\-25 |
| 3 | 4 | 34 | 1 | 2022\-01\-30 |
| 5 | 2 | 31 | 2 | 2022\-02\-09 |


그러므로 년, 월 별로 상품을 구매한 회원수와 상품을 구매한 회원의 비율을 구하고 결과를 정렬하면 다음과 같아야 합니다.




| YEAR | MONTH | PURCHASED\_USERS | PUCHASED\_RATIO |
| --- | --- | --- | --- |
| 2022 | 1 | 2 | 0\.5 |
| 2022 | 2 | 1 | 0\.3 |


