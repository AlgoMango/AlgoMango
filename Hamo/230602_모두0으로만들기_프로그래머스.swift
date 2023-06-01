import Foundation

func solution(_ a:[Int], _ edges:[[Int]]) -> Int64 {
    var graph: [[Int]] = Array(repeating: [], count: a.count)
    var tempA = a
    var result: Int64 = 0
    
    for edge in edges {
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    }
    
    func dfs(parent: Int, current: Int) {
        for child in graph[current] {
            if child != parent {
                dfs(parent: current, current: child)
            }
        }
        
        tempA[parent] += tempA[current]
        result += Int64(abs(tempA[current]))
        tempA[current] = 0
    }
    
    
    
    guard tempA.reduce(0, +) == 0 else {
        return -1
    }
    
    dfs(parent: 0, current: 0)
    
    return result
}
