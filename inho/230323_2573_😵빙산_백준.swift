//https://www.acmicpc.net/problem/2573
//틀렸는데 어디가 잘못됐는지 모르겠습니다,,

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let width = input[1], height = input[0]
    let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
    var graph = [[Int]]()
    var visited = Array(repeating: Array(repeating: false, count: width), count: height)
    var stack = [(Int, Int)]()
    var result = 0
    
    func bfs() {
        var index = 0
        var year = stack.count - 1
        
        while index < stack.count {
            let node = stack[index]
            
            index += 1
            
            for i in 0..<4 {
                let next = (node.0 + dx[i], node.1 + dy[i])
                
                if next.0 >= 0, next.0 < width, next.1 >= 0, next.1 < height, graph[next.1][next.0] > 0 {
                    graph[next.1][next.0] -= 1
                    
                    if graph[next.1][next.0] == 0 {
                        stack.append(next)
                    }
                }
            }
            
            if index == year {
                var area = 0
                var count = 0
                visited = Array(repeating: Array(repeating: false, count: width), count: height)
                result += 1
                year = stack.count - 1
                index = 0
                
                for i in 1..<height {
                    for j in 1..<width {
                        dfs((j, i), &area)
                        
                        if area > 0 {
                            count += 1
                            area = 0
                        }
                    }
                }
                
                if count > 1 {
                    return print(result)
                }
                
                if graph.flatMap({ $0 }).filter({ $0 != 0 }).isEmpty {
                    return print(0)
                }
            }
        }
        print(0)
    }
    
    func dfs(_ now: (Int, Int),_ depth: inout Int) {
        visited[now.1][now.0] = true
        
        for i in 0..<4 {
            let next = (now.0 + dx[i], now.1 + dy[i])
            
            if next.0 >= 0, next.0 < width, next.1 >= 0, next.1 < height, !visited[next.1][next.0], graph[next.1][next.0] != 0 {
                depth += 1
                dfs(next, &depth)
            }
        }
    }
    
    for i in 1...height {
        let ices = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        for j in 0..<ices.count {
            if ices[j] == 0 {
                stack.append((j, i-1))
            }
        }
        
        graph.append(ices)
    }
    
    bfs()
}

solution()
