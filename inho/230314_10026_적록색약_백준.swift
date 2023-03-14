//https://www.acmicpc.net/problem/10026

func solution() {
    let count = Int(readLine()!)!
    let color = ["R": 0, "G": 1, "B": 3]
    var graph = [[Int]]()
    var visited = Array(repeating: Array(repeating: false, count: count), count: count)
    let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
    var result = (0, 0)
    
    func dfs(i: Int, j: Int, color: Int) -> Bool {
        guard graph[i][j] == color, !visited[i][j] else { return false }
        
        visited[i][j] = true
        
        for index in 0...3 {
            let next = (i + dx[index], j + dy[index])
            
            if next.0 < 0 || next.0 == count || next.1 < 0 || next.1 == count { continue }
            
            dfs(i: next.0, j: next.1, color: color)
        }
        
        return true
    }
    //적록색약 용 dfs
    func colorWeaknessDfs(i: Int, j: Int, color: Int) -> Bool {
        guard graph[i][j] + color < 3 || graph[i][j] == color, !visited[i][j] else { return false }
        
        visited[i][j] = true
        
        for index in 0...3 {
            let next = (i + dx[index], j + dy[index])
            
            if next.0 < 0 || next.0 == count || next.1 < 0 || next.1 == count { continue }
            
            colorWeaknessDfs(i: next.0, j: next.1, color: color)
        }
        
        return true
    }
    
    for _ in 0..<count {
        let input: [Int] = Array(readLine()!).map { color[String($0)]! }
        graph.append(input)
    }
    
    for i in 0..<count {
        for j in 0..<count {
            let color = graph[i][j]
            
            if dfs(i: i, j: j, color: color) {
                result.0 += 1
            }
        }
    }
    
    visited = Array(repeating: Array(repeating: false, count: count), count: count) //방문노드 초기화
    
    for i in 0..<count {
        for j in 0..<count {
            let color = graph[i][j]
            
            if colorWeaknessDfs(i: i, j: j, color: color) {
                result.1 += 1
            }
        }
    }
    
    print(result.0, result.1)
}

solution()
