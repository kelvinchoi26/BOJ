import Foundation

let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map{ Int($0)! }
let sum = Int(readLine()!)!

numbers.sort()

var smallest = 0, largest = (numbers.max())!

let budget = numbers.reduce(0) { $0 + $1 }

if budget <= sum {
    print(largest)
} else {
    while true {
        var mid = (smallest + largest) / 2
        var result = 0
        
        if smallest > largest {
            print(mid)
            exit(0)
        }
        
        for i in numbers {
            result += min(mid, i)
        }
        
        if result > sum {
            largest = mid - 1
        } else {
            smallest = mid + 1
        }
    }
}