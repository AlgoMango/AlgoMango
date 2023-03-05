import Foundation

let computerCount = Int(readLine()!)!
var graph: [String: [String]] = [:]

for computer in 1...computerCount {
    graph[String(computer)] = []
}

let branchCount = Int(readLine()!)!

for _ in 1...branchCount {
    let connect = readLine()!.components(separatedBy: " ")
    
    graph[connect[0]]!.append(connect[1])
    graph[connect[1]]!.append(connect[0])
}

func bfs(graph: [String: [String]]) -> Int {
    var visitQueue: [String] = []
    var needVisitQueue: [String] = ["1"]
    
    while !needVisitQueue.isEmpty {
        let currentNode = needVisitQueue.removeLast()
        
        if visitQueue.contains(currentNode) {
            continue
        }
        
        visitQueue.append(currentNode)
        needVisitQueue += graph[currentNode]!
    }
    
    return visitQueue.count
}

print(bfs(graph: graph) - 1)
