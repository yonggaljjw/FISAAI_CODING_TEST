# [자동차 대여 기록 별 대여 금액 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/151141)


###### 문제 설명


다음은 어느 자동차 대여 회사에서 대여 중인 자동차들의 정보를 담은 `CAR_RENTAL_COMPANY_CAR` 테이블과 자동차 대여 기록 정보를 담은 `CAR_RENTAL_COMPANY_RENTAL_HISTORY` 테이블과 자동차 종류 별 대여 기간 종류 별 할인 정책 정보를 담은 `CAR_RENTAL_COMPANY_DISCOUNT_PLAN` 테이블 입니다.


`CAR_RENTAL_COMPANY_CAR` 테이블은 아래와 같은 구조로 되어있으며, `CAR_ID`, `CAR_TYPE`, `DAILY_FEE`, `OPTIONS` 는 각각 자동차 ID, 자동차 종류, 일일 대여 요금(원), 자동차 옵션 리스트를 나타냅니다.




| Column name | Type | Nullable |
| --- | --- | --- |
| CAR\_ID | INTEGER | FALSE |
| CAR\_TYPE | VARCHAR(255\) | FALSE |
| DAILY\_FEE | INTEGER | FALSE |
| OPTIONS | VARCHAR(255\) | FALSE |


자동차 종류는 '세단', 'SUV', '승합차', '트럭', '리무진' 이 있습니다. 자동차 옵션 리스트는 콤마(',')로 구분된 키워드 리스트(예: ''열선시트,스마트키,주차감지센서'')로 되어있으며, 키워드 종류는 '주차감지센서', '스마트키', '네비게이션', '통풍시트', '열선시트', '후방카메라', '가죽시트' 가 있습니다.


`CAR_RENTAL_COMPANY_RENTAL_HISTORY` 테이블은 아래와 같은 구조로 되어있으며, `HISTORY_ID`, `CAR_ID`, `START_DATE`, `END_DATE` 는 각각 자동차 대여 기록 ID, 자동차 ID, 대여 시작일, 대여 종료일을 나타냅니다.




| Column name | Type | Nullable |
| --- | --- | --- |
| HISTORY\_ID | INTEGER | FALSE |
| CAR\_ID | INTEGER | FALSE |
| START\_DATE | DATE | FALSE |
| END\_DATE | DATE | FALSE |


`CAR_RENTAL_COMPANY_DISCOUNT_PLAN` 테이블은 아래와 같은 구조로 되어있으며, `PLAN_ID`, `CAR_TYPE`, `DURATION_TYPE`, `DISCOUNT_RATE` 는 각각 요금 할인 정책 ID, 자동차 종류, 대여 기간 종류, 할인율(%)을 나타냅니다.




| Column name | Type | Nullable |
| --- | --- | --- |
| PLAN\_ID | INTEGER | FALSE |
| CAR\_TYPE | VARCHAR(255\) | FALSE |
| DURATION\_TYPE | VARCHAR(255\) | FALSE |
| DISCOUNT\_RATE | INTEGER | FALSE |


할인율이 적용되는 대여 기간 종류로는 '7일 이상' (대여 기간이 7일 이상 30일 미만인 경우), '30일 이상' (대여 기간이 30일 이상 90일 미만인 경우), '90일 이상' (대여 기간이 90일 이상인 경우) 이 있습니다. 대여 기간이 7일 미만인 경우 할인정책이 없습니다.




---


##### 문제


`CAR_RENTAL_COMPANY_CAR` 테이블과 `CAR_RENTAL_COMPANY_RENTAL_HISTORY` 테이블과 `CAR_RENTAL_COMPANY_DISCOUNT_PLAN` 테이블에서 자동차 종류가 '트럭'인 자동차의 대여 기록에 대해서 대여 기록 별로 대여 금액(컬럼명: `FEE`)을 구하여 대여 기록 ID와 대여 금액 리스트를 출력하는 SQL문을 작성해주세요. 결과는 대여 금액을 기준으로 내림차순 정렬하고, 대여 금액이 같은 경우 대여 기록 ID를 기준으로 내림차순 정렬해주세요.




---


##### 예시


예를 들어 `CAR_RENTAL_COMPANY_CAR` 테이블과 `CAR_RENTAL_COMPANY_RENTAL_HISTORY` 테이블과 `CAR_RENTAL_COMPANY_DISCOUNT_PLAN` 테이블이 다음과 같다면




| CAR\_ID | CAR\_TYPE | DAILY\_FEE | OPTIONS |
| --- | --- | --- | --- |
| 1 | 트럭 | 26000 | 가죽시트,열선시트,후방카메라 |
| 2 | SUV | 14000 | 스마트키,네비게이션,열선시트 |
| 3 | 트럭 | 32000 | 주차감지센서,후방카메라,가죽시트 |



| HISTORY\_ID | CAR\_ID | START\_DATE | END\_DATE |
| --- | --- | --- | --- |
| 1 | 1 | 2022\-07\-27 | 2022\-08\-02 |
| 2 | 1 | 2022\-08\-03 | 2022\-08\-04 |
| 3 | 2 | 2022\-08\-05 | 2022\-08\-05 |
| 4 | 2 | 2022\-08\-09 | 2022\-08\-12 |
| 5 | 3 | 2022\-09\-16 | 2022\-10\-15 |



| PLAN\_ID | CAR\_TYPE | DURATION\_TYPE | DISCOUNT\_RATE |
| --- | --- | --- | --- |
| 1 | 트럭 | 7일 이상 | 5% |
| 2 | 트럭 | 30일 이상 | 7% |
| 3 | 트럭 | 90일 이상 | 10% |
| 4 | 세단 | 7일 이상 | 5% |
| 5 | 세단 | 30일 이상 | 10% |
| 6 | 세단 | 90일 이상 | 15% |


자동차 종류가 '트럭' 인 자동차의 대여 기록에 대해서 대여 기간을 구하면,


* 대여 기록 ID가 1인 경우, 7일
* 대여 기록 ID가 2인 경우, 2일
* 대여 기록 ID가 5인 경우, 30일입니다.


대여 기간 별로 일일 대여 요금에 알맞은 할인율을 곱하여 금액을 구하면 다음과 같습니다.


* 대여 기록 ID가 1인 경우, 일일 대여 금액 26,000원에서 5% 할인율을 적용하고 7일을 곱하면 총 대여 금액은 172,900원
* 대여 기록 ID가 2인 경우, 일일 대여 금액 26,000원에 2일을 곱하면 총 대여 금액은 52,000원
* 대여 기록 ID가 5인 경우, 일일 대여 금액 32,000원에서 7% 할인율을 적용하고 30일을 곱하면 총 대여 금액은 892,800원이 되므로, 대여 금액을 기준으로 내림차순 정렬 및 대여 기록 ID를 기준으로 내림차순 정렬하면 다음과 같아야 합니다.




| HISTORY\_ID | FEE |
| --- | --- |
| 5 | 892800 |
| 1 | 172900 |
| 2 | 52000 |




---


##### 주의사항


`FEE`의 경우 예시처럼 정수부분만 출력되어야 합니다.



