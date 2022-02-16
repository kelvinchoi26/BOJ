import Foundation

let temp1 = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = temp1[0], M = temp1[1]
let num = readLine()!.split(separator: " ").map{ Int(String($0))! }
let sum = num.reduce(0, +)
var low = num.max()!, high = sum

while low < high {
    let mid = (low+high)/2
    var cnt = 1
    var sum = 0

    for v in num {
        if sum + v > mid {
            cnt += 1
            sum = v
        } else {
            sum += v
        }
    }
        
    if cnt <= M {
        high = mid
    } else {
        low = mid + 1
    }
}

print(high)