func solution() {
    let graphCount = Int(readLine()!)!
    let branchCount = Int(readLine()!)!
    var graph: [[Int]] = Array(repeating: [], count: graphCount)
    var visited: [Int] = []
    var willVisit: [Int] = [1]
    
    for _ in 1...branchCount {
        let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
        
        graph[input[0] - 1].append(input[1])
        graph[input[1] - 1].append(input[0])
    }
    
    while !willVisit.isEmpty {
        let node = willVisit.removeLast() //dfs
        
        if visited.contains(node) { continue }
        
        visited.append(node)
        graph[node - 1].forEach { willVisit.append($0) }
    }
    
    print(visited.count - 1)
}

solution()
