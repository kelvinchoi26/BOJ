import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var list = Array(repeating: [Int](),count: n+1)
var queue = [(Int, Int)]()
var visited = Array(repeating: false, count: n+1)

for _ in 0..<m {
    let temp = readLine()!.split(separator: " ").map{ Int(String($0))! }
    list[temp[0]].append(temp[1])
    list[temp[1]].append(temp[0])
}

// BFS
queue.append((1,0))
visited[1] = true
var index = 0
var result = 0

while queue.count > index {
    let temp1 = queue[index]
    let x = temp1.0, y = temp1.1
    
    if y < 2 {
        for next in list[x]{
            if !visited[next]{
                visited[next] = true
                queue.append((next, y+1))
                result += 1
            }
        }
    }
    index += 1
}
print(result)