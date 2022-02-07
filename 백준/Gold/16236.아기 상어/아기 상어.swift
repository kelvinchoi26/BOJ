import Foundation

let n = Int(readLine()!)!
var graph = [[Int]]()

var shark = (-1,-1,-1)
var eatCnt = 0

for i in 0..<n {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph.append(t)
    
    if let j = t.firstIndex(of: 9) {
        shark = (i,j,2)
        graph[i][j] = 0
    }
}

var time = 0

func bfs() -> Bool {
    // 상어의 좌표 저장
    var queue = [(shark.0, shark.1, 0)]
    var idx = 0
    
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    var visit = Array(repeating: Array(repeating: false, count: n), count: n)
    visit[shark.0][shark.1] = true
    
    // 비교해서 큰 값만 저장
    var dist = Int.max
    // 물고기 좌표 저장
    var fishList = [(Int,Int)]()
    
    while queue.count > idx {
        let (x,y,cnt) = queue[idx]
        idx += 1
        
        if cnt > dist {continue}
        
        if (1..<shark.2).contains(graph[x][y]) {
            dist = cnt
            fishList.append((x,y))
        }
        
        for i in 0..<4 {
            let (nx,ny) = (x+dx[i], y+dy[i])
            if (0..<n).contains(nx) && (0..<n).contains(ny) && !visit[nx][ny] && graph[nx][ny] <= shark.2 {
                visit[nx][ny] = true
                queue.append((nx,ny,cnt+1))
            }
        }
    }
    
    if fishList.isEmpty {
        return false
    }
    
    // 물고기 리스트 클로저 이용해서 정렬
    fishList.sort{
        if $0.0 == $1.0 {
            return $0.1 < $1.1
        }
        return $0.0 < $1.0
    }
    
    let target = fishList.first!
    eatCnt += 1
    
    if eatCnt == shark.2 {
        shark.2 += 1
        eatCnt = 0
    }
    
    graph[target.0][target.1] = 0
    shark = (target.0, target.1, shark.2)
    
    time += dist
    return true
}

while true {
    if !bfs() {
        print(time)
        break
    }
}