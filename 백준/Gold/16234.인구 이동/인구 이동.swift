import Foundation

let NLR = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NLR[0], L = NLR[1], R = NLR[2]
var map = Array(repeating: [Int](), count: N)
var visit = Array(repeating: Array(repeating: false, count: N), count: N)

let dy = [0, 0, 1, -1]
let dx = [1, -1, 0, 0]
var BFSq = [(Int, Int)]()
var union = [[(Int, Int)]]()
var answer = 0

for i in 0..<N {
    map[i] = readLine()!.split(separator: " ").map { Int(String($0))! } }

func BFS(_ startY: Int, _ startX: Int) {
    var BFSq = [(Int, Int)]()
    var index = 0
    BFSq.append((startY, startX))
    visit[startY][startX] = true
    
    while index < BFSq.count {
        let cur = BFSq[index]
        index += 1
        for i in 0..<4 {
            if cur.0 + dy[i] < 0 || cur.0 + dy[i] >= N || cur.1 + dx[i] < 0 || cur.1 + dx[i] >= N {
                continue
            }
            if visit[cur.0 + dy[i]][cur.1 + dx[i]] == true {
                continue
            }
            let tmp = abs(map[cur.0][cur.1] - map[cur.0 + dy[i]][cur.1 + dx[i]])
            if tmp >= L, tmp <= R {
                visit[cur.0 + dy[i]][cur.1 + dx[i]] = true
                BFSq.append((cur.0 + dy[i], cur.1 + dx[i]))
            }
        }
    }
    union.append(BFSq)
}

while true {
    union = [[(Int, Int)]]()
    visit = Array(repeating: Array(repeating: false, count: N), count: N)
    for i in 0..<N {
        for j in 0..<N {
            if visit[i][j] == false {
                BFS(i, j)
            }
        }
    }
    if union.count == N * N {
        break
    }
    for i in 0..<union.count {
        var sum = 0
        if union[i].count == 1 {
            continue
        }
        for j in union[i] {
            sum += map[j.0][j.1]
        }
        for j in union[i] {
            map[j.0][j.1] = sum / union[i].count
        }
    }
    answer += 1
}
print(answer)