# [멸종위기의 대장균 찾기](https://school.programmers.co.kr/learn/courses/30/lessons/301651)


###### 문제 설명


대장균들은 일정 주기로 분화하며, 분화를 시작한 개체를 부모 개체, 분화가 되어 나온 개체를 자식 개체라고 합니다.  

다음은 실험실에서 배양한 대장균들의 정보를 담은 `ECOLI_DATA` 테이블입니다. `ECOLI_DATA` 테이블의 구조는 다음과 같으며, `ID`, `PARENT_ID`, `SIZE_OF_COLONY`, `DIFFERENTIATION_DATE`, `GENOTYPE` 은 각각 대장균 개체의 ID, 부모 개체의 ID, 개체의 크기, 분화되어 나온 날짜, 개체의 형질을 나타냅니다.




| Column name | Type | Nullable |
| --- | --- | --- |
| ID | INTEGER | FALSE |
| PARENT\_ID | INTEGER | TRUE |
| SIZE\_OF\_COLONY | INTEGER | FALSE |
| DIFFERENTIATION\_DATE | DATE | FALSE |
| GENOTYPE | INTEGER | FALSE |


최초의 대장균 개체의 `PARENT_ID` 는 NULL 값입니다.




---


##### 문제


각 세대별 자식이 없는 개체의 수(`COUNT`)와 세대(`GENERATION`)를 출력하는 SQL문을 작성해주세요. 이때 결과는 세대에 대해 오름차순 정렬해주세요. 단, 모든 세대에는 자식이 없는 개체가 적어도 1개체는 존재합니다.




---


##### 예시


예를 들어 `ECOLI_DATA` 테이블이 다음과 같다면




| ID | PARENT\_ID | SIZE\_OF\_COLONY | DIFFERENTIATION\_DATE | GENOTYPE |
| --- | --- | --- | --- | --- |
| 1 | NULL | 10 | 2019/01/01 | 5 |
| 2 | NULL | 2 | 2019/01/01 | 3 |
| 3 | 2 | 100 | 2020/01/01 | 4 |
| 4 | 2 | 16 | 2020/01/01 | 4 |
| 5 | 2 | 17 | 2020/01/01 | 6 |
| 6 | 4 | 101 | 2021/01/01 | 22 |
| 7 | 4 | 101 | 2022/01/01 | 23 |
| 8 | 6 | 1 | 2022/01/01 | 27 |


각 세대별 대장균의 ID는 다음과 같습니다.


1 세대 : ID 1, ID 2  

2 세대 : ID 3, ID 4, ID 5  

3 세대 : ID 6, ID 7  

4 세대 : ID 8


이 때 각 세대별 자식이 없는 대장균의 ID는 다음과 같습니다.


1 세대 : ID 1  

2 세대 : ID 3, ID 5  

3 세대 : ID 7  

4 세대 : ID 8


따라서 결과를 세대에 대해 오름차순 정렬하면 다음과 같아야 합니다.




| COUNT | GENERATION |
| --- | --- |
| 1 | 1 |
| 2 | 2 |
| 1 | 3 |
| 1 | 4 |


