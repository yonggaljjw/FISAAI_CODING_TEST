# [1,2,3 떨어트리기](https://school.programmers.co.kr/learn/courses/30/lessons/150364)


###### 문제 설명


`춘식이`는 트리의 1번 노드에 숫자 1, 2, 3 중 하나씩을 계속해서 떨어트려 트리의 리프 노드[1](#fn1)에 숫자를 쌓는 게임을 하려고 합니다.   

아래 그림은 게임의 예시를 나타냅니다.


![railroad.jpg](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/8c0e537f-10d8-470b-b034-a9f532e2ccee/railload.jpg)


* 트리의 모든 간선은 부모 노드가 자식 노드를 가리키는 단방향 간선입니다.
* **모든 부모 노드는 자식 노드와 연결된 간선 중 하나를 길로 설정합니다.**
	+ 실선 화살표는 길인 간선입니다.
	+ 점선 화살표는 길이 아닌 간선입니다.
* 모든 부모 노드는 자신의 자식 노드 중 가장 번호가 작은 노드를 가리키는 간선을 초기 길로 설정합니다.


\[게임의 규칙]은 아래와 같습니다.


1. 1번 노드(루트 노드)에 숫자 1, 2, 3 중 하나를 떨어트립니다.
2. 숫자는 길인 간선을 따라 리프 노드까지 떨어집니다.
3. 숫자가 리프 노드에 도착하면, 숫자가 지나간 각 노드는 `현재 길로 연결된 자식 노드 다음으로 번호가 큰 자식 노드`를 가리키는 간선을 새로운 길로 설정하고 기존의 길은 끊습니다.
	* 만약 현재 길로 연결된 노드의 번호가 가장 크면, 번호가 가장 작은 노드를 가리키는 간선을 길로 설정합니다.
	* 노드의 간선이 하나라면 계속 하나의 간선을 길로 설정합니다.
4. 원하는 만큼 계속해서 루트 노드에 숫자를 떨어트릴 수 있습니다.
	* 단, 앞서 떨어트린 숫자가 리프 노드까지 떨어진 후에 새로운 숫자를 떨어트려야 합니다.


\[게임의 목표]는 각각의 리프 노드에 쌓인 숫자의 합을 `target`에서 가리키는 값과 같게 만드는 것입니다.  

예를 들어, `target`이 \[0, 0, 0, 3, 0, 0, 5, 1, 2, 3]일 경우 아래 표와 같은 의미를 가집니다.




| 노드 번호 | 노드에 쌓인 숫자의 합 |
| --- | --- |
| 1 | 0 |
| 2 | 0 |
| 3 | 0 |
| 4 | 3 |
| 5 | 0 |
| 6 | 0 |
| 7 | 5 |
| 8 | 1 |
| 9 | 2 |
| 10 | 3 |


`target`대로 리프 노드에 쌓인 숫자의 합을 맞추기 위해서는 \[2, 1, 2, 2, 1, 3, 3]순으로 숫자를 떨어트리면 됩니다.


아래 두 그림은 순서대로 1, 2번째 숫자 \[2, 1]을 떨어트린 뒤의 길 상황을 나타냅니다.  

![railroad21.jpg](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/93b09e90-73db-4ec8-851c-66fb4bf428a8/railroad21.jpg)


* 숫자 2는 떨어지면서 1번 노드와 2번 노드를 지나갔습니다.
	+ 1번 노드는 3번 노드를 가리키는 간선을 길로 설정합니다.
	+ 2번 노드는 5번 노드를 가리키는 간선을 길로 설정합니다.
* 숫자 1은 떨어지면서 1번 노드, 3번 노드, 6번 노드를 지나갔습니다.
	+ 1번 노드는 3번 노드보다 번호가 큰 노드를 가리키는 간선이 없으므로 다시 2번 노드를 가리키는 간선을 길로 설정합니다.
	+ 3번 노드는 간선이 하나이므로 계속해서 6번 노드를 가리키는 간선을 길로 설정합니다.
	+ 6번 노드는 9번 노드를 가리키는 간선을 길로 설정합니다.


아래 두 그림은 순서대로 3, 4번째 숫자 \[2, 2]를 떨어트린 뒤의 길 상황을 나타냅니다.  

![railroad2122.jpg](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/fc3a6a07-1a1e-41b7-9ce8-d08113d42a2c/railroad2122.jpg)


아래 세 그림은 순서대로 5, 6, 7번째 숫자 \[1, 3, 3]을 떨어트린 뒤의 길 상황을 나타냅니다.  

![railroad2122133.jpg](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/791e4e74-7017-44b2-93e6-68503e1f24a1/railroad2122133.jpg)


각 리프 노드에 쌓인 숫자를 모두 더해 배열로 나타내면 `target`과 같습니다.


트리의 각 노드들의 연결 관계를 담은 2차원 정수 배열 `edges`, 각 노드별로 만들어야 하는 숫자의 합을 담은 1차원 정수 배열 `target`이 매개변수로 주어집니다. 이때, `target` 대로 리프 노드에 쌓인 숫자의 합을 맞추기 위해 숫자를 떨어트리는 모든 경우 중 가장 적은 숫자를 사용하며 그중 사전 순으로 가장 빠른 경우를 1차원 정수 배열에 담아 return 하도록 solution 함수를 완성해주세요. 만약, `target`대로 숫자의 합을 만들 수 없는 경우 `[-1]`을 return 해주세요.




---


##### 제한사항


* 1 ≤ `edges`의 길이 ≤ 100
	+ `edges[i]`는 \[부모 노드 번호, 자식 노드 번호] 형태로, 단방향으로 연결된 두 노드를 나타냅니다.
		- 1 ≤ 노드 번호 ≤ `edges`의 길이 \+ 1
	+ 동일한 간선에 대한 정보가 중복해서 주어지지 않습니다.
	+ 항상 하나의 트리 형태로 입력이 주어지며, 잘못된 데이터가 주어지는 경우는 없습니다.
	+ 1번 노드는 항상 루트 노드입니다.
* `target`의 길이 \= `edges`의 길이 \+ 1
	+ `target[i]`는 i \+ 1번 노드에 쌓인 숫자의 합으로 만들어야 하는 수를 나타냅니다.
		- 0 ≤ 리프 노드의 `target`값 ≤ 100
		- 리프 노드를 제외한 노드의 `target`값 \= 0
	+ `target`의 원소의 합은 1 이상입니다.




---


##### 입출력 예




| edges | target | result |
| --- | --- | --- |
| \[\[2, 4], \[1, 2], \[6, 8], \[1, 3], \[5, 7], \[2, 5], \[3, 6], \[6, 10], \[6, 9]] | \[0, 0, 0, 3, 0, 0, 5, 1, 2, 3] | \[1, 1, 2, 2, 2, 3, 3] |
| \[\[1, 2], \[1, 3]] | \[0, 7, 3] | \[1, 1, 3, 2, 3] |
| \[\[1, 3], \[1, 2]] | \[0, 7, 1] | \[\-1] |




---


##### 입출력 예 설명


**입출력 예 \#1**


문제 예시와 같습니다. 위의 설명처럼 \[2, 1, 2, 2, 1, 3, 3]순으로 숫자를 떨어트리면 target과 같게 만들 수 있지만, 가장 적은 숫자를 사용하며 그중 사전 순으로 가장 빠른 경우는 \[1, 1, 2, 2, 2, 3, 3]입니다.


**입출력 예 \#2**


\[3, 2, 1, 1, 3]순으로 숫자를 떨어트리거나 \[1, 1, 1, 1, 2, 1, 3]순으로 숫자를 떨어트려도 target과 같게 만들 수 있지만, 가장 적은 숫자를 사용하며 그중 사전 순으로 가장 빠른 경우는 \[1, 1, 3, 2, 3]입니다. 


![railroad ex2.jpg](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/b66b8fd9-ce35-4f5f-8502-401328e1e10a/railroad%20ex2.jpg)


**입출력 예 \#3**


예제 3번의 트리는 주어지는 `edges`의 순서만 다를 뿐, 예제 2번과 같은 트리입니다. 2번 노드에 쌓인 숫자의 합을 7로 만들면서 3번 노드에 쌓인 숫자의 합을 1로 만들도록 숫자를 떨어트리는 방법은 없습니다.  

따라서 \[\-1]을 return 해야 합니다.





---


1. 리프 노드는 자식 노드가 없는 노드를 뜻합니다. [↩](#fnref1)




