import Foundation

typealias Coord = (r: Int, c: Int)

let temp = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = temp[0], m = temp[1]
var result = 0

var arr = [[Character]]()

for _ in 0..<n {
    let temp = String(readLine()!)
    arr.append(Array(temp))
}

func bfs(_ x: Int, _ y: Int) -> Int {
    var queue = [Coord]()
    var dist = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
    // 이동한 거리를 기록하는 변수
    // dp 그래프처럼 계속 쌓아나가는 방식
    dist[x][y] = 0
    var distCount = 0

    let dx = [1,0,-1,0]
    let dy = [0,1,0,-1]
    
    queue.append((x,y))
    var index = 0
    
    while index < queue.count {
        let (x,y) = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
        
            if nx>=0 && ny>=0 && nx<n && ny<m {
                if arr[nx][ny] == "L" && dist[nx][ny] == -1 {
                    dist[nx][ny] = dist[x][y] + 1
                    distCount = max(distCount, dist[nx][ny])
                    queue.append((nx, ny))
                }
            }
        }
    }
    return distCount
}

for i in 0..<n {
    for j in 0..<m {
        if arr[i][j] == "L" {
            let temp = bfs(i, j)
            result = max(result, temp)
        }
    }
}

print(result)