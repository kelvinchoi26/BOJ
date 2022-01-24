import Foundation

let n = Int(readLine()!)!
var dp = [[Int]]()
var largestSum = 0

for _ in 0..<n {
    dp.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}

// 두 번째 줄부터 더 해주면 됨
for i in 1..<n {
    // i와 j의 최대는 항상 같음
    for j in 0..<i+1 {
        if j == 0 {
            dp[i][j] += dp[i-1][j]
        } else if j == i {
            dp[i][j] += dp[i-1][j-1]
        } else {
            // 두 갈래로 나아가지만 가장 큰 값만 더 해주기 (어차피 큰 값 찾는 문제)
            dp[i][j] += max(dp[i-1][j], dp[i-1][j-1])
        }
    }
}

print(dp[n-1].max()!)