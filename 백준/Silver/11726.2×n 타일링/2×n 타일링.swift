import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1000)

dp[0] = 1
dp[1] = 2

if n == 1 || n == 2 {
    print(dp[n-1])
    exit(0)
}

for i in 2..<n {
    dp[i] = (dp[i-1] + dp[i-2]) % 10007
}

print(dp[n-1])