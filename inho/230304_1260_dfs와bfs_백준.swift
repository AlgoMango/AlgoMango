func solution() {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    var nodes: [[Int]] = Array(repeating: [], count: input[0]) // 그래프를 이중 배열로 변환
    var visited: [Int] = [] //방문한 노드들
    var willVisit: [Int] = [input.last!] //방문할 노드(스택/큐 역할)
    
    func dfs() -> [Int] {
        while !willVisit.isEmpty {
            let node = willVisit.removeLast()
            
            if visited.contains(node) { continue }
            
            visited.append(node)
            nodes[node - 1].reversed().forEach { willVisit.append($0) }
        }
        
        return visited
    }
    
    func bfs() -> [Int] {
        while !willVisit.isEmpty {
            let node = willVisit.removeFirst()
            
            if visited.contains(node) { continue }
            
            visited.append(node)
            nodes[node - 1].forEach { willVisit.append($0) }
        }
        
        return visited
    }
    
    for _ in 1...input[1] {
        let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
        
        nodes[input[0] - 1].append(input[1])
        nodes[input[1] - 1].append(input[0])
    }
    
    for i in 0..<nodes.count {
        nodes[i] = nodes[i].sorted()
    }
    
    print(dfs().map { String($0) }.joined(separator: " "))
    visited = []
    willVisit  = [input.last!]
    print(bfs().map { String($0) }.joined(separator: " "))
}

solution()
