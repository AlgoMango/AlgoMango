//

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let width = input[1], height = input[0]
    let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
    var graph: [[Int]] = []
    var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: width), count: height)
    //3차원 방문 배열이용해서 벽뚫고, 안뚫고를 구분
    
    func bfs() {
        var stack = [(0, 0, 0)]
        var index = 0

        visited[0][0][0] = 1
        
        while index < stack.count {
            let node = stack[index]
            index += 1
            
            if node.0 == width - 1, node.1 == height - 1 {
                return print(visited[node.1][node.0][node.2])
            }
            
            for i in 0..<4 {
                var next = (node.0 + dx[i], node.1 + dy[i], node.2)
                
                if next.0 >= 0, next.0 < width, next.1 >= 0, next.1 < height {
                    if graph[next.1][next.0] == 1, next.2 == 0 { //다음 칸이 벽인데 한번 뚫을 수 있으면
                        visited[next.1][next.0][1] = visited[node.1][node.0][node.2] + 1 //뚫린곳은 [1]에 방문 처리
                        next.2 = 1
                        stack.append(next)
                    } else if graph[next.1][next.0] == 0, visited[next.1][next.0][next.2] == 0 { //다음칸이 길이고 방문하지 않았으면(일반적인 상황)
                        visited[next.1][next.0][node.2] = visited[node.1][node.0][node.2] + 1
                        stack.append(next)
                    }
                }
            }
        }
        return print(-1)
    }
    
    for _ in 0..<height {
        let line = Array(readLine()!).map { Int(String($0))! }
        
        graph.append(line)
    }
    
    bfs()
}

solution()
