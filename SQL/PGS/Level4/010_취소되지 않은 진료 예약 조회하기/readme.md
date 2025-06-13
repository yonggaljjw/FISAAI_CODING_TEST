# [취소되지 않은 진료 예약 조회하기](https://school.programmers.co.kr/learn/courses/30/lessons/132204)


###### 문제 설명


다음은 환자 정보를 담은 `PATIENT` 테이블과 의사 정보를 담은 `DOCTOR` 테이블, 그리고 진료 예약목록을 담은 `APPOINTMENT`에 대한 테이블입니다. `PATIENT` 테이블은 다음과 같으며 `PT_NO`, `PT_NAME`, `GEND_CD`, `AGE`, `TLNO`는 각각 환자번호, 환자이름, 성별코드, 나이, 전화번호를 의미합니다.




| Column name | Type | Nullable |
| --- | --- | --- |
| PT\_NO | VARCHAR(N) | FALSE |
| PT\_NAME | VARCHAR(N) | FALSE |
| GEND\_CD | VARCHAR(N) | FALSE |
| AGE | INTEGER | FALSE |
| TLNO | VARCHAR(N) | TRUE |


`DOCTOR` 테이블은 다음과 같으며 `DR_NAME`, `DR_ID`, `LCNS_NO`, `HIRE_YMD`, `MCDP_CD`, `TLNO`는 각각 의사이름, 의사ID, 면허번호, 고용일자, 진료과코드, 전화번호를 나타냅니다.




| Column name | Type | Nullable |
| --- | --- | --- |
| DR\_NAME | VARCHAR(N) | FALSE |
| DR\_ID | VARCHAR(N) | FALSE |
| LCNS\_NO | VARCHAR(N) | FALSE |
| HIRE\_YMD | DATE | FALSE |
| MCDP\_CD | VARCHAR(N) | TRUE |
| TLNO | VARCHAR(N) | TRUE |


`APPOINTMENT` 테이블은 다음과 같으며 `APNT_YMD`, `APNT_NO`, `PT_NO`, `MCDP_CD`, `MDDR_ID`, `APNT_CNCL_YN`, `APNT_CNCL_YMD`는 각각 진료 예약일시, 진료예약번호, 환자번호, 진료과코드, 의사ID, 예약취소여부, 예약취소날짜를 나타냅니다.




| Column name | Type | Nullable |
| --- | --- | --- |
| APNT\_YMD | TIMESTAMP | FALSE |
| APNT\_NO | INTEGER | FALSE |
| PT\_NO | VARCHAR(N) | FALSE |
| MCDP\_CD | VARCHAR(N) | FALSE |
| MDDR\_ID | VARCHAR(N) | FALSE |
| APNT\_CNCL\_YN | VARCHAR(N) | TRUE |
| APNT\_CNCL\_YMD | DATE | TRUE |




---


##### 문제


`PATIENT`, `DOCTOR` 그리고 `APPOINTMENT` 테이블에서 2022년 4월 13일 취소되지 않은 흉부외과(CS) 진료 예약 내역을 조회하는 SQL문을 작성해주세요. 진료예약번호, 환자이름, 환자번호, 진료과코드, 의사이름, 진료예약일시 항목이 출력되도록 작성해주세요. 결과는 진료예약일시를 기준으로 오름차순 정렬해주세요.




---


##### 예시


`PATIENT` 테이블이 다음과 같고,




| PT\_NO | PT\_NAME | GEND\_CD | AGE | TLNO |
| --- | --- | --- | --- | --- |
| PT22000019 | 바라 | W | 10 | 01079068799 |
| PT22000043 | 오스왈드 | M | 68 | 01031294124 |
| PT22000052 | 제니 | W | 60 | NULL |
| PT22000071 | 몬몬 | M | 31 | 01076489209 |
| PT22000097 | 슈가 | M | 19 | NULL |


`DOCTOR` 테이블이 다음과 같고,




| DR\_NAME | DR\_ID | LCNS\_NO | HIRE\_YMD | MCDP\_CD | TLNO |
| --- | --- | --- | --- | --- | --- |
| 루피 | DR20090029 | LC00010001 | 2009\-03\-01 | CS | 01085482011 |
| 니모 | DR20200012 | LC00911162 | 2020\-03\-01 | CS | 01089483921 |
| 핑크퐁 | DR20140011 | LC00082201 | 2014\-03\-01 | NP | 01098428957 |
| 젤라비 | DR20160031 | LC00340327 | 2016\-11\-01 | OB | 01023981922 |
| 토리 | DR20190129 | LC00099911 | 2019\-03\-01 | NS | 01058390758 |


`APPOINTMENT` 테이블이 다음과 같을 때,




| APNT\_YMD | APNT\_NO | PT\_NO | MCDP\_CD | MDDR\_ID | APNT\_CNCL\_YN | APNT\_CNCL\_YMD |
| --- | --- | --- | --- | --- | --- | --- |
| 2022\-04\-13 12:30:00\.000000 | 42 | PT22000071 | CS | DR20090029 | N | NULL |
| 2022\-04\-13 15:30:00\.000000 | 43 | PT22000019 | CS | DR20200012 | N | NULL |
| 2022\-04\-13 09:00:00\.000000 | 46 | PT22000043 | CS | DR20090029 | N | NULL |
| 2022\-07\-09 11:00:00\.000000 | 74 | PT22000042 | NP | DR20100011 | N | NULL |
| 2022\-12\-13 12:30:00\.000000 | 110 | PT22000097 | NP | DR20160011 | Y | 2022\-12\-03 |


SQL을 실행하면 다음과 같이 출력되어야 합니다.


\| APNTNO \| PTNAME \| PTNO \| MCDPCD \| DRNAME \| APNTYMD


\| \-\- \| \-\- \| \-\- \| \-\- \| \-\- \| \-\- \|  

\| 46 \| 오스왈드 \| PT22000043 \| CS \| 루피 \| 2022\-04\-13 09:00:00\.000000 \|  

\| 42 \| 몬몬 \| PT22000071 \| CS \| 루피 \| 2022\-04\-13 12:30:00\.000000 \|  

\| 43 \| 바라 \| PT22000019 \| CS \| 니모 \| 2022\-04\-13 15:30:00\.000000 \|



