//https://www.acmicpc.net/problem/2178
//시간초과 지옥,,

func solution() {
    let size = readLine()!.split(separator: " ").map { Int(String($0))! }
    let width = size[1], height = size[0]
    let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
    var graph: [[Bool]] = []
    var result = 0
    
    func bfs() {
        var queue: [[Int]] = [[0,0,1]]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            result = node.last!
            
            if node[0] == height - 1, node[1] == width - 1 { return }
            
            for i in 0...3 {
                let next = [node[0] + dx[i], node[1] + dy[i], node.last! + 1]
                
                guard next[0] >= 0, next[0] < height,
                      next[1] >= 0, next[1] < width
                else {
                    continue
                }
                
                if graph[next[0]][next[1]] == true {
                    queue.append(next)
                }
            }
            graph[node[0]][node[1]] = false
        }
    }
    
    for _ in 1...height {
        let inputs = Array(readLine()!).map { Int(String($0))! }
        
        graph.append(inputs.map { $0 == 1  })
    }
    
    bfs()
    print(result)
}

solution()
