import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var graph: [String: [(String, Bool)]] = [:]
    var result: [[String]] = []
    var isFinish = false
    
    for arr in tickets {
        if graph[arr[0]] != nil {
            graph[arr[0]]?.append((arr[1], false))
        } else {
            graph[arr[0]] = [(arr[1], false)]
        }
    }
    
    for (key, value) in graph {
        graph[key] = value.sorted { $0.0.first! < $1.0.first! }
    }
    
    func dfs(current: String, depth: Int, route: [String]) {
        var copyRoute = route
        if depth == tickets.count + 1 {
            copyRoute.append(current)
            result.append(copyRoute)
            return
        }
        
        copyRoute.append(current)
        
        guard let copyGraph = graph[current] else {
            return
        }
        
        if !isFinish {
            for index in copyGraph.indices {
                if graph[current]![index].1 == false && !isFinish {
                    graph[current]![index].1 = true
                    dfs(current: graph[current]![index].0, depth: depth + 1, route: copyRoute)
                    graph[current]![index].1 = false
                }
            }
        }
    }
    
    dfs(current: "ICN", depth: 1, route: [])
    
    return result.filter { $0.count == tickets.count + 1}[0]
}
