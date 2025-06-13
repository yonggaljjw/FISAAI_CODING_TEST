def solution(s1, s2):
    answer = 0
    for i in s1:
        for n in s2:
            if i == n:
                answer += 1
    return answer
## 이중 for 문으로 인해 비효율 가능성 존재.
## 최적화를 위해 리스트 교집합을 사용하는게 더 좋음


# sol2
def solution(s1, s2):
    return len(set(s1) & set(s2))  # 교집합의 크기 반환

## set은 파이썬에서 집합 자료형을 제공하며, 집합 간의 연산(교집합, 합집합 등)을 효율적으로 처리할 수 있음
## 이를 활용하면 두 리스트에서 공통 요소의 개수를 쉽게 구할 수 있음
### 문제 제한 사항으로 "s1과 s2는 각각 중복된 원소를 갖지 않습니다."라고 되어 있기 때문에 set을 사용해도 무방

"""
코드 설명:
1. set(s1)과 set(s2):
- 두 배열을 집합으로 변환합니다.
- 배열에 중복된 원소가 없으므로, 집합으로 변환해도 데이터 손실이 없습니다.

2. set(s1) & set(s2):
- 두 집합의 교집합을 계산합니다.
- 교집합은 두 집합에서 공통으로 포함된 원소들로 이루어진 집합입니다.

3. len(...):
- 교집합의 크기를 반환하여 공통 원소의 개수를 구합니다.
"""