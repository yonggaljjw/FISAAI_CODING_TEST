def solution(strlist):
    answer = []
    for i in strlist:
        answer.append(len(i))
    return answer

# sol 2
def solution(strlist):
    answer = list(map(len, strlist))
    return answer
