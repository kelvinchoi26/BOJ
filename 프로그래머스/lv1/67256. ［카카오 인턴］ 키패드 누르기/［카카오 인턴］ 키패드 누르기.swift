import Foundation

// 양손 처음엔 *, #에서 시작 
var leftKey = [0,3]
var rightKey = [2,3]

var graph = [[1,3],[0,0],[1,0],[2,0],[0,1],[1,1],[2,1],[0,2],[1,2],[2,2]]

func handResult(_ num:Int,_ hand:String) -> String {
    switch num {
        case 1, 4, 7:
            leftKey = graph[num]
            return "L"
        case 3, 6, 9:
            rightKey = graph[num]
            return "R"
        default:
            let leftDist = abs(graph[num][0]-leftKey[0]) + abs(graph[num][1]-leftKey[1])
            let rightDist = abs(graph[num][0]-rightKey[0]) + abs(graph[num][1]-rightKey[1])
            
            if leftDist < rightDist {
                leftKey = graph[num]
                return "L"
            } else if rightDist < leftDist {
                rightKey = graph[num]
                return "R"
            } else {
                if hand == "left" {
                    leftKey = graph[num]
                    return "L"
                } else {
                    rightKey = graph[num]
                    return "R"
                }
            }
    }
}
func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = ""
    for num in numbers {
        result.append(handResult(num,hand))
    }
    return result
}