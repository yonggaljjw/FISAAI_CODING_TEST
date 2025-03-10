# [중요한 도로](https://school.programmers.co.kr/learn/courses/30/lessons/214293)


###### 문제 설명


현대모비스의 자율주행 시스템은 출발지와 목적지를 입력하면 목적지에 도착하기까지의 가장 빠른 예상 소요 시간을 알려줍니다. 자율주행 시스템은 도시 내에 있는 `n`개의 지점을 연결하는 양방향 도로 `m`개의 교통량을 분석해서 예상 소요 시간을 실시간으로 계산합니다. 만약 어떤 도로의 길이가 `L`이고 교통량이 `T`라면 해당 도로를 통과하는데 `L` \+ `T`분이 소요됩니다. (0 ≤ `T`)


다음은 `n` \= 5, `m` \= 7인 예시입니다.


![ex1-1.png](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/ae23d83f-01e7-4bdf-8bec-460522ced636/ex1-1.png)


* 원은 지점을 나타내며, 원에 적힌 수는 지점의 번호입니다. **항상 1번 지점이 출발지, `n`번 지점이 목적지입니다.**
* 선분은 지점을 연결하는 도로를 나타내며, 선분 옆에 적힌 수는 `[#도로 번호] 길이/교통량`을 의미합니다.
* 목적지에 도착하기까지의 가장 빠른 예상 소요 시간은 1\-2\-4\-5와 같이 이동했을 때 20(\= 10 \+ 8 \+ 2\)분입니다.


이때 7번 도로의 교통량이 3 증가한다고 가정해 보겠습니다.


![ex1-2.png](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/1d7e4886-a062-498c-b686-d282e8882045/ex1-2.png)


* 목적지에 도착하기까지의 가장 빠른 예상 소요 시간은 1\-2\-5와 같이 이동했을 때 22(\= 10 \+ 12\)분으로, 교통량이 변하기 전에 비해 2분 증가했습니다.


7번 도로 대신 2번 도로의 교통량이 2 증가한다고 가정해 보겠습니다.


![ex1-3.png](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/3e771a1d-c8d7-4ded-8479-db08c878d6a0/ex1-3.png)


* 목적지에 도착하기까지의 가장 빠른 예상 소요 시간은 1\-3\-4\-5와 같이 이동했을 때 20(\= 9 \+ 9 \+ 2\)분으로, 교통량이 변하기 전과 같습니다.


2, 7번 도로 대신 5번 도로의 교통량이 6 감소한다고 가정해 보겠습니다.


![ex1-4.png](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/dea4a88f-deb8-437a-ba7b-497e57d90ca3/ex1-4.png)


* 목적지에 도착하기까지의 가장 빠른 예상 소요 시간은 1\-3\-5와 같이 이동했을 때 19(\= 10 \+ 9\)분으로, 교통량이 변하기 전에 비해 1분 감소했습니다.


모든 도로의 교통량 정보를 실시간으로 업데이트하는 것은 비효율적이기 때문에, 위와 같이 한 도로의 교통량이 변했을 때 가장 빠른 예상 소요 시간이 변할 수 있는 도로(5, 7번 도로)에 대해서만 실시간으로 교통량 정보를 업데이트해야 합니다.


지점의 수를 나타내는 정수 `n`과 도로의 정보를 나타내는 2차원 정수 배열 `roads`가 매개변수로 주어집니다. 이때 한 도로의 교통량이 변했을 때 1번 지점에서 출발해 `n`번 지점에 도착하는 가장 빠른 예상 소요 시간이 변할 수 있는 도로의 번호를 **오름차순으로** 1차원 정수 배열에 담아 return 하도록 solution 함수를 완성해 주세요. 만약 그러한 도로가 없다면 \[\-1]을 return 합니다.




---


##### 제한사항


* 2 ≤ `n` ≤ 50,000
	+ 1번 지점이 출발지, `n`번 지점이 목적지입니다.
* `n` \- 1 ≤ `roads`의 길이 \= `m` ≤ 200,000
	+ `roads[i]`는 `i+1`번 도로에 대한 정보를 담고 있으며 `[U, V, L, T]` 형태의 길이가 4인 1차원 정수 배열입니다.
	+ `U`번 지점과 `V`번 지점을 연결하는 길이 `L`, 교통량 `T`인 도로를 의미합니다.
	+ 1 ≤ `U` \< `V` ≤ `n`
	+ 1 ≤ `L` ≤ 109
	+ 0 ≤ `T` ≤ 109
	+ 서로 다른 두 지점을 직접 연결하는 도로는 최대 1개입니다.
	+ 도로를 통해 한 지점에서 다른 지점으로 이동하는 방법이 항상 존재합니다.




---


##### 입출력 예




| n | roads | result |
| --- | --- | --- |
| 5 | \[\[1, 2, 10, 0], \[2, 4, 8, 0], \[1, 3, 9, 0], \[3, 4, 9, 0], \[3, 5, 10, 6], \[2, 5, 10, 2], \[4, 5, 2, 0]] | \[5, 7] |
| 4 | \[\[1, 2, 10, 10], \[2, 3, 10, 10], \[3, 4, 10, 10]] | \[1, 2, 3] |
| 4 | \[\[1, 2, 5, 0], \[2, 4, 5, 0], \[1, 3, 5, 0], \[3, 4, 5, 0]] | \[\-1] |
| 4 | \[\[1, 2, 5, 0], \[2, 4, 5, 0], \[1, 3, 5, 0], \[3, 4, 5, 0], \[1, 4, 5, 5]] | \[5] |




---


##### 입출력 예 설명


**입출력 예 \#1**


문제 예시와 같습니다.


**입출력 예 \#2**


![ex2-1.png](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/5b4e0ccd-7404-4489-a164-3cb166f1eedf/ex2-1.png)


4개의 지점은 일자로 연결된 형태입니다. 1번 지점에서 4번 지점으로 가기 위해서는 반드시 모든 도로를 거쳐가야 하며, 따라서 모든 도로의 교통량이 예상 소요 시간에 영향을 미칩니다. 따라서 `[1, 2, 3]`을 return 해야 합니다.


**입출력 예 \#3**


![ex3-1.png](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/de0047b4-07ab-4148-ab68-372f2f37675f/ex3-1.png)


* 1번 또는 2번 도로의 교통량이 증가했을 때 가장 빠른 예상 소요 시간은 1\-3\-4와 같이 이동했을 때 10(\= 5 \+ 5\)분입니다.
* 3번 또는 4번 도로의 교통량이 증가했을 때 가장 빠른 예상 소요 시간은 1\-2\-4와 같이 이동했을 때 10(\= 5 \+ 5\)분입니다.


어떤 도로의 교통량이 변하여도 교통량이 변하기 전과 가장 빠른 예상 소요 시간이 같습니다. 교통량이 변했을 때 가장 빠른 예상 소요 시간이 변하는 도로가 없으므로 `[-1]`을 return 해야 합니다.


**입출력 예 \#4**


![ex4-1.png](https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/23cd43ff-edca-4376-9bd1-86f0810b5b4b/ex4-1.png)


* 3번째 예시와 같지만 5번 도로가 추가되었습니다.


5번 도로의 교통량이 감소한다면 1\-4와 같이 이동했을 때 가장 빠른 예상 소요 시간이 10분보다 작아집니다. 따라서 `[5]`를 return 해야 합니다.



