# [OX퀴즈](https://school.programmers.co.kr/learn/courses/30/lessons/120907)


###### 문제 설명


덧셈, 뺄셈 수식들이 'X \[연산자] Y \= Z' 형태로 들어있는 문자열 배열 `quiz`가 매개변수로 주어집니다. 수식이 옳다면 "O"를 틀리다면 "X"를 순서대로 담은 배열을 return하도록 solution 함수를 완성해주세요.




---


##### 제한사항


* 연산 기호와 숫자 사이는 항상 하나의 공백이 존재합니다. 단 음수를 표시하는 마이너스 기호와 숫자 사이에는 공백이 존재하지 않습니다.
* 1 ≤ `quiz`의 길이 ≤ 10
* X, Y, Z는 각각 0부터 9까지 숫자로 이루어진 정수를 의미하며, 각 숫자의 맨 앞에 마이너스 기호가 하나 있을 수 있고 이는 음수를 의미합니다.
* X, Y, Z는 0을 제외하고는 0으로 시작하지 않습니다.
* \-10,000 ≤ X, Y ≤ 10,000
* \-20,000 ≤ Z ≤ 20,000
* \[연산자]는 \+ 와 \- 중 하나입니다.




---


##### 입출력 예




| quiz | result |
| --- | --- |
| \["3 \- 4 \= \-3", "5 \+ 6 \= 11"] | \["X", "O"] |
| \["19 \- 6 \= 13", "5 \+ 66 \= 71", "5 \- 15 \= 63", "3 \- 1 \= 2"] | \["O", "O", "X", "O"] |




---


##### 입출력 예 설명


입출력 예 \#1


* 3 \- 4 \= \-3 은 틀린 수식이므로 "X", 5 \+ 6 \= 11 은 옳은 수식이므로 "O" 입니다. 따라서 \["X", "O"]를 return합니다.


입출력 예 \#2


* 19 \- 6 \= 13 은 옳은 수식이므로 "O", 5 \+ 66 \= 71 은 옳은 수식이므로 "O", 5 \- 15 \= 63 은 틀린 수식이므로 "X", 3 \- 1 \= 2는 옳은 수식이므로 "O" 따라서 \["O", "O", "X", "O"]를 return합니다.



