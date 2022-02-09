import Foundation

let n = Int(readLine()!)!
let numApple = Int(readLine()!)!

var visit = Array(repeating: Array(repeating: -1, count: n+1), count: n+1)

for _ in 0..<numApple {
    let temp1 = readLine()!.split(separator: " ").map{ Int($0)! }
    let x = temp1[0] - 1
    let y = temp1[1] - 1
    
    // 사과가 위치한 좌표는 1로 표시
    visit[y][x] = 1
}

var directionChange = Int(readLine()!)!

var moveQueue: [(Int, Character)] = []

for _ in 0..<directionChange {
    let temp2 = readLine()!.split(separator: " ").map{ String($0) }
    let X = Int(temp2[0])!
    let C = Character(temp2[1])
    moveQueue.append((X, C))
}

var timeCount = 0

// 큐에 뱀의 출발 위치 추가
var queue = [(0, 0)]
var idx = 0
// 우하좌상
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
visit[0][0] = 0
// 게임 진행 시간
var count = 0

var temp3 = moveQueue.removeFirst()
var stopCount = temp3.0

while !queue.isEmpty {
    var (x,y) = queue.last!
    
    while count != stopCount {
        x += dx[idx]
        y += dy[idx]
        timeCount += 1
        
        if x<0 || y<0 || x>=n || y>=n {
            print(timeCount)
            exit(0)
        }
        
        if visit[x][y] == -1 {
            // 사과가 없는 경우
            visit[x][y] = 0
            queue.append((x,y))
            let temp4 = queue.removeFirst()
            // 꼬리 자르기
            visit[temp4.0][temp4.1] = -1
        } else if visit[x][y] == 1 {
            // 사과가 있는 경우
            visit[x][y] = -1
            queue.append((x,y))
            
        } else {
            print(timeCount)
            exit(0)
        }
        
        count += 1
    }
    
    if temp3.1 == "D" {
        if idx == 3 {
            idx = 0
        } else {
            idx += 1
        }
    } else {
        if idx == 0 {
            idx = 3
        } else {
            idx -= 1
        }
    }
    if !moveQueue.isEmpty {
        temp3 = moveQueue.removeFirst()
        stopCount = temp3.0
    } else {
        stopCount = 101
    }
}
print(timeCount)