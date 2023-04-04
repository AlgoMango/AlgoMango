import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var graph: [String: [String]] = [:]
    var result: [(String, Int)] = []
    
    for arr in tickets {
        if graph[arr[0]] != nil {
            graph[arr[0]]?.append(arr[1])
        } else {
            graph[arr[0]] = [arr[1]]
        }
    }
    
    for (key, value) in graph {
        graph[key] = value.sorted { $0.first! > $1.first! }
    }
    
    var needVisitStack: [(String, Int)] = [("ICN", 0)]
    
    while !needVisitStack.isEmpty {
        let currentNode = needVisitStack.removeLast()
        
        if !result.isEmpty && result.last!.1 >= currentNode.1 {
            while result.last!.1 >= currentNode.1 {
                result.removeLast()
            }
        }
        
        result.append((currentNode.0, currentNode.1))
        
        if graph[currentNode.0] != nil {
            needVisitStack += graph[currentNode.0]!.map { ($0, currentNode.1 + 1) }
        }
        
        if result.count == tickets.count + 1 {
            break
        }
    }
    
    return result.map { $0.0 }
}
