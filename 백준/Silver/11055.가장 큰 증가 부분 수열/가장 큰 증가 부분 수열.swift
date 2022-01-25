import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: 0, count: 1001)

// i는 각 부분 수열의 마지막 수를 의미
for i in stride(from: 1, through: n, by: 1){
    dp[i] = arr[i - 1]
    for j in 1...i{
        if arr[i - 1] > arr[j - 1] {
            dp[i] = max(dp[j] + arr[i - 1], dp[i])
        }
    }
}

print(dp.max()!)