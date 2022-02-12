import Foundation

let temp = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = temp[0], M = temp[1]

var graph = Array(repeating: Array(repeating: 0, count: M), count: N)
var dp = Array(repeating: Array(repeating: 0, count: M), count: N)

for i in 0..<N {
    let temp = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph[i] = temp
}

dp[0][0] = graph[0][0]

for i in 0..<N {
    for j in 0..<M {
        // 0,0 제외
        if i != 0 || j != 0 {
            if i == 0 {
                dp[i][j] = dp[i][j-1] + graph[i][j]
            } else if j == 0 {
                dp[i][j] = dp[i-1][j] + graph[i][j]
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1]) + graph[i][j]
            }
        }
    }
}

print(dp[N-1][M-1])