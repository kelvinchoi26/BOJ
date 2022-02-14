from math import factorial
 
def getNumOfCombinations(n, m):
    return factorial(n+m) / (factorial(n) * factorial(m))
 
# 0: n개, 1: m개
n, m, k = map(int, input().split())
 
 
# k번째 문자열을 만들 수 없는 경우
if getNumOfCombinations(n,m) < k:
    answer = -1
 
else:
    k -= 1
    answer = ""
 
    while True:
        if n == 0 or m == 0:
            break
 
        numOfCase = getNumOfCombinations(n-1, m)
 
        # 앞에 0을 붙였을 때 경우의 수가 더 많으면 무조건 0을 앞으로 해야함
        if k < numOfCase:
            answer += "a"
            n -= 1
        # 앞에 0일 때 경우의 수가 부족하다 = 1을 앞쪽으로 배치해야 한다.
        else:
            answer += "z"
            m -= 1
            k -= numOfCase
 
    # 남은 z나 a를 이어붙여준다.
    answer += "z" * m + "a" * n
 
 
print(answer)