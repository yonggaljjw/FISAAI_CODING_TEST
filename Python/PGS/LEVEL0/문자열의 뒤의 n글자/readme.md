# [문자열의 뒤의 n글자](https://school.programmers.co.kr/learn/courses/30/lessons/181910)


###### 문제 설명


문자열 `my_string`과 정수 `n`이 매개변수로 주어질 때, `my_string`의 뒤의 `n`글자로 이루어진 문자열을 return 하는 solution 함수를 작성해 주세요.




---


##### 제한사항


* `my_string`은 숫자와 알파벳으로 이루어져 있습니다.
* 1 ≤ `my_string`의 길이 ≤ 1,000
* 1 ≤ `n` ≤ `my_string`의 길이




---


##### 입출력 예




| my\_string | n | result |
| --- | --- | --- |
| "ProgrammerS123" | 11 | "grammerS123" |
| "He110W0r1d" | 5 | "W0r1d" |




---


##### 입출력 예


입출력 예 \#1


* 예제 1번의 `my_string`에서 뒤의 11글자는 "grammerS123"이므로 이 문자열을 return 합니다.


입출력 예 \#2


* 예제 2번의 `my_string`에서 뒤의 5글자는 "W0r1d"이므로 이 문자열을 return 합니다.



