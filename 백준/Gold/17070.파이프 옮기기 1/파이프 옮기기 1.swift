let N = Int(readLine()!)!
var map = Array(repeating: [Int](), count: N)
var dp = Array(repeating: Array(repeating: [0, 0, 0], count: N), count: N)
var ans = 0

for i in 0..<N {
    map[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

dp[0][1][0] = 1
for i in 2..<N {
    if map[0][i] == 0 {
        dp[0][i][0] = dp[0][i - 1][0]
    }
}
for i in 1..<N {
    for j in 2..<N {
        if map[i][j] == 0 && map[i - 1][j] == 0 && map[i][j - 1] == 0 {
            dp[i][j][2] = dp[i - 1][j - 1][0] + dp[i - 1][j - 1][1] + dp[i - 1][j - 1][2]
        }
        if map[i][j] == 0 {
            dp[i][j][0] = dp[i][j - 1][0] + dp[i][j - 1][2]
            dp[i][j][1] = dp[i - 1][j][1] + dp[i - 1][j][2]
        }
    }
}
print(dp[N - 1][N - 1][0] + dp[N - 1][N - 1][1] + dp[N - 1][N - 1][2])