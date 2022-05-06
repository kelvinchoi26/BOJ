import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var graph = board
    let size = graph.count
    var array : [Int] = []
    var result = 0
    
    for move in moves {
        for i in 0..<size {
            let num = graph[i][move-1]
            // 0 아닌 수가 발견되는 경우 배열에 저장 후 종료
            if num != 0 {
                graph[i][move-1] = 0
                // last 함수 복잡도 O(1)
                if array.last != num {
                    array.append(num)
                    break
                } else {
                    array.removeLast()
                    result += 2
                    break
                }
            }
        }
    }
    return result
}