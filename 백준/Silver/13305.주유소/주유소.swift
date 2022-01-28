import Foundation

let N = Int(readLine()!)!
let distance = readLine()!.split(separator: " ").map({Int(String($0))!})
let city = readLine()!.split(separator: " ").map({Int(String($0))!})
var min = city[0]
var price = city[0] * distance[0]
var d = 0

for i in 1..<city.count-1 {
    d += 1
    if city[i] < min { min = city[i] }
    price += min * distance[d]
}

print(price)