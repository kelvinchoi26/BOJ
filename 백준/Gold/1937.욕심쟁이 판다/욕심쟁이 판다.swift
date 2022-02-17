import Foundation

let n = Int(readLine()!)!
var map = [[Int]]()
var result = 0
var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

for _ in 0..<n {
    let temp = readLine()!.split(separator: " ").map{ Int(String($0))! }
    map.append(temp)
}
        
func dfs(_ x: Int, _ y: Int) -> Int {
    guard dp[x][y] == 0 else { return dp[x][y] }
    
    dp[x][y] = 1
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    for i in 0..<4 {
        let (nx,ny) = (x+dx[i],y+dy[i])
        if nx>=0 && nx<n && ny>=0 && ny<n && map[nx][ny] > map[x][y] {
                dp[x][y] = max(dp[x][y], dfs(nx, ny) + 1)
            }
        }
    return dp[x][y]
}


for i in 0..<n {
    for j in 0..<n {
        result = max(result, dfs(i, j))
    }
}

print(result)