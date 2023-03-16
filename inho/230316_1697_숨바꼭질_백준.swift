//https://www.acmicpc.net/problem/1697

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let current = input[0], target = input[1]
    var visited = Array(repeating: false, count: target * 2)
    
    func bfs() {
        var stack = [(current, 0)]
        var index = 0
        
        visited[stack.first!.0] = true
        
        while index < stack.count {
            let node = stack[index]
            
            index += 1
            
            if node.0 == target {
                return print(node.1)
            }
            
            for i in 1...3 {
                let next: Int
                
                if i == 1 {
                    next = node.0 + 1
                } else if i == 2 {
                    next = node.0 - 1
                } else {
                    next = node.0 * 2
                }
                
                if next >= 0, next < visited.count, !visited[next] {
                    stack.append((next, node.1 + 1))
                    visited[next] = true
                }
            }
        }
    }
    
    current < target ? bfs() : print(current - target)
}

solution()
