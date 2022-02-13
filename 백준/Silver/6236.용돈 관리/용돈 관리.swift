import Foundation

let temp = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = temp[0], M = temp[1]

var arr = Array(repeating: 0, count: N)

for i in 0..<N {
    arr[i] = Int(readLine()!)!
}

var left = 0
var right = arr.reduce(0){ $0 + $1 }
var answer = arr.reduce(0){ $0 + $1 }

while left <= right {
    let mid = (left + right) / 2
    var count = 0, money = 0
    var lack = false
        
    for d in arr {
        if mid - d < 0 {
            lack = true
            break
        } else if money - d < 0 {
            money = mid
            count += 1
        }
        money -= d
    }
    
    if lack == false {
        if count <= M {
            right = mid - 1
            if mid < answer {
                answer = mid
            }
        } else if count > M {
            left = mid + 1
        }
    } else {
        left = mid+1
    }
}

        
print(answer)