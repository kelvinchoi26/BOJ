import Foundation

let string1 = String(readLine()!)
let string2 = String(readLine()!)

var arr1 = [Character]()
var arr2 = [Character]()

for i in string1 {
    arr1.append(i)
}

for j in string2 {
    arr2.append(j)
}

let count = max(string1.count, string2.count)
var dp = Array(repeating: Array(repeating: 0, count: count), count: count)

var answer = 0

for k in 0..<arr1.count {
    for m in 0..<arr2.count {
        if arr1[k] == arr2[m] {
            if k == 0 || m == 0 {
                dp[k][m] = 1
            } else {
                dp[k][m] = dp[k-1][m-1] + 1
                answer = max(dp[k][m], answer)
            }
        }
    }
}

print(answer)