//https://www.acmicpc.net/problem/7569

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let height = input[2], depth = input[1], width = input[0]
    var graph: [[[Int]]] = []
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: width), count: depth), count: height)
    let dx = [1, -1, 0, 0, 0, 0], dy = [0, 0, 1, -1, 0, 0], dz = [0, 0, 0, 0, 1, -1]
    var stack = [(Int, Int, Int)]()
    var result = 0
    
    func bfs() {
        var index = 0
        
        while index < stack.count {
            let node = stack[index]
            
            index += 1
            result += 1
            
            for i in 0..<6 {
                let next = (x: node.0 + dx[i], y: node.1 + dy[i], z: node.2 + dz[i])
                
                guard next.x >= 0, next.x < width, next.y >= 0, next.y < depth, next.z >= 0, next.z < height, !visited[next.z][next.y][next.x] else { continue }
                
                visited[next.z][next.y][next.x] = true
                
                if graph[next.z][next.y][next.x] == 0 {
                    graph[next.z][next.y][next.x] = graph[node.2][node.1][node.0] + 1
                    stack.append(next)
                }
            }
        }

        let flatten = graph.flatMap( { $0 }).flatMap({ $0 })
        
        flatten.contains(0) ? print(-1) : print(flatten.max()! - 1)
    }
    
    for i in 1...height {
        var box: [[Int]] = []
        
        for j in 1...depth {
            let boxInput = readLine()!.split(separator: " ").map { Int(String($0))! }
            box.append(boxInput)
            
            if boxInput.contains(1) {
                for z in 0..<boxInput.count {
                    if boxInput[z] == 1 {
                        let x = z, y = j-1, z = i-1
                        
                        stack.append((x, y, z))
                        visited[z][y][x] = true
                    }
                }
            }
        }
        
        graph.append(box)
    }
    
    bfs()
}

solution()
