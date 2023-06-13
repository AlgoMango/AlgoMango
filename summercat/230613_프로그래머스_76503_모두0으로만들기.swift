// 다시풀기
import Foundation

var answer: Int64 = 0
var vertice: [Int] = []
var map: [[Int]] = []

func solution(_ a:[Int], _ edges:[[Int]]) -> Int64 {
    if a.reduce(0, +) != 0 { return -1 }
    
    vertice = a
    map = Array(repeating: [], count: a.count)
    
    for edge in edges {
        map[edge[0]].append(edge[1])
        map[edge[1]].append(edge[0])
    }
    
    dfs(parent: 0, current: 0)
    
    return answer
}

func dfs(parent: Int, current: Int) {
    for i in 0..<map[current].count {
        if parent == map[current][i] { continue }
        dfs(parent: current, current: map[current][i])
    }
    
    vertice[parent] += vertice[current]
    answer += abs(Int64(vertice[current]))
    vertice[current] = 0
}
