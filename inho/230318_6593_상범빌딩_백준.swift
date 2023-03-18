//https://www.acmicpc.net/problem/6593

func solution() {
    while true {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let height = input[0], depth = input[1], width = input[2]
        
        guard height != 0 else { return }
        
        var graph: [[[Character]]] = [] //3차원 배열
        var visited = Array(repeating: Array(repeating: Array(repeating: false, count: width), count: depth), count: height)
        let dx = [1, -1, 0, 0, 0, 0], dy = [0, 0, 1, -1, 0, 0], dz = [0, 0, 0, 0, 1, -1]
        var start: (x: Int, y: Int, z: Int) = (0, 0, 0)
       
        func bfs() {
            var stack = [(start.x, start.y, start.z, 0)]
            var index = 0
            
            while index < stack.count {
                let node = stack[index]
                
                index += 1
                
                for i in 0..<6 {
                    let next = (x: node.0 + dx[i], y: node.1 + dy[i], z: node.2 + dz[i], count: node.3 + 1)
                    
                    guard next.x >= 0, next.x < width, next.y >= 0, next.y < depth, next.z >= 0, next.z < height, !visited[next.z][next.y][next.x] else { continue }
                    
                    visited[next.z][next.y][next.x] = true
                    
                    if graph[next.z][next.y][next.x] == "." {
                        stack.append(next)
                    } else if graph[next.z][next.y][next.x] == "E" {
                        return print("Escaped in \(next.count) minute(s).")
                    }
                }
            }
            print("Trapped!")
        }
        
        for i in 1...height {
            var wall: [[Character]] = []
            
            for j in 1...(depth + 1) {
                let wallInput = Array(readLine()!)
                if !wallInput.isEmpty {
                    if wallInput.contains("S") {
                        start = (wallInput.firstIndex(of: "S")!, j - 1, i - 1)
                    }
                    wall.append(wallInput)
                }
            }
            graph.append(wall)
        }
        
        bfs()
    }
}

solution()
