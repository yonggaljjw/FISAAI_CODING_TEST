# [행렬과 연산](https://school.programmers.co.kr/learn/courses/30/lessons/118670)


###### 문제 설명


**\[본 문제는 정확성과 효율성 테스트 각각 점수가 있는 문제입니다.]**


당신은 행렬에 적용할 수 있는 두 가지 연산을 만들었습니다.


* **ShiftRow**
	+ 모든 행이 아래쪽으로 한 칸씩 밀려납니다.
	즉, 모든 행에 대해서 `i`번째 행은 `i+1`번째 행이 됩니다. (마지막 행은 1번째 행이 됩니다.)
	+ ShiftRow의 예
	![Untitled Diagram.drawio (52).png](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/adc18f4a-5a51-40eb-9b57-997efbf27e96/Untitled%20Diagram.drawio%20%2852%29.png)
		- 왼쪽 행렬이 초기 상태이고 오른쪽 행렬이 ShiftRow를 한 번 시행한 뒤의 행렬입니다.
		- 1번째 행에 있던 \[1,2,3]이 2번째 행으로, 2번째 행에 있던 \[4,5,6]이 3번째 행으로, 3번째 행에 있던 \[7,8,9]가 1번째 행이 된 것을 확인할 수 있습니다.


* **Rotate**
	+ 행렬의 바깥쪽에 있는 원소들을 시계 방향으로 한 칸 회전시킵니다.
	+ 행렬의 바깥쪽에 있는 원소들은 첫 행, 첫 열, 끝 행, 끝 열에 포함되는 원소들입니다.
	+ 한 칸 회전시킨다는 것은 이 원소들이 시계 방향으로 한 칸씩 밀려난다는 것을 의미합니다.
	즉, 다음 4개의 연산이 동시에 시행됩니다.
		- 첫 행에서 끝 열에 있는 원소를 제외한 첫 행의 모든 원소는 오른쪽으로 한 칸 이동합니다.
		- 끝 열에서 끝 행에 있는 원소를 제외한 끝 열의 모든 원소는 아래쪽으로 한 칸 이동합니다.
		- 끝 행에서 첫 열에 있는 원소를 제외한 끝 행의 모든 원소는 왼쪽으로 한 칸 이동합니다.
		- 첫 열에서 첫 행에 있는 원소를 제외한 첫 열의 모든 원소는 위쪽으로 한 칸 이동합니다.
	+ Rotate의 예
	![Untitled Diagram.drawio (51).png](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/a03423c4-60fa-4841-a4e7-271be6202484/Untitled%20Diagram.drawio%20%2851%29.png)
		- 왼쪽 행렬이 초기 상태이고 오른쪽 행렬이 Rotate를 한 번 시행한 뒤의 행렬입니다.
		- 바깥쪽에 있는 값들이 시계 방향으로 한 칸씩 이동한 것을 확인할 수 있습니다.


당신은 행렬에 연산을 여러 번 시행하려고 합니다.  

행렬의 초기 상태를 담고 있는 2차원 정수 배열 `rc`, 시행할 연산을 순서대로 담고 있는 문자열 배열 `operations`가 매개변수로 주어졌을 때, 연산을 차례대로 시행한 후의 행렬 상태를 return 하도록 solution 함수를 완성해주세요.




---


##### 제한사항


* 2 ≤ `rc`의 행 길이(\=행렬의 가로 길이) ≤ 50,000
	+ `rc`의 모든 행의 길이는 동일합니다.
* 2 ≤ `rc`의 열 길이(\=행렬의 세로 길이) ≤ 50,000
	+ `rc`의 모든 열의 길이는 동일합니다.
* 4 ≤ `rc`의 행 길이 x `rc`의 열 길이 ≤ 100,000
* `rc[i][j]` 는 `i+1`번째 행 `j+1`번째 열에 있는 원소를 나타냅니다.
	+ 1 ≤ `rc[i][j]` ≤ 1,000,000
* 1 ≤ `operations`의 길이 ≤ 100,000
	+ `operations`의 원소는 `"ShiftRow"` 혹은 `"Rotate"`입니다.


**정확성 테스트 케이스 제한 사항**


* 2 ≤ `rc`의 행 길이(\=행렬의 가로 길이) ≤ 1,000
	+ `rc`의 모든 행의 길이는 동일합니다.
* 2 ≤ `rc`의 열 길이(\=행렬의 세로 길이) ≤ 1,000
	+ `rc`의 모든 열의 길이는 동일합니다.
* 4 ≤ `rc`의 행 길이 x `rc`의 열 길이 ≤ 10,000
* 1 ≤ `operations`의 길이 ≤ 100


**효율성 테스트 케이스 제한 사항**


* 주어진 조건 외 추가 제한사항 없습니다.




---


##### 입출력 예




| rc | operations | result |
| --- | --- | --- |
| \[\[1, 2, 3], \[4, 5, 6], \[7, 8, 9]] | `["Rotate", "ShiftRow"]` | \[\[8, 9, 6], \[4, 1, 2], \[7, 5, 3]] |
| \[\[8, 6, 3], \[3, 3, 7], \[8, 4, 9]] | `["Rotate", "ShiftRow", "ShiftRow"]` | \[\[8, 3, 3], \[4, 9, 7], \[3, 8, 6]] |
| \[\[1, 2, 3, 4], \[5, 6, 7, 8], \[9, 10, 11, 12]] | `["ShiftRow", "Rotate", "ShiftRow", "Rotate"]` | \[\[1, 6, 7 ,8], \[5, 9, 10, 4], \[2, 3, 12, 11]] |




---


##### 입출력 예 설명


**입출력 예\#1**


![Untitled Diagram.drawio (50).png](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/e409e001-6e7b-4695-9d8b-4a2abf0e6042/Untitled%20Diagram.drawio%20%2850%29.png)


위 그림은 `”Rotate”`와 `”ShiftRow”`를 차례대로 실행한 결과입니다.


따라서 \[\[8, 9, 6], \[4, 1, 2], \[7, 5, 3]]을 return 해야 합니다.


**입출력 예\#2**


![Untitled Diagram.drawio (49).png](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/9005dfbe-288c-4dfd-8073-abe2eb594885/Untitled%20Diagram.drawio%20%2849%29.png)


위 그림은 `”Rotate”`, `”ShiftRow”`, `"ShiftRow"`를 차례대로 실행한 결과입니다.


따라서 \[\[8, 3, 3], \[4, 9, 7], \[3, 8, 6]]을 return 해야 합니다.


**입출력 예\#3**


![Untitled Diagram.drawio (54).png](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/35ca2a90-0c48-4521-bf00-7bc9c4e8a18d/Untitled%20Diagram.drawio%20%2854%29.png)


위 그림은 `”ShiftRow”`, `”Rotate”`, `”ShiftRow”`, `”Rotate”`를 차례대로 실행한 결과입니다.


따라서 \[\[1, 6, 7 ,8], \[5, 9, 10, 4], \[2, 3, 12, 11]]을 return 해야 합니다.




---


**제한시간 안내**


* 정확성 테스트 : 10초
* 효율성 테스트 : 언어별로 작성된 정답 코드의 실행 시간의 적정 배수



