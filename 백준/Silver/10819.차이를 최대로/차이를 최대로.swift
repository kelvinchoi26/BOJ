import Foundation

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int(String($0))! }

// 가능한 모든 조합 저장
var results = [[Int]]()
var picked = [Int]()
var visited = Array(repeating: false, count: n)

// 재귀로 브루트포스 구현
func pick() {
    if picked.count == n {
        results.append(picked)
        return
    }
    for i in 0..<n {
        if visited[i] {
            continue
        }
        visited[i] = true
        picked.append(nums[i])
        pick()
        picked.removeLast()
        visited[i] = false
    }
}

pick()
var maximum = 0

for comb in results {
    var sum = 0
    for i in 0..<n-1 {
        sum += abs(comb[i] - comb[i+1])
    }
    maximum = max(sum, maximum)
}

print(maximum)