# [FrontEnd 개발자 찾기](https://school.programmers.co.kr/learn/courses/30/lessons/276035)


###### 문제 설명


`SKILLCODES` 테이블은 개발자들이 사용하는 프로그래밍 언어에 대한 정보를 담은 테이블입니다. `SKILLCODES` 테이블의 구조는 다음과 같으며, `NAME`, `CATEGORY`, `CODE`는 각각 스킬의 이름, 스킬의 범주, 스킬의 코드를 의미합니다. 스킬의 코드는 2진수로 표현했을 때 각 bit로 구분될 수 있도록 2의 제곱수로 구성되어 있습니다.




| NAME | TYPE | UNIQUE | NULLABLE |
| --- | --- | --- | --- |
| NAME | VARCHAR(N) | Y | N |
| CATEGORY | VARCHAR(N) | N | N |
| CODE | INTEGER | Y | N |


`DEVELOPERS` 테이블은 개발자들의 프로그래밍 스킬 정보를 담은 테이블입니다. `DEVELOPERS` 테이블의 구조는 다음과 같으며, `ID`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `SKILL_CODE`는 각각 개발자의 ID, 이름, 성, 이메일, 스킬 코드를 의미합니다. `SKILL_CODE` 컬럼은 INTEGER 타입이고, 2진수로 표현했을 때 각 bit는 `SKILLCODES` 테이블의 코드를 의미합니다.




| NAME | TYPE | UNIQUE | NULLABLE |
| --- | --- | --- | --- |
| ID | VARCHAR(N) | Y | N |
| FIRST\_NAME | VARCHAR(N) | N | Y |
| LAST\_NAME | VARCHAR(N) | N | Y |
| EMAIL | VARCHAR(N) | Y | N |
| SKILL\_CODE | INTEGER | N | N |


예를 들어 어떤 개발자의 `SKILL_CODE`가 400 (\=b'110010000')이라면, 이는 `SKILLCODES` 테이블에서 CODE가 256 (\=b'100000000'), 128 (\=b'10000000'), 16 (\=b'10000') 에 해당하는 스킬을 가졌다는 것을 의미합니다.




---


##### 문제


`DEVELOPERS` 테이블에서 Front End 스킬을 가진 개발자의 정보를 조회하려 합니다. 조건에 맞는 개발자의 ID, 이메일, 이름, 성을 조회하는 SQL 문을 작성해 주세요.


결과는 ID를 기준으로 오름차순 정렬해 주세요.




---


##### 예시


예를 들어 `SKILLCODES` 테이블이 다음과 같고,




| NAME | CATEGORY | CODE |
| --- | --- | --- |
| C\+\+ | Back End | 4 |
| JavaScript | Front End | 16 |
| Java | Back End | 128 |
| Python | Back End | 256 |
| C\# | Back End | 1024 |
| React | Front End | 2048 |
| Vue | Front End | 8192 |
| Node.js | Back End | 16384 |


`DEVELOPERS` 테이블이 다음과 같다면




| ID | FIRST\_NAME | LAST\_NAME | EMAIL | SKILL\_CODE |
| --- | --- | --- | --- | --- |
| D165 | Jerami | Edwards | `jerami_edwards@grepp.co` | 400 |
| D161 | Carsen | Garza | `carsen_garza@grepp.co` | 2048 |
| D164 | Kelly | Grant | `kelly_grant@grepp.co` | 1024 |
| D163 | Luka | Cory | `luka_cory@grepp.co` | 16384 |
| D162 | Cade | Cunningham | `cade_cunningham@grepp.co` | 8452 |


다음과 같이 `DEVELOPERS` 테이블에 포함된 개발자 중 Front End 스킬을 가진을 가진 개발자의 정보가 결과에 나와야 합니다.




| ID | EMAIL | FIRST\_NAME | LAST\_NAME |
| --- | --- | --- | --- |
| D161 | `carsen_garza@grepp.co` | Carsen | Garza |
| D162 | `cade_cunningham@grepp.co` | Cade | Cunningham |
| D165 | `jerami_edwards@grepp.co` | Jerami | Edwards |


