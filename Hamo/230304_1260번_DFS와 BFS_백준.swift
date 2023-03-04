import Foundation

let graphInformation = readLine()!.components(separatedBy: " ").map { Int($0)! }
var graph: [Int: [Int]] = [:]

for i in 1...graphInformation[0] {
    graph[i] = []
}

for i in 1...graphInformation[1] {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    
    graph[input[0]]!.append(input[1])
    graph[input[1]]!.append(input[0])
    
    if graph[input[0]]!.count > 1 {
        graph[input[0]]?.sort()
    }
    
    if graph[input[1]]!.count > 1 {
        graph[input[1]]?.sort()
    }
}

func bfs(graph: [Int: [Int]], start: Int) -> [String] {
    var visitedQueue: [Int] = []
    var mustVisitQueue: [Int] = [start]
    
    while !mustVisitQueue.isEmpty {
        let currentNode = mustVisitQueue.removeFirst()
        
        if visitedQueue.contains(currentNode) {
            continue
        }
        
        visitedQueue.append(currentNode)
        mustVisitQueue += graph[currentNode]!
    }
    
    return visitedQueue.map { String($0) }
}

func dfs(graph: [Int: [Int]], start: Int) -> [String] {
    var visitedQueue: [Int] = []
    var mustVisitStack: [Int] = [start]
    
    while !mustVisitStack.isEmpty {
        let currentNode = mustVisitStack.removeLast()
        
        if visitedQueue.contains(currentNode) {
            continue
        }
        
        visitedQueue.append(currentNode)
        mustVisitStack += graph[currentNode]!.reversed()
    }
    
    return visitedQueue.map { String($0) }
}

let dfsResult = dfs(graph: graph, start: graphInformation[2])
let bfsResult = bfs(graph: graph, start: graphInformation[2])

print(dfsResult.joined(separator: " "))
print(bfsResult.joined(separator: " "))
