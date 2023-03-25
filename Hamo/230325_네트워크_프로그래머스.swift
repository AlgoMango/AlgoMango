import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    let width = n
    let height = computers.count
    var visits: [Int] = Array(repeating: 0, count: height)
    var graph: [Int: [Int]] = [:]
    var result = 0
    
    for i in 0..<height {
        for j in 0..<width {
            if computers[i][j] == 1 {
                if graph[i] == nil {
                    graph[i] = [j]
                } else {
                    graph[i]?.append(j)
                }
            }
        }
    }
    
    for (key, _) in graph {
        if visits[key] == 0 {
            result += 1
            var needVisitQueue: [Int] = [key]
            var index = 0
            
            while index < needVisitQueue.count {
                let currentNode = needVisitQueue[index]
                index += 1
                
                if visits[currentNode] == 1 {
                    continue
                }
                
                visits[currentNode] = 1
                needVisitQueue += graph[currentNode]!
            }
        }
    }
    
    return result
}
